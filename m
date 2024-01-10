Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3896926537830977242=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU3luYyBpOTE1X3BjaWlkLmggKHJl?=
 =?utf-8?b?djMp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Date: Wed, 10 Jan 2024 14:11:25 -0000
Message-ID: <170489588501.240792.18419509035326074469@5338d5abeb45>
References: <20240110081532.1378038-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240110081532.1378038-1-chaitanya.kumar.borah@intel.com>
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

--===============3896926537830977242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Sync i915_pciid.h (rev3)
URL   : https://patchwork.freedesktop.org/series/128259/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14107_full -> IGTPW_10499_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10499_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10499_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/index.html

Participating hosts (10 -> 8)
------------------------------

  Missing    (2): shard-snb-0 pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10499_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_create@madvise@smem:
    - shard-rkl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-5/igt@gem_exec_create@madvise@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@gem_exec_create@madvise@smem.html

  * igt@kms_flip@flip-vs-rmfb@a-hdmi-a4:
    - shard-dg1:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg1-19/igt@kms_flip@flip-vs-rmfb@a-hdmi-a4.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-14/igt@kms_flip@flip-vs-rmfb@a-hdmi-a4.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][5] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-d-edp-1.html

  * igt@prime_vgem@sync@vecs0:
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@prime_vgem@sync@vecs0.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
    - shard-snb:          [SKIP][7] ([fdo#109271]) -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html

  
Known issues
------------

  Here are the changes found in IGTPW_10499_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#6230])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8411])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-14/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8411]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#9318])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#7701])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#8414]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#8414])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-13/igt@drm_fdinfo@all-busy-idle-check-all.html

  * igt@drm_fdinfo@busy-idle-check-all@ccs3:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8414]) +31 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@drm_fdinfo@busy-idle-check-all@ccs3.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][17] ([i915#7742])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#3936])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#9323]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#9323]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-2/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][23] -> [INCOMPLETE][24] ([i915#7297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#7697])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@gem_close_race@multigpu-basic-threads.html
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#7697])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#6335])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@hog-create@smem0:
    - shard-mtlp:         NOTRUN -> [FAIL][28] ([i915#8758])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@gem_create@hog-create@smem0.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([fdo#109314])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#8555])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#1099]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-14/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#280]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_ctx_sseu@mmap-args.html
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#280])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-rkl:          NOTRUN -> [ABORT][35] ([i915#7975] / [i915#8213])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-5/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4771])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_exec_balancer@bonded-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#4771])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@hog:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4812])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-19/igt@gem_exec_balancer@hog.html
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4812])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#4525]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#6334]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#6334])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@many-4k-incremental:
    - shard-mtlp:         NOTRUN -> [FAIL][43] ([i915#9606])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@gem_exec_capture@many-4k-incremental.html
    - shard-dg2:          NOTRUN -> [FAIL][44] ([i915#9606])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_exec_capture@many-4k-incremental.html
    - shard-rkl:          NOTRUN -> [FAIL][45] ([i915#9606])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@gem_exec_capture@many-4k-incremental.html

  * igt@gem_exec_fair@basic-flow:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3539] / [i915#4852]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_exec_fair@basic-flow.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][47] ([i915#2842]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [PASS][48] -> [FAIL][49] ([i915#2842])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][50] ([i915#2876])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3539]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][52] ([i915#2842]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-rkl:          NOTRUN -> [FAIL][53] ([i915#2842]) +2 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3539] / [i915#4852])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#5107])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([fdo#112283])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-range:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#3281]) +7 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@gem_exec_reloc@basic-range.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3281]) +9 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3281]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-14/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3281]) +9 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][62] -> [INCOMPLETE][63] ([i915#9275])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> [ABORT][64] ([i915#7975] / [i915#8213])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4860]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4860]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4860]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#4613]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4613]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4613]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4565])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-19/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#4613]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-6/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3282]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-4/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#8289])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4077])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@gem_mmap_gtt@bad-object.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4077]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-3/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4083]) +9 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4083]) +6 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@gem_mmap_wc@read-write.html

  * igt@gem_mmap_wc@write:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4083])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-13/igt@gem_mmap_wc@write.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [INCOMPLETE][80] ([i915#10042])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk9/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3282]) +8 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3282]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4270]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-19/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#4270]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#4270]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4270]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4270]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3282]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#8428]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#8411])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4079]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4885])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4077]) +11 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4079])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-18/igt@gem_tiled_pread_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#4079]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3297] / [i915#4880])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#3297])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#3297]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#3297] / [i915#4958])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-18/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#3297])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen3_render_tiledx_blits:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([fdo#109289]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([fdo#109289]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#2527]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@gen9_exec_parse@bb-start-out.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#2527]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-13/igt@gen9_exec_parse@bb-start-out.html
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#2527] / [i915#2856])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-2/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#2856]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#2856]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@load:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#6227])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-15/igt@i915_module_load@load.html
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#6227])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk3/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [PASS][110] -> [WARN][111] ([i915#7356])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-5/igt@i915_module_load@reload-with-fault-injection.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#7091])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#8399]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([fdo#109289]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rps@thresholds-idle-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#8925])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@i915_pm_rps@thresholds-idle-park@gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#8925])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-13/igt@i915_pm_rps@thresholds-idle-park@gt0.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([fdo#109303])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-2/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@mock@memory_region:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][118] ([i915#9311])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@i915_selftest@mock@memory_region.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][119] ([i915#9311])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk4/igt@i915_selftest@mock@memory_region.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#7707]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@intel_hwmon@hwmon-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#7707])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#4212]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4212]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-18/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [FAIL][124] ([i915#8247]) +3 other tests fail
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][125] ([i915#8247]) +3 other tests fail
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#3555])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#1769] / [i915#3555])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4538] / [i915#5286]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([fdo#111614]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [PASS][130] -> [FAIL][131] ([i915#5138])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#5286]) +6 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([fdo#111615] / [i915#5286]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([fdo#111614]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-4/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([fdo#111614]) +7 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([fdo#111614] / [i915#3638]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#3638]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         [PASS][138] -> [FAIL][139] ([i915#3743])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#5190]) +17 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#6187]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([fdo#110723]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([fdo#111615]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#4538] / [i915#5190]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#4538]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-13/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([fdo#111615]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#2705])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#5354] / [i915#6095]) +24 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-4/igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#5354]) +69 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#5354] / [i915#6095]) +22 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-5/igt@kms_ccs@pipe-b-crc-primary-basic-yf-tiled-ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#5354] / [i915#6095]) +27 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-4/igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][152] ([fdo#109271]) +316 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk8/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#5354]) +29 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-mtl-rc-ccs:
    - shard-snb:          NOTRUN -> [SKIP][154] ([fdo#109271]) +182 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb1/igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#5354] / [i915#6095]) +18 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#7213]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#4087]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#7828]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#7828]) +5 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-10/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([fdo#111827]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([fdo#111827])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([fdo#111827])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#7828]) +11 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#7828]) +9 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#7828]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_color@deep-color@pipe-a-edp-1-degamma:
    - shard-mtlp:         [PASS][166] -> [FAIL][167] ([i915#6892]) +1 other test fail
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-4/igt@kms_color@deep-color@pipe-a-edp-1-degamma.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@kms_color@deep-color@pipe-a-edp-1-degamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#6944])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3299]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#3116])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#3299])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#6944] / [i915#7116] / [i915#7118])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#7118]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#9424])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_content_protection@mei-interface.html
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#8063] / [i915#9433])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#3555]) +4 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#3359])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#3555]) +7 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#3555] / [i915#8814])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#3359])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3359])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#8814]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([fdo#111825]) +17 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([fdo#109274] / [i915#5354]) +4 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#9809]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][186] ([fdo#109274]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-snb:          [PASS][188] -> [SKIP][189] ([fdo#109271] / [fdo#111767])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([fdo#111767])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#9067])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#4103])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#4103])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#9723])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#8588])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#8588])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#8588])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#3804])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#1257])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_dp_aux_dev.html
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#1257])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-15/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#8812])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#3555] / [i915#3840])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3840] / [i915#9053])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#1839])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#3637]) +8 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([fdo#109274] / [i915#3637]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([fdo#111767] / [fdo#111825]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([fdo#111767] / [i915#3637])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([fdo#109274] / [fdo#111767]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([fdo#111767] / [fdo#111825])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-15/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([fdo#109274]) +8 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([fdo#111825] / [i915#9934]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#8381])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@kms_flip@flip-vs-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#8381])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#2672]) +7 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#2587] / [i915#2672]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#2672]) +4 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#2672]) +7 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#2587] / [i915#2672]) +4 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#3555] / [i915#8810])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#2672] / [i915#3555])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#2672] / [i915#3555])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-snb:          [PASS][223] -> [SKIP][224] ([fdo#109271]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#1825]) +20 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#8708]) +10 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#3458]) +6 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#8708]) +10 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([fdo#111825] / [i915#1825]) +39 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([fdo#111825]) +12 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#8708]) +20 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#10070])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#10070])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([fdo#110189]) +12 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([fdo#109280]) +21 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#3458]) +18 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#3023]) +22 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#3555] / [i915#8228])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#3555] / [i915#8228]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#3555] / [i915#8228])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#3555] / [i915#8228])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#3555] / [i915#8228]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#4816])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#6301])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][245] ([i915#7862]) +1 other test fail
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8821])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8821])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][248] ([i915#8292])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][249] ([i915#8292])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#9423]) +7 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#9423]) +23 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#5176] / [i915#9423]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#9423]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-9/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#9423]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#5235]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#5235]) +9 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#5235]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#3555] / [i915#5235]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#5235] / [i915#9423]) +27 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#5978])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#3361])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#9519])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#9519])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#9519])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][265] -> [SKIP][266] ([i915#9519]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#6524])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#6524] / [i915#6805])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#9683]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-15/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#9683]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#9683]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#9683])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([fdo#111068] / [i915#9683])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#4235])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([fdo#111615] / [i915#5289])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#4235] / [i915#5190])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-rkl:          [PASS][277] -> [INCOMPLETE][278] ([i915#8875] / [i915#9569])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-6/igt@kms_rotation_crc@sprite-rotation-270.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#4235])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#3555]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#3555]) +3 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-9/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][282] ([i915#5465]) +3 other tests fail
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8823])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [PASS][284] -> [FAIL][285] ([IGT#2])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_sysfs_edid_timing.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#8623])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#8623])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-tglu:         [PASS][288] -> [FAIL][289] ([i915#9196])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#9906])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#9906])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#2437] / [i915#9412])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][293] ([fdo#109271] / [i915#2437]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk4/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([fdo#109289]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         NOTRUN -> [FAIL][295] ([i915#4349])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-dg1:          NOTRUN -> [FAIL][296] ([i915#4349])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-18/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][297] ([i915#4349]) +3 other tests fail
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#8850])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@perf_pmu@cpu-hotplug.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#8850])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-19/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#8516])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][301] ([i915#5493])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#3708])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#3708])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-18/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#3708] / [i915#4077])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#3291] / [i915#3708])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#3708])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-3/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#3708] / [i915#4077]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@sync@vcs1:
    - shard-mtlp:         NOTRUN -> [ABORT][308] ([i915#8875])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@prime_vgem@sync@vcs1.html

  * igt@runner@aborted:
    - shard-snb:          NOTRUN -> [FAIL][309] ([i915#7812])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb6/igt@runner@aborted.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#9917]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#9917])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#9917])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-rkl:          NOTRUN -> [FAIL][313] ([i915#9781])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-snb:          NOTRUN -> [FAIL][314] ([i915#9781])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb1/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-tglu:         NOTRUN -> [FAIL][315] ([i915#9781])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-2/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-glk:          NOTRUN -> [FAIL][316] ([i915#9781])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk3/igt@syncobj_timeline@invalid-wait-zero-handles.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([fdo#109307])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_submit_cl@simple-flush-cache:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#2575]) +14 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@v3d/v3d_submit_cl@simple-flush-cache.html
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#2575]) +5 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-15/igt@v3d/v3d_submit_cl@simple-flush-cache.html

  * igt@v3d/v3d_submit_csd@bad-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#2575]) +4 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@v3d/v3d_submit_csd@bad-bo.html

  * igt@v3d/v3d_submit_csd@valid-multisync-submission:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([fdo#109315]) +10 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-5/igt@v3d/v3d_submit_csd@valid-multisync-submission.html

  * igt@v3d/v3d_wait_bo@bad-pad:
    - shard-tglu:         NOTRUN -> [SKIP][322] ([fdo#109315] / [i915#2575]) +5 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-8/igt@v3d/v3d_wait_bo@bad-pad.html

  * igt@vc4/vc4_mmap@mmap-bo:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#7711]) +7 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@vc4/vc4_mmap@mmap-bo.html

  * igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#7711]) +6 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html

  * igt@vc4/vc4_purgeable_bo@free-purged-bo:
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#2575]) +5 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-3/igt@vc4/vc4_purgeable_bo@free-purged-bo.html

  * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#7711]) +10 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html

  * igt@vc4/vc4_wait_bo@unused-bo-1ns:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#7711]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-14/igt@vc4/vc4_wait_bo@unused-bo-1ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@virtual-idle:
    - shard-dg2:          [SKIP][328] ([i915#5608]) -> [PASS][329] +5 other tests pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@drm_fdinfo@virtual-idle.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@drm_fdinfo@virtual-idle.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-rkl:          [FAIL][330] ([i915#2842]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-4/igt@gem_exec_fair@basic-none@rcs0.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_vm_create@execbuf:
    - shard-dg2:          [SKIP][332] ([i915#2575]) -> [PASS][333] +138 other tests pass
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_vm_create@execbuf.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_vm_create@execbuf.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [INCOMPLETE][334] ([i915#9820] / [i915#9849]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          [FAIL][336] ([i915#3591]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_suspend@forcewake:
    - shard-tglu:         [ABORT][338] -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-tglu-9/igt@i915_suspend@forcewake.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-5/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][340] ([i915#5138]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         [FAIL][342] ([i915#3743]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-dg2:          [SKIP][344] ([fdo#109315]) -> [PASS][345] +44 other tests pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][346] ([i915#2346]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@single-move@all-pipes:
    - shard-mtlp:         [DMESG-WARN][348] ([i915#2017]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@kms_cursor_legacy@single-move@all-pipes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-snb:          [SKIP][350] ([fdo#109271]) -> [PASS][351] +5 other tests pass
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2:          [SKIP][352] ([i915#9980]) -> [PASS][353] +3 other tests pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][354] ([i915#9519]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-rkl:          [ABORT][356] ([i915#8875]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-rkl:          [INCOMPLETE][358] ([i915#8875] / [i915#9569]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-mtlp:         [FAIL][360] ([i915#9196]) -> [PASS][361]
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-tglu:         [FAIL][362] ([i915#9196]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][364] -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-glk3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1.html

  * igt@perf_pmu@frequency@gt0:
    - shard-mtlp:         [SKIP][366] -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-2/igt@perf_pmu@frequency@gt0.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@perf_pmu@frequency@gt0.html

  
#### Warnings ####

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          [SKIP][368] ([i915#5608]) -> [SKIP][369] ([i915#8414]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle-all.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          [SKIP][370] ([i915#2575]) -> [SKIP][371] ([i915#7697])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_basic@multigpu-create-close.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2:          [SKIP][372] ([i915#2575]) -> [SKIP][373] ([i915#8555])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          [SKIP][374] ([i915#2575]) -> [SKIP][375] ([i915#4771])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          [SKIP][376] ([i915#2575]) -> [SKIP][377] ([i915#4036])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_fair@basic-none-share:
    - shard-dg2:          [SKIP][378] ([i915#2575]) -> [SKIP][379] ([i915#3539] / [i915#4852]) +3 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_exec_fair@basic-none-share.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@gem_exec_fair@basic-none-share.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          [SKIP][380] ([i915#2575]) -> [SKIP][381] ([i915#3281]) +14 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_exec_reloc@basic-gtt.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          [SKIP][382] ([i915#2575]) -> [SKIP][383] ([i915#4537] / [i915#4812]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          [SKIP][384] ([i915#2575]) -> [SKIP][385] ([i915#4860]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          [SKIP][386] ([i915#2575]) -> [SKIP][387] ([i915#4077]) +8 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-dg2:          [SKIP][388] ([i915#2575]) -> [SKIP][389] ([i915#4083]) +3 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_mmap_wc@write-cpu-read-wc.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          [SKIP][390] ([i915#2575]) -> [SKIP][391] ([i915#3282]) +4 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          [ABORT][392] -> [WARN][393] ([i915#2658])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-snb5/igt@gem_pwrite@basic-exhaustion.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          [SKIP][394] ([i915#2575]) -> [SKIP][395] ([i915#4270]) +5 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_pxp@display-protected-crc.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_pxp@display-protected-crc.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2:          [SKIP][396] ([i915#2575] / [i915#5190]) -> [SKIP][397] ([i915#5190]) +7 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_render_copy@linear-to-vebox-yf-tiled.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          [SKIP][398] ([i915#2575]) -> [SKIP][399] ([i915#4079])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_tiled_pread_basic.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_tiled_pread_basic.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          [SKIP][400] ([i915#2575]) -> [SKIP][401] ([i915#4879])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_unfence_active_buffers.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          [SKIP][402] ([i915#2575]) -> [SKIP][403] ([i915#3297])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg2:          [SKIP][404] ([i915#2575]) -> [SKIP][405] ([i915#2856]) +2 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gen9_exec_parse@secure-batches.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_fb_tiling:
    - shard-dg2:          [SKIP][406] ([i915#2575]) -> [SKIP][407] ([i915#4881])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@i915_fb_tiling.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [ABORT][408] ([i915#9820]) -> [INCOMPLETE][409] ([i915#9849])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-tglu:         [FAIL][410] ([i915#3591]) -> [WARN][411] ([i915#2681])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg2:          [SKIP][412] ([i915#2575]) -> [SKIP][413] ([fdo#109303])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@i915_query@query-topology-known-pci-ids.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          [SKIP][414] ([i915#2575]) -> [SKIP][415] ([fdo#109302])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@i915_query@query-topology-unsupported.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@i915_query@query-topology-unsupported.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          [SKIP][416] ([i915#2575]) -> [SKIP][417] ([i915#4212]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - shard-mtlp:         [DMESG-FAIL][418] ([i915#8561]) -> [FAIL][419] ([i915#8247]) +2 other tests fail
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-5/igt@kms_async_flips@crc@pipe-d-edp-1.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@kms_async_flips@crc@pipe-d-edp-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          [SKIP][420] ([i915#2575]) -> [SKIP][421] ([i915#9531])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          [SKIP][422] ([i915#2575]) -> [SKIP][423] ([i915#1769] / [i915#3555])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2:          [SKIP][424] ([fdo#109315]) -> [SKIP][425] ([fdo#111614]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          [SKIP][426] ([fdo#109315] / [i915#5190]) -> [SKIP][427] ([i915#5190]) +8 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          [SKIP][428] ([fdo#109315] / [i915#5190]) -> [SKIP][429] ([i915#4538] / [i915#5190]) +4 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-dg2:          [SKIP][430] ([fdo#109315]) -> [SKIP][431] ([i915#5354]) +78 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          [SKIP][432] ([i915#2575]) -> [SKIP][433] ([fdo#111827]) +3 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_chamelium_color@degamma.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          [SKIP][434] ([i915#2575]) -> [SKIP][435] ([i915#7828]) +9 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          [SKIP][436] ([i915#2575]) -> [SKIP][437] ([i915#3299])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          [SKIP][438] ([i915#2575]) -> [SKIP][439] ([i915#3359]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          [SKIP][440] ([i915#2575]) -> [SKIP][441] ([i915#3555]) +4 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/index.html

--===============3896926537830977242==
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
<tr><td><b>Series:</b></td><td>Sync i915_pciid.h (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128259/">https://patchwork.freedesktop.org/series/128259/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14107_full -&gt; IGTPW_10499_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10499_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10499_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/index.html</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): shard-snb-0 pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10499_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_create@madvise@smem:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-5/igt@gem_exec_create@madvise@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@gem_exec_create@madvise@smem.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg1-19/igt@kms_flip@flip-vs-rmfb@a-hdmi-a4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-14/igt@kms_flip@flip-vs-rmfb@a-hdmi-a4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-d-edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@vecs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@prime_vgem@sync@vecs0.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10499_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-14/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@drm_fdinfo@all-busy-check-all.html">SKIP</a> ([i915#8414]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-13/igt@drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@ccs3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@drm_fdinfo@busy-idle-check-all@ccs3.html">SKIP</a> ([i915#8414]) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-2/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_create@hog-create@smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@gem_create@hog-create@smem0.html">FAIL</a> ([i915#8758])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb6/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-14/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-5/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-19/igt@gem_exec_balancer@hog.html">SKIP</a> ([i915#4812])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@gem_exec_balancer@hog.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-incremental:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> ([i915#9606])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> ([i915#9606])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_exec_fair@basic-flow.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2876])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_exec_fair@basic-sync.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_exec_fence@submit67.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@gem_exec_reloc@basic-range.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_exec_reloc@basic-wc.html">SKIP</a> ([i915#3281]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-14/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> ([i915#3281]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> ([i915#9275])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860]) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([fdo#109271] / [i915#4613]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@gem_lmem_swapping@massive-random.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-19/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-6/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-4/igt@gem_madvise@dontneed-before-exec.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@gem_mmap_gtt@bad-object.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-3/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">SKIP</a> ([i915#4077]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@gem_mmap_wc@read-write.html">SKIP</a> ([i915#4083]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-13/igt@gem_mmap_wc@write.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk9/igt@gem_pread@exhaustion.html">INCOMPLETE</a> ([i915#10042])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> ([i915#3282]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@gem_pwrite@basic-self.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-19/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@gem_readwrite@beyond-eob.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> ([i915#4077]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-18/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#4079])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-18/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@gen3_render_tiledx_blits.html">SKIP</a> ([fdo#109289]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@gen7_exec_parse@chained-batch.html">SKIP</a> ([fdo#109289]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-13/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-2/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([i915#2856]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-15/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk3/igt@i915_module_load@load.html">SKIP</a> ([fdo#109271] / [i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@i915_module_load@reload-with-fault-injection.html">WARN</a> ([i915#7356])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#7091])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@i915_pm_rps@thresholds-idle-park@gt0.html">SKIP</a> ([i915#8925])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-13/igt@i915_pm_rps@thresholds-idle-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-2/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311])</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk4/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311])</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@intel_hwmon@hwmon-write.html">SKIP</a> ([i915#7707]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-8/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-18/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#111615] / [i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-4/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614] / [i915#3638]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190]) +17 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#6187]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> ([fdo#110723]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> ([fdo#111615]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-13/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> ([i915#4538]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-4/igt@kms_ccs@pipe-b-bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#5354] / [i915#6095]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_ccs@pipe-b-bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> ([i915#5354]) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-5/igt@kms_ccs@pipe-b-crc-primary-basic-yf-tiled-ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-4/igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk8/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> ([fdo#109271]) +316 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@kms_ccs@pipe-d-bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> ([i915#5354]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb1/igt@kms_ccs@pipe-d-bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> ([fdo#109271]) +182 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-10/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> ([fdo#111827]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-edp-1-degamma:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-4/igt@kms_color@deep-color@pipe-a-edp-1-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@kms_color@deep-color@pipe-a-edp-1-degamma.html">FAIL</a> ([i915#6892]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-4/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_content_protection@lic.html">SKIP</a> ([i915#7118]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-8/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#8063] / [i915#9433])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#3359])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> ([i915#8814]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#111825]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [i915#5354]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([i915#9809]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([fdo#109274]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#111767] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#109271] / [fdo#111767])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#111767])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-15/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> ([i915#3637]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([fdo#109274] / [i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([fdo#111767] / [fdo#111825]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([fdo#111767] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([fdo#109274] / [fdo#111767]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-15/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([fdo#111767] / [fdo#111825])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> ([fdo#109274]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> ([fdo#111825] / [i915#9934]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([fdo#109271]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> ([i915#1825]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> ([i915#10070])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> ([i915#10070])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([fdo#110189]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> ([fdo#109280]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> ([i915#3458]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> ([i915#3023]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#7862]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-2.html">SKIP</a> ([i915#9423]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4.html">SKIP</a> ([i915#9423]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5176] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-9/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5235]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> ([i915#5235]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-3.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-edp-1.html">SKIP</a> ([i915#3555] / [i915#5235]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-2.html">SKIP</a> ([i915#5235] / [i915#9423]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-15/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#9683]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#9683]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#9683]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-2/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([fdo#111615] / [i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#4235] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-6/igt@kms_rotation_crc@sprite-rotation-270.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@kms_rotation_crc@sprite-rotation-270.html">INCOMPLETE</a> ([i915#8875] / [i915#9569])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-9/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1-pipe-b-hdmi-a-1.html">FAIL</a> ([i915#5465]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> ([i915#3555] / [i915#8823])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_sysfs_edid_timing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-16/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk4/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> ([i915#4349])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-18/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> ([i915#4349])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-19/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> ([i915#5493])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@prime_vgem@basic-fence-flip.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-18/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-1/igt@prime_vgem@basic-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@prime_vgem@basic-read.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-3/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@prime_vgem@sync@vcs1.html">ABORT</a> ([i915#8875])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb6/igt@runner@aborted.html">FAIL</a> ([i915#7812])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> ([i915#9917]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> ([i915#9917])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb1/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-2/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk3/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@simple-flush-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@v3d/v3d_submit_cl@simple-flush-cache.html">SKIP</a> ([i915#2575]) +14 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-15/igt@v3d/v3d_submit_cl@simple-flush-cache.html">SKIP</a> ([i915#2575]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@v3d/v3d_submit_csd@bad-bo.html">SKIP</a> ([i915#2575]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@valid-multisync-submission:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-5/igt@v3d/v3d_submit_csd@valid-multisync-submission.html">SKIP</a> ([fdo#109315]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@bad-pad:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-8/igt@v3d/v3d_wait_bo@bad-pad.html">SKIP</a> ([fdo#109315] / [i915#2575]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_mmap@mmap-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@vc4/vc4_mmap@mmap-bo.html">SKIP</a> ([i915#7711]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-7/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html">SKIP</a> ([i915#7711]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@free-purged-bo:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-3/igt@vc4/vc4_purgeable_bo@free-purged-bo.html">SKIP</a> ([i915#2575]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained.html">SKIP</a> ([i915#7711]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@unused-bo-1ns:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-14/igt@vc4/vc4_wait_bo@unused-bo-1ns.html">SKIP</a> ([i915#7711]) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@drm_fdinfo@virtual-idle.html">SKIP</a> ([i915#5608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-6/igt@drm_fdinfo@virtual-idle.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-4/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-2/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@execbuf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_vm_create@execbuf.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_vm_create@execbuf.html">PASS</a> +138 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9820] / [i915#9849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-tglu-9/igt@i915_suspend@forcewake.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-5/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">PASS</a> +44 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html">DMESG-WARN</a> ([i915#2017]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@kms_cursor_legacy@single-move@all-pipes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> ([i915#9980]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">ABORT</a> ([i915#8875]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-rkl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">INCOMPLETE</a> ([i915#8875] / [i915#9569]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-glk3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-glk9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-2/igt@perf_pmu@frequency@gt0.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-5/igt@perf_pmu@frequency@gt0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#5608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#8414]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_exec_fair@basic-none-share.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@gem_exec_fair@basic-none-share.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_exec_reloc@basic-gtt.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_exec_reloc@basic-gtt.html">SKIP</a> ([i915#3281]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#4077]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_mmap_wc@write-cpu-read-wc.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_mmap_wc@write-cpu-read-wc.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-snb5/igt@gem_pwrite@basic-exhaustion.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-snb5/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_render_copy@linear-to-vebox-yf-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@gem_render_copy@linear-to-vebox-yf-tiled.html">SKIP</a> ([i915#5190]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@i915_fb_tiling.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9849])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">WARN</a> ([i915#2681])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-mtlp-5/igt@kms_async_flips@crc@pipe-d-edp-1.html">DMESG-FAIL</a> ([i915#8561]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-mtlp-6/igt@kms_async_flips@crc@pipe-d-edp-1.html">FAIL</a> ([i915#8247]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-7/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109315] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#5190]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109315] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> ([i915#5354]) +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_chamelium_color@degamma.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@kms_chamelium_color@degamma.html">SKIP</a> ([fdo#111827]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-10/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10499/shard-dg2-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14107/shard-dg2-11/igt">SKIP</a> ([i915#2575]) -&gt; [SKIP][441] ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3896926537830977242==--
