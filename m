Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5276FC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 23:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE45112720;
	Mon,  4 Mar 2024 23:50:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85920112720;
 Mon,  4 Mar 2024 23:50:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6299748513369516415=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/2=5D_tests/intel-ci/xe=3A_Block_PSR_+_DRRS_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Mar 2024 23:50:22 -0000
Message-ID: <170959622252.503981.6367484632126632536@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304101252.3242812-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240304101252.3242812-1-bhanuprakash.modem@intel.com>
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

--===============6299748513369516415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/intel-ci/xe: Block PSR + DRRS tests
URL   : https://patchwork.freedesktop.org/series/130660/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14382_full -> IGTPW_10769_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10769_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10769_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/index.html

Participating hosts (8 -> 9)
------------------------------

  Additional (1): shard-snb-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10769_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-10ms:
    - shard-dg1:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-17/igt@gem_eio@in-flight-10ms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@gem_eio@in-flight-10ms.html
    - shard-dg2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-5/igt@gem_eio@in-flight-10ms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@gem_eio@in-flight-10ms.html

  * igt@gem_exec_balancer@individual:
    - shard-dg1:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-17/igt@gem_exec_balancer@individual.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@gem_exec_balancer@individual.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-dg2:          [PASS][8] -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-11/igt@i915_pm_rpm@gem-idle.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [TIMEOUT][10] +4 other tests timeout
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-hdmi-a-2:
    - shard-glk:          [PASS][12] -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-glk3/igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-hdmi-a-2.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk3/igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-hdmi-a-2.html

  
#### Warnings ####

  * igt@kms_content_protection@lic-type-0:
    - shard-snb:          [SKIP][14] ([fdo#109271]) -> [INCOMPLETE][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb4/igt@kms_content_protection@lic-type-0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-dg2:          [SKIP][16] ([i915#8708]) -> [TIMEOUT][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_14382_full and IGTPW_10769_full:

### New IGT tests (1) ###

  * igt@gem_lmem_swapping:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_10769_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#8411])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-8/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][19] ([i915#9408] / [i915#9618])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@idle@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][20] ([i915#7742])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@drm_fdinfo@idle@rcs0.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8414]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@drm_fdinfo@virtual-busy-all.html
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#8414]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@drm_fdinfo@virtual-busy-all.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#8414]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-8/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#3555] / [i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#6335])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#6335])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#8562])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#8555])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#8555]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#280]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#280]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-8/igt@gem_ctx_sseu@mmap-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][37] -> [FAIL][38] ([i915#5784])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-6/igt@gem_eio@reset-stress.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4771]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@gem_exec_balancer@bonded-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4771])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@gem_exec_balancer@bonded-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#4771])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-8/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4036])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#4525])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4812])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@many-4k-incremental:
    - shard-glk:          NOTRUN -> [FAIL][45] ([i915#9606])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk9/igt@gem_exec_capture@many-4k-incremental.html
    - shard-dg1:          NOTRUN -> [FAIL][46] ([i915#9606])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@gem_exec_capture@many-4k-incremental.html

  * igt@gem_exec_fair@basic-none:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4473] / [i915#4771]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][48] ([i915#2842])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglu:         NOTRUN -> [FAIL][49] ([i915#2842])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-6/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglu:         [PASS][50] -> [FAIL][51] ([i915#2842])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-tglu-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3539]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3539])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][54] ([i915#2842]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([fdo#109313])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3539] / [i915#4852]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3539] / [i915#4852]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#7697])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([fdo#112283]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-read:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3281]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@gem_exec_reloc@basic-cpu-read.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#3281]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3281]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3281]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4812])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@gem_exec_schedule@semaphore-power.html
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4537] / [i915#4812])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4860]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4860])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4860]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4613]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-tglu:         NOTRUN -> [SKIP][70] ([i915#4613])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#4613]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#4613]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk5/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4565])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_mmap_gtt@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4077]) +9 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-5/igt@gem_mmap_gtt@basic.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4077]) +14 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4083]) +6 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@write:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#4083]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@gem_mmap_wc@write.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4083]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3282]) +6 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#3282]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-3/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_pread@bench:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3282]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@gem_pread@bench.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][82] ([i915#2658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk3/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#3282]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4270]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4270]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#4270]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-4/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#4270]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4270]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#8428]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#5190]) +5 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4077]) +10 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4079]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3297]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3297] / [i915#4880])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3297] / [i915#4880])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#3297])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-3/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#3297]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#3297]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([fdo#109289]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-3/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#2527]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@gen9_exec_parse@bb-secure.html
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#2856]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#2527]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#2856]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_fb_tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#4881])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][106] ([i915#9820] / [i915#9849])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          [PASS][107] -> [INCOMPLETE][108] ([i915#9820] / [i915#9849])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [INCOMPLETE][109] ([i915#9820] / [i915#9849])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#8399]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#6590])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([fdo#109289]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([fdo#109293] / [fdo#109506])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@thresholds-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#8925])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@i915_pm_rps@thresholds-park@gt0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#4387])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-7/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#6188])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([fdo#109303])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@i915_query@query-topology-known-pci-ids.html
    - shard-tglu:         NOTRUN -> [SKIP][118] ([fdo#109303])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-4/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#4212]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#4212])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#3826])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#8709]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#1769] / [i915#3555])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([fdo#111614]) +6 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4538] / [i915#5286]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#5286]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#5286])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([fdo#111615] / [i915#5286]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([fdo#111614])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-9/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([fdo#111614] / [i915#3638]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([fdo#111614]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#3638])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         [PASS][133] -> [FAIL][134] ([i915#3743]) +1 other test fail
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#6187])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4538] / [i915#5190]) +10 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([fdo#111615])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([fdo#110723]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([fdo#111615]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([fdo#111615]) +8 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#4538]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#2705])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#2705])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-5/igt@kms_big_joiner@invalid-modeset.html
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#2705])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#7213]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-a-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#4087]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-d-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#7828]) +12 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#7828]) +7 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([fdo#111827]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([fdo#111827]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([fdo#111827])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([fdo#111827]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#7828]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-9/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#7828]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#7828]) +8 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#3116])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#3299])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#3116] / [i915#3299])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#3299])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#6944] / [i915#9424])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#9424]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#7118])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#7118] / [i915#9424])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#3555] / [i915#8814]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#3555])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#3359]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#3359]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#3359])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#3555]) +6 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#8814])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#3555]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([fdo#111767] / [fdo#111825]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
    - shard-dg2:          NOTRUN -> [SKIP][174] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-snb:          [PASS][175] -> [SKIP][176] ([fdo#109271]) +6 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][177] ([fdo#109274]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#4103])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#4103] / [i915#4213])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#9809]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([fdo#109274] / [i915#5354]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-snb:          [PASS][182] -> [SKIP][183] ([fdo#109271] / [fdo#111767])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][184] ([i915#2346])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#9067])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#4213])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#9723])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3804])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#1257])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#8812])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#3555] / [i915#3840])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#3840])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3840])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#3555] / [i915#3840])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#3469])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#3955])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#1839])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#658])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#658])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([fdo#111825]) +6 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([fdo#109274] / [i915#3637] / [i915#3966])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([fdo#111767] / [fdo#111825])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#8381])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#8381])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([fdo#109274]) +4 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#3637]) +5 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([fdo#109274] / [i915#3637]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([fdo#111825] / [i915#9934]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#8381])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#2672])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#2672]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#2672]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#8810])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#3555] / [i915#8810]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#2587] / [i915#2672]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#2672] / [i915#3555])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([fdo#109285])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([fdo#111825] / [i915#1825]) +33 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [FAIL][219] ([i915#6880])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#5439])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#3458]) +21 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#3458]) +15 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([fdo#111825]) +25 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#1825]) +25 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#5354]) +30 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([fdo#111767] / [i915#5354])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([fdo#111767] / [fdo#111825] / [i915#1825]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#8708]) +23 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-glk:          NOTRUN -> [SKIP][229] ([fdo#109271]) +149 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk4/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#8708]) +7 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([fdo#109280]) +12 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#3023]) +21 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#8708]) +14 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#433])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#3555] / [i915#8228]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#3555] / [i915#8228]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@kms_hdr@static-toggle-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#3555] / [i915#8228])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#9457]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#4816])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#1839])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#6301]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([fdo#109289]) +4 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([fdo#109289]) +7 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][244] ([i915#4573]) +3 other tests fail
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk9/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#3555] / [i915#8821]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8821])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][247] ([i915#8292])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#9423]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#9423]) +7 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#9423]) +5 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#5176]) +9 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#5235]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#5235]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#5235]) +5 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#3555] / [i915#5235])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#5235] / [i915#9423]) +15 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#5235]) +11 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#5354])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#5354])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#3361])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#9685])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#9340])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#9519])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [PASS][264] -> [SKIP][265] ([i915#9519]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglu:         NOTRUN -> [SKIP][266] ([fdo#109293] / [fdo#109506])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([fdo#109293] / [fdo#109506])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#6524])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-glk:          NOTRUN -> [SKIP][269] ([fdo#109271] / [fdo#110189]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([fdo#110189]) +4 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([fdo#110189]) +6 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([fdo#110189]) +7 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][273] ([fdo#110189]) +9 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#4348])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][275] ([fdo#111068] / [i915#9683])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][276] ([fdo#109642] / [fdo#111068] / [i915#9683])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#9688]) +11 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-8/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#9673] / [i915#9732]) +7 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#9732]) +13 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#9732]) +17 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#9732]) +7 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-3/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-primary-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#9732]) +12 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_psr@psr-primary-mmap-cpu.html

  * igt@kms_psr@psr2-primary-render@edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][283] ([i915#10105])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_psr@psr2-primary-render@edp-1.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#9685])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#9685])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#5289])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#4235]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#4235] / [i915#5190]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][289] ([fdo#111615] / [i915#5289])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#4235])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#3555]) +4 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#8623])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][293] ([i915#9196])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-3.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#9906])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#9906])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#2437])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#2437] / [i915#9412])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#2437] / [i915#9412])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][299] ([i915#2437] / [i915#9412])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#2437] / [i915#9412])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#2437])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@enable-disable@0-rcs0:
    - shard-dg2:          [PASS][302] -> [FAIL][303] ([i915#8724])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-2/igt@perf@enable-disable@0-rcs0.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#2436])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#2433])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-3/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#8850])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([fdo#112283])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#8516])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#3708])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#3291] / [i915#3708]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([fdo#109295])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#3708]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-3/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#9917]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#9917])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-dg2:          NOTRUN -> [FAIL][315] ([i915#9781])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@syncobj_timeline@invalid-wait-zero-handles.html
    - shard-dg1:          NOTRUN -> [FAIL][316] ([i915#9781])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@syncobj_timeline@invalid-wait-zero-handles.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][317] ([fdo#109307] / [i915#4818])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#4818])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_create_bo@create-bo-zeroed:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#2575]) +8 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@v3d/v3d_create_bo@create-bo-zeroed.html

  * igt@v3d/v3d_perfmon@get-values-invalid-pointer:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#2575]) +7 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@v3d/v3d_perfmon@get-values-invalid-pointer.html

  * igt@v3d/v3d_submit_cl@bad-multisync-in-sync:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([fdo#109315]) +11 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html

  * igt@v3d/v3d_submit_cl@job-perfmon:
    - shard-tglu:         NOTRUN -> [SKIP][322] ([fdo#109315] / [i915#2575]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@v3d/v3d_submit_cl@job-perfmon.html

  * igt@v3d/v3d_submit_csd@job-perfmon:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#2575]) +17 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@v3d/v3d_submit_csd@job-perfmon.html

  * igt@vc4/vc4_perfmon@create-perfmon-exceed:
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#7711]) +5 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@vc4/vc4_perfmon@create-perfmon-exceed.html

  * igt@vc4/vc4_perfmon@create-two-perfmon:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#7711]) +6 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@vc4/vc4_perfmon@create-two-perfmon.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#7711]) +5 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@vc4/vc4_perfmon@create-two-perfmon.html

  * igt@vc4/vc4_wait_bo@bad-pad:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#7711]) +9 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@vc4/vc4_wait_bo@bad-pad.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#2575])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-6/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@virtual-idle:
    - shard-rkl:          [FAIL][329] ([i915#7742]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-rkl-7/igt@drm_fdinfo@virtual-idle.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@drm_fdinfo@virtual-idle.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][331] ([i915#2842]) -> [PASS][332]
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [FAIL][333] ([i915#2842]) -> [PASS][334] +3 other tests pass
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-3/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_schedule@deep@vecs0:
    - shard-dg2:          [INCOMPLETE][335] -> [PASS][336]
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-11/igt@gem_exec_schedule@deep@vecs0.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@gem_exec_schedule@deep@vecs0.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [INCOMPLETE][337] ([i915#5566]) -> [PASS][338]
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-glk9/igt@gen9_exec_parse@allowed-single.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk3/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          [FAIL][339] ([i915#3591]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][341] ([i915#7984]) -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-mtlp-8/igt@i915_power@sanity.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@i915_power@sanity.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][343] ([i915#5138]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         [FAIL][345] ([i915#3743]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][347] ([i915#2346]) -> [PASS][348]
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@single-bo@pipe-b:
    - shard-glk:          [DMESG-WARN][349] -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-glk6/igt@kms_cursor_legacy@single-bo@pipe-b.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk3/igt@kms_cursor_legacy@single-bo@pipe-b.html

  * igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a4:
    - shard-dg1:          [INCOMPLETE][351] -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-15/igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a4.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a4.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          [FAIL][353] ([i915#6880]) -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-snb:          [SKIP][355] ([fdo#109271] / [fdo#111767]) -> [PASS][356]
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-snb:          [SKIP][357] ([fdo#109271]) -> [PASS][358] +10 other tests pass
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
    - shard-dg1:          [FAIL][359] ([i915#8292]) -> [PASS][360]
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][361] ([i915#9519]) -> [PASS][362]
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-rkl:          [ABORT][363] ([i915#8875] / [i915#9926]) -> [PASS][364]
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-rkl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [FAIL][365] ([i915#4349]) -> [PASS][366]
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-mtlp-3/igt@perf_pmu@busy-double-start@ccs0.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [FAIL][367] ([i915#4349]) -> [PASS][368] +3 other tests pass
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@rc6-suspend:
    - shard-dg2:          [INCOMPLETE][369] ([i915#9853]) -> [PASS][370]
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-2/igt@perf_pmu@rc6-suspend.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@perf_pmu@rc6-suspend.html

  * igt@sysfs_heartbeat_interval@nopreempt@vecs0:
    - shard-dg1:          [ABORT][371] -> [PASS][372]
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-17/igt@sysfs_heartbeat_interval@nopreempt@vecs0.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@sysfs_heartbeat_interval@nopreempt@vecs0.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][373] ([i915#10131] / [i915#9697]) -> [ABORT][374] ([i915#10131] / [i915#9820])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu:         [FAIL][375] ([i915#3591]) -> [WARN][376] ([i915#2681])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@kms_content_protection@atomic:
    - shard-snb:          [SKIP][377] ([fdo#109271]) -> [INCOMPLETE][378] ([i915#8816])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb5/igt@kms_content_protection@atomic.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][379] ([i915#9424]) -> [SKIP][380] ([i915#8063])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-rkl-1/igt@kms_content_protection@mei-interface.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          [SKIP][381] ([i915#9424]) -> [SKIP][382] ([i915#9433])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-16/igt@kms_content_protection@mei-interface.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         [SKIP][383] ([i915#6944] / [i915#9424]) -> [SKIP][384] ([i915#8063])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-tglu-3/igt@kms_content_protection@mei-interface.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          [SKIP][385] ([fdo#109271] / [fdo#111767]) -> [SKIP][386] ([fdo#109271]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          [ABORT][387] -> [SKIP][388] ([i915#4077])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-18/igt@kms_pm_rpm@fences.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-dg1:          [ABORT][389] -> [SKIP][390] ([fdo#109293] / [fdo#109506])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-16/igt@kms_pm_rpm@modeset-pc8-residency-stress.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-dg2:          [ABORT][391] -> [SKIP][392] ([i915#4077])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-7/igt@kms_pm_rpm@pm-caching.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_psr@fbc-pr-sprite-mmap-gtt:
    - shard-dg2:          [SKIP][393] ([i915#9673] / [i915#9732]) -> [SKIP][394] ([i915#9732]) +2 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-11/igt@kms_psr@fbc-pr-sprite-mmap-gtt.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_psr@fbc-pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-dg2:          [SKIP][395] ([i915#9732]) -> [SKIP][396] ([i915#9673] / [i915#9732]) +17 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-6/igt@kms_psr@psr-cursor-mmap-cpu.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_psr@psr-cursor-mmap-cpu.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#10105]: https://gitlab.freedesktop.org/drm/intel/issues/10105
  [i915#10131]: https://gitlab.freedesktop.org/drm/intel/issues/10131
  [i915#10307]: https://gitlab.freedesktop.org/drm/intel/issues/10307
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/intel/issues/6187
  [i915#6188]: https://gitlab.freedesktop.org/drm/intel/issues/6188
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitl

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/index.html

--===============6299748513369516415==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/intel-ci/xe: Block PSR + DRRS tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130660/">https://patchwork.freedesktop.org/series/130660/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14382_full -&gt; IGTPW_10769_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10769_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10769_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/index.html</p>
<h2>Participating hosts (8 -&gt; 9)</h2>
<p>Additional (1): shard-snb-0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10769_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-10ms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-17/igt@gem_eio@in-flight-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@gem_eio@in-flight-10ms.html">ABORT</a> +1 other test abort</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-5/igt@gem_eio@in-flight-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@gem_eio@in-flight-10ms.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@individual:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-17/igt@gem_exec_balancer@individual.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@gem_exec_balancer@individual.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-11/igt@i915_pm_rpm@gem-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@i915_pm_rpm@gem-idle.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">TIMEOUT</a> +4 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-glk3/igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk3/igt@kms_vblank@ts-continuation-modeset-hang@pipe-c-hdmi-a-2.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb4/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb7/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#8708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_14382_full and IGTPW_10769_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_lmem_swapping:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10769_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-8/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> ([i915#9408] / [i915#9618])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@idle@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@drm_fdinfo@idle@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> ([i915#8414]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@drm_fdinfo@virtual-busy-all.html">SKIP</a> ([i915#8414]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-8/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6335">i915#6335</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-8/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-6/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-8/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gem_exec_balancer@sliced.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-incremental:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk9/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> ([i915#9606])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> ([i915#9606])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-6/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-tglu-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@gem_exec_fair@basic-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@gem_exec_fair@basic-throttle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109313">fdo#109313</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@gem_exec_flush@basic-wb-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@gem_exec_reloc@basic-cpu-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gem_fenced_exec_thrash@too-many-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk5/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-5/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gem_mmap_gtt@basic-small-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@gem_mmap_wc@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@gem_mmap_wc@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@gem_mmap_wc@write-cpu-read-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-3/igt@gem_partial_pwrite_pread@write-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@gem_pread@bench.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk3/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@gem_pwrite@basic-self.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-4/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html">SKIP</a> ([i915#8428]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4880">i915#4880</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-3/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-3/igt@gen7_exec_parse@basic-offset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@i915_fb_tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9820] / [i915#9849])</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9820] / [i915#9849])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9820] / [i915#9849])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> ([i915#8399]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@i915_pm_rps@thresholds-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-7/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109303">fdo#109303</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-4/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3826">i915#3826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-9/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-tglu-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_big_joiner@2x-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-5/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-a-dp-4.html">SKIP</a> ([i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> ([i915#7828]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-9/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitl">i915#7118</a> / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-8/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitl">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitl">i915#7118</a> / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8814]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([i915#9809]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3966">i915#3966</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / [i915#9934]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8810]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk4/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> ([i915#9457]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6301">i915#6301</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk9/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8821]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#9423]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-3.html">SKIP</a> ([i915#9423]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#9423]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a> / [i915#9423]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-15/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4348">i915#4348</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / [i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / [i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-8/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> ([i915#9688]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html">SKIP</a> ([i915#9673] / [i915#9732]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html">SKIP</a> ([i915#9732]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-5/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> ([i915#9732]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-3/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> ([i915#9732]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_psr@psr-primary-mmap-cpu.html">SKIP</a> ([i915#9732]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-4/igt@kms_psr@psr2-primary-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10105">i915#10105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-5/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-12/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-3.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a> / [i915#9412])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a> / [i915#9412])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a> / [i915#9412])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a> / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-2/igt@perf@enable-disable@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html">FAIL</a> ([i915#8724])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-3/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-10/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-10/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-3/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> ([i915#9917]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109307">fdo#109307</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4818">i915#4818</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-1/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4818">i915#4818</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_create_bo@create-bo-zeroed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@v3d/v3d_create_bo@create-bo-zeroed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-pointer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@v3d/v3d_perfmon@get-values-invalid-pointer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-multisync-in-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@job-perfmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@v3d/v3d_submit_cl@job-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@job-perfmon:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@v3d/v3d_submit_csd@job-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-perfmon-exceed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-6/igt@vc4/vc4_perfmon@create-perfmon-exceed.html">SKIP</a> ([i915#7711]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-two-perfmon:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@vc4/vc4_perfmon@create-two-perfmon.html">SKIP</a> ([i915#7711]) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@vc4/vc4_perfmon@create-two-perfmon.html">SKIP</a> ([i915#7711]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@bad-pad:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@vc4/vc4_wait_bo@bad-pad.html">SKIP</a> ([i915#7711]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-1ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-6/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-rkl-7/igt@drm_fdinfo@virtual-idle.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@drm_fdinfo@virtual-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@vecs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-11/igt@gem_exec_schedule@deep@vecs0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@gem_exec_schedule@deep@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-glk9/igt@gen9_exec_parse@allowed-single.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk3/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-mtlp-8/igt@i915_power@sanity.html">SKIP</a> ([i915#7984]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-b:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-glk6/igt@kms_cursor_legacy@single-bo@pipe-b.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-glk3/igt@kms_cursor_legacy@single-bo@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-15/igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a4.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_flip@flip-vs-panning-interruptible@c-hdmi-a4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">FAIL</a> ([i915#8292]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-rkl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">ABORT</a> ([i915#8875] / [i915#9926]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-mtlp-3/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-2/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> ([i915#9853]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-5/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-17/igt@sysfs_heartbeat_interval@nopreempt@vecs0.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-16/igt@sysfs_heartbeat_interval@nopreempt@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10131">i915#10131</a> / [i915#9697]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10131">i915#10131</a> / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb5/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb7/igt@kms_content_protection@atomic.html">INCOMPLETE</a> ([i915#8816])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-rkl-1/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-rkl-7/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#8063])</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-16/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-17/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9433])</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-tglu-3/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / [i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-tglu-2/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#8063])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-18/igt@kms_pm_rpm@fences.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-19/igt@kms_pm_rpm@fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg1-16/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg1-13/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-caching:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-7/igt@kms_pm_rpm@pm-caching.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-6/igt@kms_pm_rpm@pm-caching.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-11/igt@kms_psr@fbc-pr-sprite-mmap-gtt.html">SKIP</a> ([i915#9673] / [i915#9732]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-2/igt@kms_psr@fbc-pr-sprite-mmap-gtt.html">SKIP</a> ([i915#9732]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14382/shard-dg2-6/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> ([i915#9732]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10769/shard-dg2-11/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> ([i915#9673] / [i915#9732]) +17 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============6299748513369516415==--
