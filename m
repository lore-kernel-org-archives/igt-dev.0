Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66975E68954
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 04:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D2B10E04A;
	Thu, 31 Oct 2024 04:54:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21BE10E04A;
 Thu, 31 Oct 2024 04:54:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7157339955379165826=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/amdgpu/amd=5Freplay?=
 =?utf-8?q?=3A_Add_some_page_flips_before_test_start_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tom Chung" <chiahsuan.chung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 31 Oct 2024 04:54:55 -0000
Message-ID: <173035049589.1365235.2536336890316501558@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030151714.2424-1-chiahsuan.chung@amd.com>
In-Reply-To: <20241030151714.2424-1-chiahsuan.chung@amd.com>
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

--===============7157339955379165826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_replay: Add some page flips before test start (rev2)
URL   : https://patchwork.freedesktop.org/series/140721/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15614_full -> IGTPW_12004_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12004_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12004_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): shard-glk 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12004_full:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@write:
    - shard-dg2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-6/igt@fbdev@write.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@fbdev@write.html

  * igt@i915_selftest@live@hangcheck:
    - shard-dg2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@i915_selftest@live@hangcheck.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_hdr@brightness-with-hdr.html

  
Known issues
------------

  Here are the changes found in IGTPW_12004_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8411]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#6230])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-2/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#11078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@device_reset@cold-reset-bound.html
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#11078])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-5/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-rkl:          [PASS][11] -> [ABORT][12] ([i915#5507])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html
    - shard-dg1:          NOTRUN -> [ABORT][13] ([i915#11814] / [i915#11815])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html
    - shard-tglu:         [PASS][14] -> [ABORT][15] ([i915#5507])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-tglu-5/igt@device_reset@unbind-reset-rebind.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-8/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@isolation:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8414]) +17 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@drm_fdinfo@isolation.html

  * igt@drm_fdinfo@most-busy-idle-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#8414]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@drm_fdinfo@most-busy-idle-check-all@ccs0.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#3281]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#7697]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@gem_basic@multigpu-create-close.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#4873])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@gem_caching@writes.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-8/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][23] -> [INCOMPLETE][24] ([i915#7297]) +1 other test incomplete
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-8/igt@gem_ccs@suspend-resume.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#7697]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@gem_close_race@multigpu-basic-threads.html
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#7697])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_compute@compute-square:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#9310])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-3/igt@gem_compute@compute-square.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#6335])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#8562])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-tglu:         NOTRUN -> [FAIL][30] ([i915#12031])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#8555])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][32] ([i915#11980] / [i915#12580])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][33] ([i915#1099]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb5/igt@gem_ctx_persistence@legacy-engines-persistence.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#280]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-8/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][35] -> [FAIL][36] ([i915#12543] / [i915#5784])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-17/igt@gem_eio@reset-stress.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          NOTRUN -> [FAIL][37] ([i915#5784])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4036])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4036])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@nop:
    - shard-mtlp:         [PASS][40] -> [DMESG-WARN][41] ([i915#12412])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-mtlp-6/igt@gem_exec_balancer@nop.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@gem_exec_balancer@nop.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#4525]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [ABORT][43] ([i915#11713])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#6334]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][45] ([i915#11965] / [i915#12558]) +2 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_capture@capture@vecs1-smem:
    - shard-dg2:          NOTRUN -> [FAIL][46] ([i915#11965]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@gem_exec_capture@capture@vecs1-smem.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-tglu:         NOTRUN -> [FAIL][47] ([i915#2842]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-2/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-pace:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3539])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-14/igt@gem_exec_fair@basic-pace.html
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4473] / [i915#4771])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4812])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@gem_exec_fence@submit3.html
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4812])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3539] / [i915#4852]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-14/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3539])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3539] / [i915#4852]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#5107])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3281]) +10 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#3281]) +8 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#3281]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc.html

  * igt@gem_exec_schedule@pi-common@vcs0:
    - shard-rkl:          NOTRUN -> [FAIL][59] ([i915#12296]) +4 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@gem_exec_schedule@pi-common@vcs0.html
    - shard-tglu-1:       NOTRUN -> [FAIL][60] ([i915#12296]) +5 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@gem_exec_schedule@pi-common@vcs0.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4537] / [i915#4812])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg1:          NOTRUN -> [ABORT][62] ([i915#7975] / [i915#8213]) +1 other test abort
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4860])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#12193])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4613]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4565])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#4613]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#4613]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@gem_madvise@dontneed-before-pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3282]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@gem_madvise@dontneed-before-pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#3282])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-1/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4077]) +8 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4077]) +6 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-3/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4083]) +5 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-8/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4083]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4083]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#3282]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4270]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-16/igt@gem_pxp@create-valid-protected-context.html
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#4270])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-6/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4270])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-tglu-1:       NOTRUN -> [SKIP][81] ([i915#4270])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#4270]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#5190] / [i915#8428]) +8 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#8428]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4079])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4079]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@gem_set_tiling_vs_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4079])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4077]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@access-control:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@gem_userptr_blits@access-control.html
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-4/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3297]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#3281] / [i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#3297]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#2527])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@gen9_exec_parse@allowed-all.html
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#2856])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#2527] / [i915#2856])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#2856]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#2527])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [PASS][99] -> [ABORT][100] ([i915#9820])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#8399])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-1/igt@i915_pm_freq_api@freq-reset.html
    - shard-tglu-1:       NOTRUN -> [SKIP][102] ([i915#8399])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#11681] / [i915#6621])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#11681] / [i915#6621])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#6188])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-1/igt@i915_query@query-topology-coherent-slice-mask.html
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#6188])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@live:
    - shard-dg2:          [PASS][107] -> [ABORT][108] ([i915#12133])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@i915_selftest@live.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@i915_selftest@live.html
    - shard-snb:          [PASS][109] -> [ABORT][110] ([i915#12450])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb7/igt@i915_selftest@live.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb4/igt@i915_selftest@live.html
    - shard-mtlp:         NOTRUN -> [ABORT][111] ([i915#12133] / [i915#12216])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-snb:          [PASS][112] -> [ABORT][113] ([i915#11703])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb7/igt@i915_selftest@live@sanitycheck.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb4/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][114] -> [ABORT][115] ([i915#12216])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-mtlp-3/igt@i915_selftest@live@workarounds.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#8709]) +11 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#9531])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#1769] / [i915#3555])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][119] ([i915#1769] / [i915#3555])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4:
    - shard-dg1:          [PASS][120] -> [FAIL][121] ([i915#5956]) +1 other test fail
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][122] ([i915#5286]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#5286]) +6 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4538] / [i915#5286]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#5286]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][126] +46 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-6/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][127] +11 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#5190] / [i915#9197])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#3638]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg1:          [PASS][130] -> [DMESG-WARN][131] ([i915#4391] / [i915#4423])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-18/igt@kms_big_fb@y-tiled-addfb.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#4538] / [i915#5190]) +13 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][133] +24 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-tglu-1:       NOTRUN -> [SKIP][134] +36 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#4538]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#6095]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#6095]) +77 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#6095]) +19 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#12313]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#10307] / [i915#6095]) +173 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#6095]) +76 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#12313]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#12313]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#6095]) +9 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#9197]) +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#7213]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#7828]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#7828])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#7828]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#7828]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#7828]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-5/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#7828]) +7 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#3555] / [i915#9979])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-4/igt@kms_color@deep-color.html

  * igt@kms_color@degamma:
    - shard-dg2:          [PASS][155] -> [SKIP][156] ([i915#12655])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-5/igt@kms_color@degamma.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_color@degamma.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#3116])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#9424]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#9424]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_content_protection@mei-interface.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#8063] / [i915#9433])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#3555] / [i915#6944] / [i915#9424])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#7118] / [i915#9424])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][165] ([i915#11453] / [i915#3359])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#11453] / [i915#3359])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#11453] / [i915#3359])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#11453] / [i915#3359]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#3555] / [i915#8814])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#4103]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - shard-dg2:          [PASS][171] -> [SKIP][172] ([i915#9197]) +24 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#9809]) +5 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#9833])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#9723])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#9723])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#9833])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#8588])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#3555] / [i915#3840])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3840])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#3555] / [i915#3840])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#3840] / [i915#9053])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#3955])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#2065] / [i915#4854])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-2/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#1839])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#9337])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_feature_discovery@dp-mst.html
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#9337])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][188] -> [FAIL][189] ([i915#2122]) +7 other tests fail
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb1/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#3637])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#5354]) +51 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#9934]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#3637]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-snb:          NOTRUN -> [FAIL][194] ([i915#2122]) +1 other test fail
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#3637]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          NOTRUN -> [FAIL][196] ([i915#2122])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][197] ([i915#11961]) +1 other test fail
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#3555] / [i915#8810] / [i915#8813])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#3555] / [i915#8810])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#2672] / [i915#3555])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#2672]) +5 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#2587] / [i915#2672]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#2672] / [i915#3555] / [i915#5190]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#2672] / [i915#3555]) +5 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#2587] / [i915#2672] / [i915#3555])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#2672] / [i915#3555])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#2587] / [i915#2672])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-dg2:          [PASS][209] -> [SKIP][210] ([i915#3555]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#2672]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#8708]) +13 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][213] -> [SKIP][214] ([i915#5354]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-snb:          [PASS][215] -> [SKIP][216] +5 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#5439])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#3458]) +9 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#8708]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][220] +23 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#1825]) +30 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#3023]) +21 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#8708]) +9 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#10433] / [i915#3458]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#3458]) +16 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#1825]) +11 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          [PASS][227] -> [SKIP][228] ([i915#3555] / [i915#8228])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#3555] / [i915#8228])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#10656]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#12394])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#12339])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane@pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#8825])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane@pixel-format.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-dg2:          [PASS][234] -> [SKIP][235] ([i915#7294]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-3/igt@kms_plane_alpha_blend@alpha-basic.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#3555] / [i915#8806])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-4/igt@kms_plane_multiple@tiling-y.html
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#8806])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#5354] / [i915#9423])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#12247]) +4 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#8152] / [i915#9423])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#8152])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg2:          [PASS][242] -> [SKIP][243] ([i915#3555] / [i915#8152] / [i915#9423])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-tglu-1:       NOTRUN -> [SKIP][244] ([i915#3555]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-dg2:          [PASS][245] -> [SKIP][246] ([i915#12247]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#12247]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:
    - shard-dg2:          [PASS][248] -> [SKIP][249] ([i915#12247] / [i915#8152])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#12247]) +9 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#12247] / [i915#6953])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#12247] / [i915#6953])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#12247] / [i915#9423])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#12247]) +13 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#12247]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#12247] / [i915#6953] / [i915#9423])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#12247] / [i915#12504]) +6 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#6953] / [i915#8152] / [i915#9423])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#12247] / [i915#8152])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#12247] / [i915#3555])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][261] ([i915#9812])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#5354])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#3828])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#5978])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#9685]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#8430])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][267] -> [SKIP][268] ([i915#9519]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][269] -> [SKIP][270] ([i915#9519]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#6524] / [i915#6805]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#6524])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#9808])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#12316]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#11520]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][276] ([i915#11520]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#11520]) +5 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#11520]) +5 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#11520]) +6 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#11520]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#1072] / [i915#9732]) +18 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#9732]) +8 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#9688]) +10 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#9732]) +11 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#4077] / [i915#9688]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#1072] / [i915#9732]) +12 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#1072] / [i915#9732]) +22 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][288] ([i915#4423])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@kms_rotation_crc@primary-rotation-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#11131] / [i915#4235])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#5190]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#5289])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#5289]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#3555]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu-1:       NOTRUN -> [ABORT][294] ([i915#12231]) +1 other test abort
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html
    - shard-dg1:          NOTRUN -> [ABORT][295] ([i915#12231]) +1 other test abort
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@kms_selftest@drm_framebuffer.html
    - shard-mtlp:         NOTRUN -> [ABORT][296] ([i915#12231]) +1 other test abort
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][297] ([i915#12231]) +1 other test abort
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#3555]) +7 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#3555]) +7 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-1/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#3555]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [PASS][301] -> [FAIL][302] ([IGT#2])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-10/igt@kms_sysfs_edid_timing.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#8623])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#9906])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#2437])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#2437] / [i915#9412])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][307] +15 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#2436])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][309] ([i915#7484]) +1 other test fail
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#2433])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][311] +82 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb4/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - shard-dg2:          NOTRUN -> [FAIL][312] ([i915#4349]) +4 other tests fail
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@perf_pmu@busy-idle-check-all@vcs0.html
    - shard-dg1:          NOTRUN -> [FAIL][313] ([i915#4349]) +2 other tests fail
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@perf_pmu@busy-idle-check-all@vcs0.html
    - shard-mtlp:         [PASS][314] -> [FAIL][315] ([i915#4349]) +2 other tests fail
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@vcs0.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@vcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#8850])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@perf_pmu@cpu-hotplug.html
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#8850])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-5/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-mtlp:         [PASS][318] -> [INCOMPLETE][319] ([i915#9853]) +1 other test incomplete
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-mtlp-7/igt@perf_pmu@semaphore-busy@vcs1.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-4/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-dg2:          [PASS][320] -> [SKIP][321]
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-11/igt@prime_mmap_kms@buffer-sharing.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@prime_mmap_kms@buffer-sharing.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#3708])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#3291] / [i915#3708])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-8/igt@prime_vgem@basic-fence-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#3708]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#3708]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#3708])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-14/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#9917]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@sriov_basic@bind-unbind-vf.html
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#9917])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@sriov_basic@bind-unbind-vf.html
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#9917])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-16/igt@sriov_basic@bind-unbind-vf.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-dg1:          NOTRUN -> [FAIL][330] ([i915#12564] / [i915#9781])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@syncobj_wait@invalid-wait-zero-handles.html
    - shard-tglu:         NOTRUN -> [FAIL][331] ([i915#12564] / [i915#9781])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@gem_ctx_engines@invalid-engines:
    - shard-mtlp:         [FAIL][332] ([i915#12031]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-mtlp-4/igt@gem_ctx_engines@invalid-engines.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [ABORT][334] ([i915#7975] / [i915#8213]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-14/igt@gem_eio@hibernate.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-16/igt@gem_eio@hibernate.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [FAIL][336] ([i915#2842]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][338] ([i915#9820]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-dg1:          [FAIL][340] ([i915#12548] / [i915#3591]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          [FAIL][342] ([i915#3591]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_suspend@forcewake:
    - shard-snb:          [INCOMPLETE][344] ([i915#4817]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb4/igt@i915_suspend@forcewake.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb2/igt@i915_suspend@forcewake.html

  * igt@kms_busy@basic:
    - shard-dg2:          [SKIP][346] ([i915#9197]) -> [PASS][347] +14 other tests pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_busy@basic.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@kms_busy@basic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-snb:          [SKIP][348] -> [PASS][349] +9 other tests pass
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [SKIP][350] ([i915#1257]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-6/igt@kms_dp_aux_dev.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-snb:          [FAIL][352] ([i915#2122]) -> [PASS][353] +3 other tests pass
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb5/igt@kms_flip@2x-plain-flip-ts-check.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2:          [FAIL][354] ([i915#79]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-4/igt@kms_flip@flip-vs-expired-vblank.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a4:
    - shard-dg1:          [FAIL][356] ([i915#79]) -> [PASS][357] +1 other test pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-16/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a4.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-tglu:         [INCOMPLETE][358] ([i915#6113]) -> [PASS][359]
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-tglu-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-snb:          [INCOMPLETE][360] ([i915#4839]) -> [PASS][361] +1 other test pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-tglu:         [INCOMPLETE][362] -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-tglu-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-tglu:         [FAIL][364] ([i915#2122]) -> [PASS][365] +1 other test pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-tglu-4/igt@kms_flip@plain-flip-ts-check.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg1:          [FAIL][366] -> [PASS][367] +1 other test pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-dg2:          [SKIP][368] ([i915#3555]) -> [PASS][369] +1 other test pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [SKIP][370] ([i915#5354]) -> [PASS][371] +3 other tests pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2:          [SKIP][372] ([i915#433]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-3/igt@kms_hdmi_inject@inject-audio.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_hdmi_inject@inject-audio.html
    - shard-dg1:          [SKIP][374] ([i915#433]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-18/igt@kms_hdmi_inject@inject-audio.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [SKIP][376] ([i915#3555] / [i915#8228]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-1/igt@kms_hdr@static-swap.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@kms_hdr@static-swap.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-dg2:          [SKIP][378] ([i915#9581]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane@planar-pixel-format-settings.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-dg2:          [SKIP][380] ([i915#7294]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2:          [SKIP][382] ([i915#8152] / [i915#9423]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:
    - shard-dg2:          [SKIP][384] ([i915#12247]) -> [PASS][385] +8 other tests pass
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2:          [SKIP][386] ([i915#8152]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-dg2:          [SKIP][388] ([i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d:
    - shard-dg2:          [SKIP][390] ([i915#12247] / [i915#8152]) -> [PASS][391] +1 other test pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-dg2:          [SKIP][392] ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][394] ([i915#9295]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][396] ([i915#9519]) -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-snb:          [INCOMPLETE][398] ([i915#12276]) -> [PASS][399] +1 other test pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb5/igt@kms_vblank@ts-continuation-suspend.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@perf_pmu@busy-accuracy-98@vcs0:
    - shard-dg2:          [INCOMPLETE][400] ([i915#9853]) -> [PASS][401] +1 other test pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-11/igt@perf_pmu@busy-accuracy-98@vcs0.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@perf_pmu@busy-accuracy-98@vcs0.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [ABORT][402] ([i915#10131] / [i915#10887]) -> [ABORT][403] ([i915#10131] / [i915#9697])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg1:          [SKIP][404] ([i915#4212] / [i915#4423]) -> [SKIP][405] ([i915#4212])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-18/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-16/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          [SKIP][406] ([i915#9197]) -> [SKIP][407] ([i915#9531])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          [SKIP][408] ([i915#9197]) -> [SKIP][409] ([i915#1769] / [i915#3555])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2:          [SKIP][410] -> [SKIP][411] ([i915#9197])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-5/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][412] ([i915#9197]) -> [SKIP][413] +2 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2:          [SKIP][414] ([i915#4538] / [i915#5190]) -> [SKIP][415] ([i915#5190] / [i915#9197]) +3 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-dg2:          [SKIP][416] ([i915#5190] / [i915#9197]) -> [SKIP][417] ([i915#4538] / [i915#5190])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-dg2:          [SKIP][418] ([i915#10307] / [i915#6095]) -> [SKIP][419] ([i915#9197]) +4 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2:          [SKIP][420] ([i915#9197]) -> [SKIP][421] ([i915#10307] / [i915#6095]) +5 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          [SKIP][422] ([i915#9197]) -> [SKIP][423] ([i915#11616] / [i915#7213])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          [SKIP][424] ([i915#3299]) -> [SKIP][425] ([i915#9197])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-3/igt@kms_content_protection@dp-mst-lic-type-1.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-snb:          [INCOMPLETE][426] ([i915#8816]) -> [SKIP][427]
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb5/igt@kms_content_protection@lic-type-1.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][428] ([i915#9433]) -> [SKIP][429] ([i915#9424])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-16/igt@kms_content_protection@mei-interface.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         [SKIP][430] ([i915#8063]) -> [SKIP][431] ([i915#6944] / [i915#9424])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-tglu-3/igt@kms_content_protection@mei-interface.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-snb:          [SKIP][432] -> [INCOMPLETE][433] ([i915#8816])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb7/igt@kms_content_protection@srm.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          [SKIP][434] ([i915#9197]) -> [SKIP][435] ([i915#3555]) +2 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          [SKIP][436] ([i915#9197]) -> [SKIP][437] ([i915#11453] / [i915#3359])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2:          [SKIP][438] ([i915#3555]) -> [SKIP][439] ([i915#9197]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          [SKIP][440] ([i915#4103] / [i915#4213]) -> [SKIP][441] ([i915#9197]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-dg2:          [SKIP][442] ([i915#9197]) -> [SKIP][443] ([i915#5354])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2:          [SKIP][444] ([i915#5354]) -> [SKIP][445] ([i915#9197])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          [SKIP][446] ([i915#8588]) -> [SKIP][447] ([i915#9197])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-6/igt@kms_display_modes@mst-extended-mode-negative.html
   [447]: https://intel-gfx-ci.01.org

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/index.html

--===============7157339955379165826==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_replay: Add some page flips before test start (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140721/">https://patchwork.freedesktop.org/series/140721/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15614_full -&gt; IGTPW_12004_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12004_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12004_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): shard-glk </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12004_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-6/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@fbdev@write.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@i915_selftest@live@hangcheck.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12004_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-2/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#11078])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-5/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#5507])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#11814] / [i915#11815])</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-tglu-5/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-8/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#5507])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@drm_fdinfo@isolation.html">SKIP</a> ([i915#8414]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@drm_fdinfo@most-busy-idle-check-all@ccs0.html">SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@gem_caching@writes.html">SKIP</a> ([i915#4873])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-8/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> ([i915#7297]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-3/igt@gem_compute@compute-square.html">SKIP</a> ([i915#9310])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-6/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12031])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980] / [i915#12580])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb5/igt@gem_ctx_persistence@legacy-engines-persistence.html">SKIP</a> ([i915#1099]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-8/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-17/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#12543] / [i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@nop:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-mtlp-6/igt@gem_exec_balancer@nop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@gem_exec_balancer@nop.html">DMESG-WARN</a> ([i915#12412])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-1/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@gem_exec_big@single.html">ABORT</a> ([i915#11713])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> ([i915#11965] / [i915#12558]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs1-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@gem_exec_capture@capture@vecs1-smem.html">FAIL</a> ([i915#11965]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-2/igt@gem_exec_fair@basic-none-solo.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-14/igt@gem_exec_fair@basic-pace.html">SKIP</a> ([i915#3539])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@gem_exec_fair@basic-pace.html">SKIP</a> ([i915#4473] / [i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@gem_exec_fence@submit3.html">SKIP</a> ([i915#4812])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@gem_exec_fence@submit3.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-14/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#3281]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@gem_exec_reloc@basic-write-wc.html">SKIP</a> ([i915#3281]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-common@vcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@gem_exec_schedule@pi-common@vcs0.html">FAIL</a> ([i915#12296]) +4 other tests fail</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@gem_exec_schedule@pi-common@vcs0.html">FAIL</a> ([i915#12296]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> ([i915#7975] / [i915#8213]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#12193])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-1/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-1/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> ([i915#4077]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-3/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-8/igt@gem_mmap_wc@bad-offset.html">SKIP</a> ([i915#4083]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@gem_mmap_wc@read.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-16/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-6/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#5190] / [i915#8428]) +8 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#8428]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> ([i915#4077]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-4/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@gem_userptr_blits@relocations.html">SKIP</a> ([i915#3281] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2527])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-1/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> ([i915#8399])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#11681] / [i915#6621])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#11681] / [i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-1/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@i915_selftest@live.html">ABORT</a> ([i915#12133])</li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb7/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb4/igt@i915_selftest@live.html">ABORT</a> ([i915#12450])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@i915_selftest@live.html">ABORT</a> ([i915#12133] / [i915#12216])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb7/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb4/igt@i915_selftest@live@sanitycheck.html">ABORT</a> ([i915#11703])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-mtlp-3/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@i915_selftest@live@workarounds.html">ABORT</a> ([i915#12216])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html">FAIL</a> ([i915#5956]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#4538] / [i915#5286]) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-6/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#5190] / [i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-18/igt@kms_big_fb@y-tiled-addfb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@kms_big_fb@y-tiled-addfb.html">DMESG-WARN</a> ([i915#4391] / [i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> ([i915#4538]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1.html">SKIP</a> ([i915#6095]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#6095]) +77 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#6095]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#6095]) +173 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#6095]) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> ([i915#6095]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> ([i915#9197]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> ([i915#7828]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-5/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-4/igt@kms_color@deep-color.html">SKIP</a> ([i915#3555] / [i915#9979])</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-5/igt@kms_color@degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_color@degamma.html">SKIP</a> ([i915#12655])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-7/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#8063] / [i915#9433])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_content_protection@type1.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_content_protection@type1.html">SKIP</a> ([i915#3555] / [i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#11453] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#11453] / [i915#3359])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#11453] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> ([i915#11453] / [i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> ([i915#9197]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> ([i915#9809]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9833])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9833])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-2/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#2065] / [i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb1/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122]) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> ([i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([i915#5354]) +51 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([i915#9934]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([i915#3637]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> ([i915#2122]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> ([i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2.html">FAIL</a> ([i915#11961]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">SKIP</a> ([i915#3555] / [i915#8810] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#1825]) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#3023]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> ([i915#10433] / [i915#3458]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> ([i915#3458]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#1825]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> ([i915#10656]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-4/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> ([i915#12394])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane@pixel-format.html">SKIP</a> ([i915#8825])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-3/igt@kms_plane_alpha_blend@alpha-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-basic.html">SKIP</a> ([i915#7294]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-4/igt@kms_plane_multiple@tiling-y.html">SKIP</a> ([i915#3555] / [i915#8806])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a> ([i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([i915#5354] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> ([i915#12247]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">SKIP</a> ([i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html">SKIP</a> ([i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> ([i915#3555] / [i915#8152] / [i915#9423])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> ([i915#12247]) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> ([i915#12247]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> ([i915#12247] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247]) +13 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247] / [i915#12504]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> ([i915#3828])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#9519]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> ([i915#12316]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#11520]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +6 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a> ([i915#1072] / [i915#9732]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> ([i915#9732]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html">SKIP</a> ([i915#9688]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> ([i915#9732]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html">SKIP</a> ([i915#4077] / [i915#9688]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> ([i915#1072] / [i915#9732]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@kms_rotation_crc@primary-rotation-180.html">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> ([i915#11131] / [i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> ([i915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-10/igt@kms_sysfs_edid_timing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> +15 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436])</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> ([i915#7484]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb4/igt@perf_pmu@busy-accuracy-98.html">SKIP</a> +82 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> ([i915#4349]) +4 other tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-19/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> ([i915#4349]) +2 other tests fail</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> ([i915#4349]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-5/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-mtlp-7/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-4/igt@perf_pmu@semaphore-busy@vcs1.html">INCOMPLETE</a> ([i915#9853]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-11/igt@prime_mmap_kms@buffer-sharing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@prime_mmap_kms@buffer-sharing.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@prime_vgem@basic-fence-flip.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-2/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-14/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-3/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-16/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#12564] / [i915#9781])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#12564] / [i915#9781])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-mtlp-4/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12031]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-2/igt@gem_ctx_engines@invalid-engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-14/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-16/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#12548] / [i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb4/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#4817]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb2/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_busy@basic.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@kms_busy@basic.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-6/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb5/igt@kms_flip@2x-plain-flip-ts-check.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-4/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-7/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-16/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a4.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-15/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-tglu-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#6113]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">INCOMPLETE</a> ([i915#4839]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-tglu-8/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-7/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-tglu-4/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-3/igt@kms_flip@plain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-18/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-17/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-1/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@kms_hdr@static-swap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a> ([i915#9581]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_plane@planar-pixel-format-settings.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">SKIP</a> ([i915#7294]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">SKIP</a> ([i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> ([i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb5/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> ([i915#12276]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb6/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98@vcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-11/igt@perf_pmu@busy-accuracy-98@vcs0.html">INCOMPLETE</a> ([i915#9853]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@perf_pmu@busy-accuracy-98@vcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#10887]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#9697])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-18/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212] / [i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-16/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-5/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> ([i915#5190] / [i915#9197]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> ([i915#5190] / [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> ([i915#9197]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#11616] / [i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb5/igt@kms_content_protection@lic-type-1.html">INCOMPLETE</a> ([i915#8816]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb7/igt@kms_content_protection@lic-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg1-16/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg1-18/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424])</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-tglu-3/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#8063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-tglu-2/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-snb7/igt@kms_content_protection@srm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-snb2/igt@kms_content_protection@srm.html">INCOMPLETE</a> ([i915#8816])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#11453] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> ([i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103] / [i915#4213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-11/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12004/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15614/shard-dg2-6/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588]) -&gt; <a href="https://intel-gfx-ci.01.org">SKIP</a> ([i915#9197])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7157339955379165826==--
