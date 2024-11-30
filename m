Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39AED735EA
	for <igt-dev@archiver.kernel.org>; Sat, 30 Nov 2024 00:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7163110E055;
	Sat, 30 Nov 2024 00:35:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7134A10E055;
 Sat, 30 Nov 2024 00:35:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib/pciids=3A_add_missin?=
 =?utf-8?q?g_PTL_pciid_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 30 Nov 2024 00:35:43 -0000
Message-ID: <173292694345.488781.5563757228105955124@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129174221.313955-1-matthew.auld@intel.com>
In-Reply-To: <20241129174221.313955-1-matthew.auld@intel.com>
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

Series: lib/pciids: add missing PTL pciid (rev2)
URL   : https://patchwork.freedesktop.org/series/141940/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8132_full -> IGTPW_12224_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12224_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12224_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12224_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu-1:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk9/igt@gem_workarounds@suspend-resume.html

  * igt@i915_selftest@live:
    - shard-dg2:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-10/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-11/igt@i915_selftest@live.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12224_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8411]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-12/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8411])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][12] ([i915#11814] / [i915#11815])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8414]) +12 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#8414])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-5/igt@drm_fdinfo@virtual-busy.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#8414]) +8 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-8/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#3936])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-6/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#3936])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-18/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][19] ([i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9323]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-18/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8562])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-12/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][25] ([i915#11980] / [i915#12580])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-2/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][26] ([i915#11980] / [i915#12580])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-12/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         [PASS][27] -> [FAIL][28] ([i915#11980] / [i915#12580])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-10/igt@gem_ctx_persistence@hostile.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hang:
    - shard-snb:          NOTRUN -> [SKIP][29] ([i915#1099]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-snb4/igt@gem_ctx_persistence@legacy-engines-hang.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-1/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-4/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][34] ([i915#5784])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][35] -> [FAIL][36] ([i915#12543] / [i915#5784])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg1-14/igt@gem_eio@reset-stress.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-12/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4771])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-8/igt@gem_exec_balancer@bonded-dual.html
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4771])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4036])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-4/igt@gem_exec_balancer@invalid-bonds.html
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4036])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#8555])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#4525])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-3/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#6334]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-5/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fence@syncobj-channel:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][44] ([i915#12964]) +7 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-3/igt@gem_exec_fence@syncobj-channel.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3539])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@gem_exec_flush@basic-uc-set-default.html
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3539])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-7/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3281]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-10/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-cpu-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#3281])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-wc-active.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#3281]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-3/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3281]) +11 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4812]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@gem_exec_schedule@preempt-queue.html
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4537] / [i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4537] / [i915#4812]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4860])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4860])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#4613] / [i915#7582])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#4613]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-7/igt@gem_lmem_swapping@heavy-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4613])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-5/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][61] ([i915#4613])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][62] ([i915#4613]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk8/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-5/igt@gem_lmem_swapping@verify.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#8289])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-7/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4083]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-1/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4083]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-5/igt@gem_mmap_wc@read-write.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4083]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-12/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3282]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-10/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3282]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3282]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][71] ([i915#2658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-3/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#4270])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          NOTRUN -> [TIMEOUT][73] ([i915#12964])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-3/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4270]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-8/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#4270]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4270]) +6 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          NOTRUN -> [TIMEOUT][77] ([i915#12917] / [i915#12964])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_readwrite@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#3282]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-2/igt@gem_readwrite@read-write.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#5190] / [i915#8428]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-10/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#8428])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-7/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#4079])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-2/igt@gem_set_tiling_vs_gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4079])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-8/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4885])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-18/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4885])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-8/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4885])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4077]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-8/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4077]) +13 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-11/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4077]) +13 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-18/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_basic:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#4079])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#3297]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-3/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#3297] / [i915#3323])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-9/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-12/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3281] / [i915#3297])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-1/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3281] / [i915#3297])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#3297])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-6/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#2856]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-2/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#2527] / [i915#2856]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-7/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#2527])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-5/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#2527]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#2527] / [i915#2856]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         NOTRUN -> [ABORT][102] ([i915#13010])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-4/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         NOTRUN -> [ABORT][103] ([i915#12817] / [i915#9820])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          [PASS][104] -> [ABORT][105] ([i915#9820])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#6412])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-3/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#7178])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@i915_module_load@resize-bar.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#6412])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-7/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][109] -> [INCOMPLETE][110] ([i915#12455]) +1 other test incomplete
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#6590]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-10/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][112] -> [FAIL][113] ([i915#12942]) +1 other test fail
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [WARN][114] ([i915#2681]) +6 other tests warn
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - shard-dg1:          [PASS][115] -> [FAIL][116] ([i915#12739] / [i915#3591])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [PASS][117] -> [FAIL][118] ([i915#3591]) +2 other tests fail
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#11681] / [i915#6621])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#11681])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#4387])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][122] ([i915#9311]) +1 other test dmesg-warn
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          [PASS][123] -> [INCOMPLETE][124] ([i915#4817])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-glk5/igt@i915_suspend@fence-restore-untiled.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4212]) +5 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4212])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-2/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#4212])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#8709]) +7 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#6228])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-10/igt@kms_async_flips@invalid-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#6228])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-5/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-glk:          [PASS][131] -> [FAIL][132] ([i915#12177])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-glk4/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs:
    - shard-glk:          [PASS][133] -> [FAIL][134] ([i915#11859])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-glk4/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking@2x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#1769] / [i915#3555])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#1769] / [i915#3555])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#5286]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538] / [i915#5286]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#5286]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#5286])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#5286]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#3638])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][143] +9 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-11/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#3638])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#4538] / [i915#5190]) +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#5190])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#4538]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][148] +124 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#6095]) +34 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#12313])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#6095]) +95 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#10307] / [i915#6095]) +156 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#12313])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#12313]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#6095]) +19 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#12805])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#6095]) +29 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#6095]) +89 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#12313]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#6095]) +165 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#11616] / [i915#7213])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-2/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#3742])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#3742])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#3742]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7213]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#3742])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#4087]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-8/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#7828]) +8 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#7828]) +10 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-4/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#7828]) +4 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#7828]) +10 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#7828]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-2/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#7828]) +7 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-6/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-7/igt@kms_content_protection@atomic-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#7118] / [i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-8/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#7118] / [i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#3116] / [i915#3299]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-9/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#6944] / [i915#9424]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-8/igt@kms_content_protection@lic-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#9424])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-4/igt@kms_content_protection@lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#9424])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-1/igt@kms_content_protection@lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#9424])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@kms_content_protection@lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#6944] / [i915#9424])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-6/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#7116])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-18/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#6944] / [i915#7116] / [i915#7118])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-5/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-rkl:          [PASS][186] -> [DMESG-WARN][187] ([i915#12964]) +62 other tests dmesg-warn
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#13049]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#3555]) +9 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#13049]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#13049]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#3555] / [i915#8814])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#13049])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#13049]) +4 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][195] ([i915#4103]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#4103])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#4103] / [i915#4213])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#5354]) +33 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][199] +8 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#9809]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#4103])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#9833])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#8588])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-7/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu-1:       NOTRUN -> [SKIP][204] ([i915#8588])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#8588])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3804])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#3555] / [i915#3840]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-12/igt@kms_dsc@dsc-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#3555] / [i915#3840]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3840])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3840])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#3555] / [i915#3840])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-6/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#3840] / [i915#9053])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][213] ([i915#9878])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#3469])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#3469])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#2065] / [i915#4854])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-10/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu-1:       NOTRUN -> [SKIP][217] ([i915#1839])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#9337])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#658])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#658])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#8381])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#3637]) +9 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-5/igt@kms_flip@2x-flip-vs-modeset.html
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#3637]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-2/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#9934]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#9934]) +4 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#3637]) +5 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#9934]) +13 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a3:
    - shard-dg2:          [PASS][228] -> [FAIL][229] ([i915#11989])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-5/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a3.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-tglu:         [PASS][230] -> [FAIL][231] ([i915#11989]) +1 other test fail
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-9/igt@kms_flip@plain-flip-ts-check.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-5/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#2672] / [i915#3555]) +6 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#2672] / [i915#3555]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#2672]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#2587] / [i915#2672]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#2672] / [i915#3555])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#2587] / [i915#2672])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#2672]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#2587] / [i915#2672] / [i915#3555])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#2587] / [i915#2672]) +8 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#2672] / [i915#3555]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#2672] / [i915#3555]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][246] -> [FAIL][247] ([i915#6880]) +3 other tests fail
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#8708]) +23 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#8708]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#1825]) +20 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] +46 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][252] +63 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][253] ([i915#10056])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-snb:          NOTRUN -> [SKIP][254] +95 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#8708]) +11 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#3458]) +24 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#9766])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-glk:          NOTRUN -> [SKIP][258] +308 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk8/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#10433] / [i915#3458])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#3023]) +8 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#1825]) +15 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#3458]) +12 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          [PASS][263] -> [SKIP][264] ([i915#3555] / [i915#8228])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#3555] / [i915#8228])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#3555] / [i915#8228])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#12388])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#12394])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#12394])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#10656])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#12388]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#12339]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#12339])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#6301])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][275] +7 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk:          NOTRUN -> [INCOMPLETE][276] ([i915#12756] / [i915#1982])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][277] ([i915#1982]) +2 other tests incomplete
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#8821])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#12247]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#12247]) +8 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#12247]) +13 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#3555]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-tglu-1:       NOTRUN -> [SKIP][283] ([i915#12247]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-rkl:          [PASS][284] -> [DMESG-WARN][285] ([i915#12964] / [i915#1982])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#12247] / [i915#6953])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#12247]) +12 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#12247] / [i915#6953])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#12247] / [i915#6953])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#5354]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#9685]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-9/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#3828])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#3361])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-mtlp:         NOTRUN -> [FAIL][294] ([i915#12912])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-4/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#9685])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-6/igt@kms_pm_dc@dc6-psr.html
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#9685])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#9340])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-18/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#9519])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#9519])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][300] -> [SKIP][301] ([i915#9519])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#9519]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][303] -> [SKIP][304] ([i915#12916])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-tglu:         NOTRUN -> [ABORT][305] ([i915#10159] / [i915#10553])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-9/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#11520]) +11 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#11520]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][308] ([i915#11520]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-snb5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#11520]) +7 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#11520]) +9 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][311] ([i915#12316]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#11520]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][313] ([i915#11520]) +8 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#9683])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-4/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#9683]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#9683]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-18/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#9683]) +2 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-9/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#4348]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][319] ([i915#9732]) +11 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#9732]) +29 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-2/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#9688]) +6 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-5/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html

  * igt@kms_psr@pr-cursor-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#1072] / [i915#9732]) +22 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@kms_psr@pr-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][323] ([i915#1072] / [i915#9732]) +15 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-4/igt@kms_psr@psr2-cursor-blt.html
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#1072] / [i915#9732]) +7 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-4/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#9685]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#4884])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-12/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#4235])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-2/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#5289])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#5289])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#5289]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#12755])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#3555]) +9 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][333] ([i915#12231]) +1 other test abort
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@kms_selftest@drm_framebuffer.html
    - shard-tglu-1:       NOTRUN -> [ABORT][334] ([i915#12231]) +1 other test abort
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][335] ([i915#12231]) +1 other test abort
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk8/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][336] ([i915#3555]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#3555] / [i915#8809])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-3/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#3555])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#8623]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#8623])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#8623])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [PASS][342] -> [DMESG-FAIL][343] ([i915#12964]) +6 other tests dmesg-fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         NOTRUN -> [SKIP][344] ([i915#3555] / [i915#8808])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-5/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#11920])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-1/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#11920])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#9906])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-7/igt@kms_vrr@max-min.html
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#9906])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-2/igt@kms_vrr@max-min.html
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#9906])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#3555] / [i915#9906])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#9906]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#2437] / [i915#9412])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#2437] / [i915#9412])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#2437] / [i915#9412])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-13/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#2437] / [i915#9412])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][356] ([i915#2437]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk3/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#7387])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-8/igt@perf@global-sseu-config.html

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - shard-dg2:          NOTRUN -> [FAIL][358] ([i915#4349]) +5 other tests fail
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-1/igt@perf_pmu@busy-idle-check-all@vcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#8850])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@perf_pmu@cpu-hotplug.html
    - shard-rkl:          NOTRUN -> [SKIP][360] ([i915#8850])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-3/igt@perf_pmu@cpu-hotplug.html
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#8850])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@perf_pmu@cpu-hotplug.html
    - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#8850])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-2/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#8516])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][364] ([i915#8516])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@semaphore-busy:
    - shard-dg2:          [PASS][365] -> [FAIL][366] ([i915#4349]) +2 other tests fail
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-6/igt@perf_pmu@semaphore-busy.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@perf_pmu@semaphore-busy.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [PASS][367] -> [FAIL][368] ([i915#4349]) +1 other test fail
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg1-12/igt@perf_pmu@semaphore-busy@vcs1.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-mtlp:         [PASS][369] -> [FAIL][370] ([i915#4349]) +2 other tests fail
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vecs0.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-7/igt@perf_pmu@semaphore-busy@vecs0.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][371] ([i915#9351])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][372] ([i915#9351])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][373] ([i915#3708] / [i915#4077])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-4/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#3708] / [i915#4077])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#3708] / [i915#4077])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#3708]) +2 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-14/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][377] ([i915#3708])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-4/igt@prime_vgem@fence-read-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][378] ([i915#3708])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-11/igt@prime_vgem@fence-read-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#3708])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-1/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#9917])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-1/igt@sriov_basic@bind-unbind-vf.html
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#9917])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][382] ([i915#12910]) +18 other tests fail
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-3/igt@sriov_basic@bind-unbind-vf@vf-4.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-tglu-1:       NOTRUN -> [FAIL][383] ([i915#12910]) +9 other tests fail
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-tglu:         [ABORT][384] ([i915#12817] / [i915#5507]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-9/igt@device_reset@unbind-reset-rebind.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-2/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [FAIL][386] ([i915#9561]) -> [PASS][387] +1 other test pass
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-6/igt@gem_ctx_freq@sysfs.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-6/igt@gem_ctx_freq@sysfs.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [ABORT][388] ([i915#7975] / [i915#8213]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg1-14/igt@gem_eio@hibernate.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@gem_eio@hibernate.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [ABORT][390] ([i915#7975] / [i915#8213]) -> [PASS][391] +1 other test pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][392] ([i915#5493]) -> [PASS][393] +1 other test pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg1-14/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         [SKIP][394] ([i915#4270]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-5/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-5/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][396] ([i915#9820]) -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-rkl:          [SKIP][398] -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-5/igt@i915_pm_rpm@gem-evict-pwrite.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-3/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_selftest@live:
    - shard-rkl:          [DMESG-FAIL][400] -> [PASS][401] +1 other test pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-3/igt@i915_selftest@live.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         [ABORT][402] ([i915#13010]) -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-7/igt@i915_selftest@live@sanitycheck.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-3/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-mtlp:         [INCOMPLETE][404] -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-4/igt@i915_suspend@debugfs-reader.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-4/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [INCOMPLETE][406] ([i915#4817]) -> [PASS][407]
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-5/igt@i915_suspend@sysfs-reader.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-snb:          [FAIL][408] ([i915#2346]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-snb4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-rkl:          [FAIL][410] ([i915#11989] / [i915#12840]) -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-3/igt@kms_flip@blocking-wf_vblank.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          [FAIL][412] ([i915#11989]) -> [PASS][413] +3 other tests pass
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1:
    - shard-rkl:          [FAIL][414] -> [PASS][415]
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:
    - shard-dg2:          [FAIL][416] ([i915#11989]) -> [PASS][417]
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1:
    - shard-snb:          [FAIL][418] ([i915#11989]) -> [PASS][419] +4 other tests pass
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
    - shard-mtlp:         [FAIL][420] ([i915#11989] / [i915#13071]) -> [PASS][421]
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
    - shard-tglu:         [FAIL][422] ([i915#11989]) -> [PASS][423] +7 other tests pass
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-tglu-4/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-mtlp:         [FAIL][424] ([i915#11989]) -> [PASS][425] +4 other tests pass
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-rkl:          [DMESG-WARN][426] ([i915#12964]) -> [PASS][427] +63 other tests pass
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2:          [FAIL][428] ([i915#6880]) -> [PASS][429] +3 other tests pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][430] ([i915#3555] / [i915#8228]) -> [PASS][431]
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][432] ([i915#9519]) -> [PASS][433] +3 other tests pass
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][434] ([i915#9519]) -> [PASS][435] +1 other test pass
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-rkl:          [DMESG-WARN][436] ([i915#12917] / [i915#12964]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-rkl-7/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@perf@blocking:
    - shard-glk:          [FAIL][438] ([i915#10538]) -> [PASS][439] +1 other test pass
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-glk5/igt@perf@blocking.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-glk3/igt@perf@blocking.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [FAIL][440] ([i915#11943]) -> [PASS][441]
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-dg2-4/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         [FAIL][442] ([i915#11943]) -> [PASS][443]
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [FAIL][444] ([i915#4349]) -> [PASS][445]
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-8/igt@perf_pmu@busy-double-start@bcs0.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/shard-mtlp-4/igt@per

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12224/index.html
