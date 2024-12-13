Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D45E7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 11:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1F210EFE9;
	Fri, 13 Dec 2024 11:56:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE4810EFE9;
 Fri, 13 Dec 2024 11:56:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Fdirtyf?=
 =?utf-8?q?b=3A_Add_skip_condition_for_bmg_platform_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Dec 2024 11:56:36 -0000
Message-ID: <173409099671.2118650.11659669754530256773@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241113174118.158849-1-mohammed.thasleem@intel.com>
In-Reply-To: <20241113174118.158849-1-mohammed.thasleem@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

== Series Details ==

Series: tests/intel/kms_dirtyfb: Add skip condition for bmg platform (rev3)
URL   : https://patchwork.freedesktop.org/series/141312/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15836_full -> IGTPW_12309_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12309_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12309_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/index.html

Participating hosts (11 -> 12)
------------------------------

  Additional (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12309_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_create@hog-create:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-snb4/igt@gem_create@hog-create.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-snb2/igt@gem_create@hog-create.html

  * igt@gem_mmap_offset@blt-coherency:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@gem_mmap_offset@blt-coherency.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@load:
    - shard-dg2:          ([PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26]) -> ([PASS][27], [PASS][28], [PASS][29], [PASS][30], [PASS][31], [DMESG-WARN][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-4/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-8/igt@i915_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-2/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-7/igt@i915_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-6/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-1/igt@i915_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-8/igt@i915_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-5/igt@i915_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-4/igt@i915_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-2/igt@i915_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-11/igt@i915_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-3/igt@i915_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-7/igt@i915_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-11/igt@i915_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-5/igt@i915_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-10/igt@i915_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-7/igt@i915_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-10/igt@i915_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-4/igt@i915_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-5/igt@i915_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-11/igt@i915_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-6/igt@i915_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@i915_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-2/igt@i915_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-6/igt@i915_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-7/igt@i915_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-2/igt@i915_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-2/igt@i915_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@i915_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@i915_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-11/igt@i915_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-11/igt@i915_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-5/igt@i915_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-1/igt@i915_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@i915_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-6/igt@i915_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-8/igt@i915_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@i915_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-4/igt@i915_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-5/igt@i915_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-4/igt@i915_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-7/igt@i915_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-8/igt@i915_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-4/igt@i915_module_load@load.html

  * igt@kms_async_flips@crc-atomic:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][49]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@kms_async_flips@crc-atomic.html
    - shard-dg1:          NOTRUN -> [WARN][50]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-12/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [CRASH][51] +3 other tests crash
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-12/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@smem-oom:
    - shard-dg2:          [TIMEOUT][52] ([i915#5493]) -> [WARN][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-6/igt@gem_lmem_swapping@smem-oom.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-8/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [FAIL][54] ([i915#13334]) -> [FAIL][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-5/igt@gem_tiled_swapping@non-threaded.html

  
Known issues
------------

  Here are the changes found in IGTPW_12309_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#6230])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-3/igt@api_intel_bb@crc32.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#9318])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-10/igt@debugfs_test@basic-hwmon.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - shard-rkl:          [PASS][58] -> [DMESG-WARN][59] ([i915#12964]) +35 other tests dmesg-warn
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-7/igt@dmabuf@all-tests@dma_fence_chain.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#8414]) +19 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-4/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#8414]) +8 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-13/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3281]) +14 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#7697])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3936])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-8/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3936])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3555] / [i915#9323])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#3555] / [i915#9323])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-6/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#13008])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-8/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#9323])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][70] ([i915#7697])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-4/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#6335])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-2/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#6335])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#8562])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#8562])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-12/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][75] ([i915#12353]) +1 other test incomplete
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk1/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@file:
    - shard-snb:          NOTRUN -> [SKIP][76] ([i915#1099]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-snb2/igt@gem_ctx_persistence@file.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#8555]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#8555])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg1:          NOTRUN -> [FAIL][79] ([i915#11980] / [i915#12580])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@gem_ctx_persistence@hostile.html
    - shard-mtlp:         NOTRUN -> [FAIL][80] ([i915#11980] / [i915#12580])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-8/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#280])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#280])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-6/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#280])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-5/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [PASS][84] -> [ABORT][85] ([i915#10030] / [i915#7975] / [i915#8213])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-11/igt@gem_eio@hibernate.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-7/igt@gem_eio@hibernate.html
    - shard-rkl:          NOTRUN -> [ABORT][86] ([i915#7975] / [i915#8213])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-4/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][87] -> [FAIL][88] ([i915#12543] / [i915#5784])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-12/igt@gem_eio@reset-stress.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][89] -> [FAIL][90] ([i915#12714] / [i915#5784])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-17/igt@gem_eio@unwedge-stress.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4771])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-6/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@hog:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4812])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#4525]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#4525])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-10/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [ABORT][95] ([i915#11713])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-3/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#6334]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-7/igt@gem_exec_capture@capture-invisible.html
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#6334]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#6344])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-3/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3539] / [i915#4852]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-11/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#3539] / [i915#4852])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3281]) +12 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-13/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#3281]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-4/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#3281])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-6/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4537] / [i915#4812])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#7276])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][106] ([i915#11441] / [i915#13304]) +1 other test incomplete
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          [PASS][107] -> [INCOMPLETE][108] ([i915#13196]) +1 other test incomplete
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk8/igt@gem_exec_suspend@basic-s3@smem.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk6/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4860])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-2/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#4860]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#4613] / [i915#7582])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#4613] / [i915#7582])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#4613]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-4/igt@gem_lmem_swapping@heavy-random.html
    - shard-glk:          NOTRUN -> [SKIP][114] ([i915#4613]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk8/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@massive:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#4613]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-3/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][116] ([i915#5493]) +1 other test timeout
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap@big-bo:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4083])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@big-bo-tiledx:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#4077]) +9 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@gem_mmap_gtt@big-bo-tiledx.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4077]) +10 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-rkl:          [PASS][120] -> [DMESG-WARN][121] ([i915#12917] / [i915#12964])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-1/igt@gem_mmap_gtt@medium-copy-odd.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#4083]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-13/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#3282]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@gem_partial_pwrite_pread@reads-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#3282])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-8/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#3282]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-8/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#3282]) +10 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@gem_pwrite@basic-exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][127] ([i915#2658])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-snb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          NOTRUN -> [TIMEOUT][128] ([i915#12917] / [i915#12964]) +1 other test timeout
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#4270]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#4270]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-12/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#5190] / [i915#8428]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-6/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#4079])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#8411]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#4885])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#3297] / [i915#3323])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#3297]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#3297])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#3282] / [i915#3297])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-4/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#3297]) +4 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-10/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#3297] / [i915#4880])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#3297] / [i915#4958])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3297]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][143] +421 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-snb2/igt@gem_vm_create@invalid-create.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][144] ([i915#12964])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#2527] / [i915#2856])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#2527]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#2527] / [i915#2856]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-9/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#2856]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@gen9_exec_parse@unaligned-access.html
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#2527]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [PASS][150] -> [ABORT][151] ([i915#13010])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-6/igt@i915_module_load@reload-no-display.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#8399]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-3/igt@i915_pm_freq_api@freq-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#8399])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-8/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#6590]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-13/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][155] +35 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#11681] / [i915#6621])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-12/igt@i915_pm_rps@basic-api.html
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#11681] / [i915#6621])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-2/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#11681])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-7/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu-1:       NOTRUN -> [SKIP][159] ([i915#4387])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][160] -> [SKIP][161] ([i915#7984])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-2/igt@i915_power@sanity.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-5/igt@i915_power@sanity.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#5723])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@perf:
    - shard-tglu:         NOTRUN -> [ABORT][163] ([i915#13010]) +1 other test abort
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-3/igt@i915_selftest@perf.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#4212])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#4215])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#4212])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#4215] / [i915#5190])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-4/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          [PASS][168] -> [INCOMPLETE][169] ([i915#12761] / [i915#1982]) +1 other test incomplete
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk8/igt@kms_async_flips@async-flip-suspend-resume.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][170] ([i915#12964]) +32 other tests dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#8709]) +11 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-2-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#8709]) +7 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@crc:
    - shard-dg1:          NOTRUN -> [WARN][173] ([i915#13287])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@kms_async_flips@crc.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][174] ([i915#13287] / [i915#9878])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-snb7/igt@kms_async_flips@crc.html
    - shard-dg2:          NOTRUN -> [WARN][175] ([i915#13287])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][176] ([i915#13287])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][177] ([i915#13287])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][178] ([i915#13287])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-snb7/igt@kms_async_flips@crc@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [CRASH][179] ([i915#13287]) +3 other tests crash
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@kms_async_flips@crc@pipe-c-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [CRASH][180] ([i915#13287]) +3 other tests crash
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#1769] / [i915#3555]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#1769] / [i915#3555])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][183] ([i915#1769])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-snb7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#4538] / [i915#5286]) +3 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-13/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#5286])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#5286]) +11 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#5286]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#5286]) +7 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#3638]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-5/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#3638]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-13/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#5190])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#4538] / [i915#5190]) +7 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#4538]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][195] ([i915#12313])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#12805])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#6095]) +154 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#6095]) +19 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][199] -> [INCOMPLETE][200] ([i915#12796])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#6095]) +94 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#12313]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-13/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#12313])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#10307] / [i915#6095]) +174 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#6095]) +100 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#6095]) +9 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#6095]) +19 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#7828]) +9 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-8/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][209] +13 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@gamma:
    - shard-mtlp:         NOTRUN -> [SKIP][210] +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-5/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#7828]) +9 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#7828]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#7828]) +8 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#7828]) +8 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#7828])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#3555] / [i915#9979])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-10/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@kms_content_protection@atomic-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#6944] / [i915#9424])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-8/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#7118] / [i915#9424])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#9424])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#3116]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#3116] / [i915#3299])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#9433])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-12/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#6944] / [i915#9424])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#6944] / [i915#7116] / [i915#7118])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-10/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#7118] / [i915#7162] / [i915#9424])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#7116] / [i915#9424]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#3555]) +5 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#8814])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#3555]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#13049]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#13049]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#13049]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#13049])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][235] ([i915#12358] / [i915#7882])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][236] ([i915#12358])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk7/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#13046] / [i915#5354]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#4103]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          [PASS][239] -> [FAIL][240] ([i915#2346])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-snb1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#9067])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#4103]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#9833])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#9723])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#3555]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#8588])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#8588])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          [PASS][248] -> [SKIP][249] ([i915#3555])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#1257])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-8/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#8812])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#8812])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#3840])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#3555] / [i915#3840])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-3/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#3555] / [i915#3840]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#3840] / [i915#9053])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#3955]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#1839])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#1839])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#9337])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#658])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#658])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#4881])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#3637]) +10 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-9/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#3637])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#9934]) +6 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#8381])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#8381])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#3637])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#4423] / [i915#9934])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-12/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#9934]) +5 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#9934]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
    - shard-tglu:         [PASS][273] -> [FAIL][274] ([i915#11989]) +1 other test fail
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-8/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-tglu-1:       [PASS][275] -> [FAIL][276] ([i915#11989]) +1 other test fail
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-mtlp:         [PASS][277] -> [FAIL][278] ([i915#11989]) +6 other tests fail
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-panning:
    - shard-dg1:          [PASS][279] -> [DMESG-WARN][280] ([i915#4423]) +3 other tests dmesg-warn
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-17/igt@kms_flip@flip-vs-panning.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][281] ([i915#12745] / [i915#4839])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][282] ([i915#12745])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#2672] / [i915#3555]) +7 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#2672]) +7 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#2672] / [i915#3555]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#2672] / [i915#3555] / [i915#8813])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#2672] / [i915#8813])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#2587] / [i915#2672] / [i915#3555])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#2587] / [i915#2672]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#2672] / [i915#3555]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#2587] / [i915#2672]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#2672] / [i915#3555] / [i915#5190])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#2672])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-dg2:          [PASS][294] -> [FAIL][295] ([i915#6880])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][296] +25 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][297] +47 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#5354]) +29 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#5439])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#3458]) +12 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#4423] / [i915#8708])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#3458]) +16 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#5439])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][304] +96 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#8708]) +18 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#3023]) +32 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#8708]) +9 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#1825]) +3 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#1825]) +52 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#3555] / [i915#8228])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#12713])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#3555] / [i915#8228])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#3555] / [i915#8228]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#3555] / [i915#8228])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-13/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#10656])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#12388])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#12339])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#4070] / [i915#4816])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#6301])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][320] ([i915#13026]) +1 other test incomplete
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][321] ([i915#12169])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk4/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][322] ([i915#10647]) +1 other test fail
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk4/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][323] ([i915#8292])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#12247] / [i915#9423])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#12247]) +3 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#12247]) +12 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#12247]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#12247]) +17 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#12247] / [i915#6953]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#12247]) +19 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#12247] / [i915#3555])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#12247] / [i915#3555])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#12247] / [i915#3555])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#12247] / [i915#6953])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#5354])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#9812])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-4/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#5978])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#3361])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#8430])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][340] ([i915#9519])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#9519])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-rkl:          [PASS][342] -> [SKIP][343] ([i915#12916])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-7/igt@kms_pm_rpm@drm-resources-equal.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][344] -> [SKIP][345] ([i915#9519]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#9519])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu-1:       NOTRUN -> [SKIP][347] ([i915#9519]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#6524])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-3/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#6524])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-4/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#11520]) +4 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#11520]) +7 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#11520]) +10 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][353] ([i915#11520]) +11 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
    - shard-tglu-1:       NOTRUN -> [SKIP][354] ([i915#11520]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#11520]) +7 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][356] ([i915#11520]) +12 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-snb7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#9683])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#9683])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][359] ([i915#9732]) +7 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#9688]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-5/igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#9732]) +25 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-8/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-no-drrs:
    - shard-glk:          NOTRUN -> [SKIP][362] +336 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk4/igt@kms_psr@psr-no-drrs.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#1072] / [i915#9732]) +20 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][364] ([i915#1072] / [i915#9732]) +15 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-5/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#1072] / [i915#9732]) +30 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][366] ([i915#9685]) +2 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#9685])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#9685]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][369] ([i915#12755]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#5289])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#12755])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-8/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#5289])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#5289])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][374] ([i915#5289])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#3555]) +7 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu-1:       NOTRUN -> [ABORT][376] ([i915#13179]) +1 other test abort
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html
    - shard-dg1:          NOTRUN -> [ABORT][377] ([i915#13179]) +1 other test abort
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@kms_selftest@drm_framebuffer.html
    - shard-snb:          NOTRUN -> [ABORT][378] ([i915#13179]) +1 other test abort
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-snb5/igt@kms_selftest@drm_framebuffer.html
    - shard-mtlp:         NOTRUN -> [ABORT][379] ([i915#13179]) +1 other test abort
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-7/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][380] ([i915#13179]) +1 other test abort
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-11/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][381] ([IGT#160])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-6/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][382] ([IGT#160] / [i915#6493])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-13/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#8623])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][384] ([i915#8623])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][385] ([i915#12276]) +1 other test incomplete
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flipline:
    - shard-tglu-1:       NOTRUN -> [SKIP][386] ([i915#3555]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][387] ([i915#3555] / [i915#9906])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#9906])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg1:          NOTRUN -> [SKIP][389] ([i915#2437])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-12/igt@kms_writeback@writeback-check-output.html
    - shard-tglu:         NOTRUN -> [SKIP][390] ([i915#2437])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-10/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#2437] / [i915#9412])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][392] ([i915#2437] / [i915#9412])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg1:          NOTRUN -> [SKIP][393] ([i915#2437] / [i915#9412])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-12/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@blocking@0-rcs0:
    - shard-rkl:          [PASS][394] -> [FAIL][395] ([i915#10538]) +1 other test fail
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-4/igt@perf@blocking@0-rcs0.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@perf@blocking@0-rcs0.html

  * igt@perf@mi-rpc:
    - shard-rkl:          NOTRUN -> [SKIP][396] ([i915#2434])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][397] ([i915#2435])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][398] ([i915#2433])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-1/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][399] -> [FAIL][400] ([i915#4349]) +1 other test fail
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][401] ([i915#8516])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [PASS][402] -> [INCOMPLETE][403] ([i915#13341])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk9/igt@perf_pmu@rc6-suspend.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk9/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][404] ([i915#8516])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][405] ([i915#3708] / [i915#4077]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-5/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][406] ([i915#3708])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-17/igt@prime_vgem@fence-flip-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][407] ([i915#3708])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-3/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#3708]) +2 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-5/igt@prime_vgem@fence-read-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][409] ([i915#3708]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-4/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - shard-tglu:         NOTRUN -> [FAIL][410] ([i915#12910]) +28 other tests fail
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg2:          NOTRUN -> [SKIP][411] ([i915#9917])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-5/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
    - shard-mtlp:         NOTRUN -> [FAIL][412] ([i915#12910]) +8 other tests fail
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-2/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries_display_on:
    - shard-mtlp:         [ABORT][413] -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-2/igt@debugfs_test@read_all_entries_display_on.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-3/igt@debugfs_test@read_all_entries_display_on.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][415] ([i915#7297]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-1/igt@gem_ccs@suspend-resume.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][417] ([i915#12392] / [i915#7297]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-1/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-8/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [INCOMPLETE][419] ([i915#13306]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk8/igt@gem_softpin@noreloc-s3.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk6/igt@gem_softpin@noreloc-s3.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][421] ([i915#9820]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         [ABORT][423] ([i915#13010]) -> [PASS][424] +1 other test pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-2/igt@i915_selftest@live@sanitycheck.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-9/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [INCOMPLETE][425] ([i915#4817]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-glk2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-glk9/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-tglu:         [FAIL][427] ([i915#10991]) -> [PASS][428] +1 other test pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-9/igt@kms_async_flips@alternate-sync-async-flip.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [FAIL][429] ([i915#5956]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg1:          [FAIL][431] ([i915#5956]) -> [PASS][432] +1 other test pass
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-mtlp:         [FAIL][433] ([i915#2346]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-mtlp:         [FAIL][435] ([i915#11989]) -> [PASS][436] +1 other test pass
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-mtlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-mtlp-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          [FAIL][437] ([i915#6880]) -> [PASS][438] +1 other test pass
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-snb:          [SKIP][439] -> [PASS][440] +1 other test pass
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [SKIP][441] ([i915#3555] / [i915#8228]) -> [PASS][442] +1 other test pass
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-7/igt@kms_hdr@static-toggle.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-10/igt@kms_hdr@static-toggle.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][443] ([i915#4281]) -> [PASS][444]
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-tglu-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][445] ([i915#9519]) -> [PASS][446] +2 other tests pass
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][447] ([i915#9519]) -> [PASS][448]
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg1:          [DMESG-WARN][449] ([i915#4423]) -> [PASS][450] +2 other tests pass
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-dg1-12/igt@kms_rotation_crc@bad-pixel-format.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-dg1-14/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-rkl:          [DMESG-WARN][451] ([i915#12964]) -> [PASS][452] +28 other tests pass
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-2/igt@kms_rotation_crc@exhaust-fences.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/shard-rkl-6/igt@kms_rotation_crc@exhaust-fences.html

  * igt@prime_busy@hang:
    - shard-rkl:          [DMESG-WARN][453] ([i915#12917] / [i915#12964]) -> [PASS][454] +2 other tests pass
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15836/shard-rkl-3/igt@prime_busy@hang.html
   [45

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12309/index.html
