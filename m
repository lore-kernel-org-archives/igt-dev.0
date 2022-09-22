Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8935998391739303909=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 22 Sep 2022 15:44:22 -0000
Message-ID: <166386146224.19670.7802721067048962872@emeril.freedesktop.org>
References: <20220922013552.29453-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220922013552.29453-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Ffrontbuffer=5Ftracking=3A_Convert_tests_to_dynamic?=
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

--===============8935998391739303909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_frontbuffer_tracking: Convert tests to dynamic
URL   : https://patchwork.freedesktop.org/series/108857/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6660_full -> IGTPW_7818_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7818_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7818_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/index.html

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7818_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb5/igt@i915_pm_rpm@cursor-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-iclb4/igt@i915_pm_rpm@cursor-dpms.html

  * {igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-render} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3] +305 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-tglb5/igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-render.html

  * {igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][4] +219 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-iclb2/igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * {igt@kms_frontbuffer_tracking@format-draw} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][5] +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-rkl-1/igt@kms_frontbuffer_tracking@format-draw.html

  * {igt@kms_frontbuffer_tracking@format-draw@fbcpsrdrrs-rgb101010-draw-blt} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][6] +113 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-tglu-4/igt@kms_frontbuffer_tracking@format-draw@fbcpsrdrrs-rgb101010-draw-blt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_create@create-clear@smem0:
    - {shard-rkl}:        NOTRUN -> [INCOMPLETE][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-rkl-5/igt@gem_create@create-clear@smem0.html

  * igt@vgem_basic@unload:
    - {shard-rkl}:        NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-rkl-5/igt@vgem_basic@unload.html

  
New tests
---------

  New tests have been introduced between IGT_6660_full and IGTPW_7818_full:

### New IGT tests (909) ###

  * igt@kms_flip_event_leak@basic@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_flip_event_leak@basic@pipe-a-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.42, 0.50] s

  * igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.62] s

  * igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_flip_event_leak@basic@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_flip_event_leak@basic@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_flip_event_leak@basic@pipe-b-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.21, 1.23] s

  * igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.38] s

  * igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_flip_event_leak@basic@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_flip_event_leak@basic@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_flip_event_leak@basic@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.19, 1.21] s

  * igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.33] s

  * igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_flip_event_leak@basic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_flip_event_leak@basic@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_frontbuffer_tracking@draw:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.48, 1.74] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 pass(s)
    - Exec time: [0.50, 1.72] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 pass(s)
    - Exec time: [0.48, 1.66] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 5 pass(s)
    - Exec time: [0.48, 1.66] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 5 pass(s)
    - Exec time: [0.48, 1.72] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-indfb-draw-render:
    - Statuses : 5 pass(s)
    - Exec time: [0.55, 1.74] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.50, 1.76] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 pass(s)
    - Exec time: [0.50, 1.71] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 pass(s)
    - Exec time: [0.48, 1.73] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 pass(s)
    - Exec time: [0.48, 1.73] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 5 pass(s)
    - Exec time: [0.64, 2.08] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 5 pass(s)
    - Exec time: [0.52, 1.79] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 5 pass(s)
    - Exec time: [1.10, 2.37] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 pass(s)
    - Exec time: [1.55, 2.77] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 pass(s)
    - Exec time: [1.10, 2.27] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 pass(s)
    - Exec time: [1.12, 2.31] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 pass(s)
    - Exec time: [1.10, 2.30] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 5 pass(s)
    - Exec time: [1.12, 2.37] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.90, 2.17] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 pass(s)
    - Exec time: [1.57, 3.24] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 pass(s)
    - Exec time: [0.90, 2.13] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 pass(s)
    - Exec time: [0.90, 2.11] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 pass(s)
    - Exec time: [0.90, 2.31] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 5 pass(s)
    - Exec time: [0.90, 2.18] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 5 pass(s)
    - Exec time: [0.90, 2.17] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 pass(s)
    - Exec time: [0.90, 2.11] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 pass(s)
    - Exec time: [0.90, 2.11] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 pass(s)
    - Exec time: [0.92, 2.11] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 pass(s)
    - Exec time: [0.99, 2.38] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 5 pass(s)
    - Exec time: [0.90, 2.17] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 5 pass(s)
    - Exec time: [1.15, 2.43] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 pass(s)
    - Exec time: [1.17, 2.35] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 pass(s)
    - Exec time: [1.15, 2.37] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 pass(s)
    - Exec time: [1.15, 2.37] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 pass(s)
    - Exec time: [1.15, 2.37] s

  * igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 5 pass(s)
    - Exec time: [1.15, 2.43] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.22] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.13] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.13] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.22] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.01] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.96] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.95] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.98] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.96] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.96] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.23] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.01] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.26] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.20] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.18] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.18] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.18] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.25] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.71] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.72] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.63] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.96] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.77] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.70] s

  * igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.76] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.08] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.65] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.58] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.57] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.54] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.61] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.65] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.66] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.59] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.88] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.53] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.92] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.69] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.40] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.29] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.65] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.32] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.31] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.40] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.03] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.98] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.33] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.98] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.18] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.01] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.04] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.94] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.33] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.98] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.36] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.07] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.48] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.35] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.71] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.37] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.39] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.44] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.66] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.58] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.56] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.56] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.60] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-indfb-draw-render:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.63] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.63] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.60] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.89] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.53] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.90] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.69] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.33] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.29] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.58] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.30] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.26] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.39] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.00] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.97] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.26] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.92] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.14] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.02] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.05] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.99] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.26] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.92] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.24] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.06] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.40] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.29] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.65] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.36] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.33] s

  * igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.39] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-cur-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-spr-indfb-draw-render:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@farfromfence:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@farfromfence@drrs-farfromfence-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@farfromfence@fbc-farfromfence-mmap-gtt:
    - Statuses : 5 pass(s)
    - Exec time: [1.22, 3.54] s

  * igt@kms_frontbuffer_tracking@farfromfence@fbcdrrs-farfromfence-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@farfromfence@fbcpsr-farfromfence-mmap-gtt:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.56] s

  * igt@kms_frontbuffer_tracking@farfromfence@fbcpsrdrrs-farfromfence-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@farfromfence@psr-farfromfence-mmap-gtt:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.53] s

  * igt@kms_frontbuffer_tracking@farfromfence@psrdrrs-farfromfence-mmap-gtt:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-1p-primscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-1p-primscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-2p-primscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-2p-primscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@drrs-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbc-1p-primscrn-indfb-msflip-blt:
    - Statuses : 4 pass(s)
    - Exec time: [0.97, 1.85] s

  * igt@kms_frontbuffer_tracking@flip@fbc-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 4 pass(s)
    - Exec time: [1.62, 2.57] s

  * igt@kms_frontbuffer_tracking@flip@fbc-1p-primscrn-indfb-plflip-blt:
    - Statuses : 4 pass(s)
    - Exec time: [0.97, 1.96] s

  * igt@kms_frontbuffer_tracking@flip@fbc-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 4 pass(s)
    - Exec time: [0.99, 1.87] s

  * igt@kms_frontbuffer_tracking@flip@fbc-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 4 pass(s)
    - Exec time: [0.99, 1.87] s

  * igt@kms_frontbuffer_tracking@flip@fbc-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 4 pass(s)
    - Exec time: [0.99, 1.97] s

  * igt@kms_frontbuffer_tracking@flip@fbc-2p-primscrn-indfb-msflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.10] s

  * igt@kms_frontbuffer_tracking@flip@fbc-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@kms_frontbuffer_tracking@flip@fbc-2p-primscrn-indfb-plflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.23] s

  * igt@kms_frontbuffer_tracking@flip@fbc-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.13] s

  * igt@kms_frontbuffer_tracking@flip@fbc-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.13] s

  * igt@kms_frontbuffer_tracking@flip@fbc-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.26] s

  * igt@kms_frontbuffer_tracking@flip@fbc-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_frontbuffer_tracking@flip@fbc-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_frontbuffer_tracking@flip@fbc-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.82] s

  * igt@kms_frontbuffer_tracking@flip@fbc-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.72] s

  * igt@kms_frontbuffer_tracking@flip@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.72] s

  * igt@kms_frontbuffer_tracking@flip@fbc-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.83] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-primscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-primscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-1p-primscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-1p-primscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-primscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-primscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-scndscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-scndscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-scndscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@psr-1p-primscrn-indfb-msflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.35] s

  * igt@kms_frontbuffer_tracking@flip@psr-1p-primscrn-indfb-pgflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.41] s

  * igt@kms_frontbuffer_tracking@flip@psr-1p-primscrn-indfb-plflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.49] s

  * igt@kms_frontbuffer_tracking@flip@psr-1p-primscrn-shrfb-msflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.37] s

  * igt@kms_frontbuffer_tracking@flip@psr-1p-primscrn-shrfb-pgflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.38] s

  * igt@kms_frontbuffer_tracking@flip@psr-1p-primscrn-shrfb-plflip-blt:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.49] s

  * igt@kms_frontbuffer_tracking@flip@psr-2p-primscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@psr-2p-primscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@psr-2p-primscrn-indfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@psr-2p-primscrn-shrfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@psr-2p-primscrn-shrfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@psr-2p-primscrn-shrfb-plflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@psr-2p-scndscrn-indfb-msflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@flip@psr-2p-scndscrn-indfb-pgflip-blt:
    - Statuses : 4 skip(s)
    - Exec time: [0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/index.html

--===============8935998391739303909==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_frontbuffer_tracking: Convert tests to dynamic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108857/">https://patchwork.freedesktop.org/series/108857/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6660_full -&gt; IGTPW_7818_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7818_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7818_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7818_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb5/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-iclb4/igt@i915_pm_rpm@cursor-dpms.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-render} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-tglb5/igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> +305 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-iclb2/igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> +219 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@format-draw} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-rkl-1/igt@kms_frontbuffer_tracking@format-draw.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@format-draw@fbcpsrdrrs-rgb101010-draw-blt} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-tglu-4/igt@kms_frontbuffer_tracking@format-draw@fbcpsrdrrs-rgb101010-draw-blt.html">SKIP</a> +113 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_create@create-clear@smem0:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-rkl-5/igt@gem_create@create-clear@smem0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7818/shard-rkl-5/igt@vgem_basic@unload.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6660_full and IGTPW_7818_full:</p>
<h3>New IGT tests (909)</h3>
<ul>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.42, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.21, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.19, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.48, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.50, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.48, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.48, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.48, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.55, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.50, 1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.50, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.48, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.48, 1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.64, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.52, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.10, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.55, 2.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.10, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.12, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.10, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.12, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.90, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.57, 3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.90, 2.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.90, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.90, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.90, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.90, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.90, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.90, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.92, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.99, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.90, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.15, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.17, 2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.15, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.15, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.15, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.15, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@fbcpsrdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@draw@psrdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@farfromfence:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@farfromfence@drrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@farfromfence@fbc-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.22, 3.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@farfromfence@fbcdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@farfromfence@fbcpsr-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@farfromfence@fbcpsrdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@farfromfence@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@farfromfence@psrdrrs-farfromfence-mmap-gtt:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.97, 1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.62, 2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.97, 1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.99, 1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.99, 1.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.99, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@fbcpsrdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@flip@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8935998391739303909==--
