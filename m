Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7DFD735E4
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 23:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0726410E371;
	Fri, 29 Nov 2024 23:34:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D562210E368;
 Fri, 29 Nov 2024 23:34:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_runner=3A_Allow_limits_a?=
 =?utf-8?q?t_dumping_dmesg_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Nov 2024 23:34:49 -0000
Message-ID: <173292328986.453084.9748469175261086008@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129204550.116355-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241129204550.116355-1-kamil.konieczny@linux.intel.com>
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

Series: runner: Allow limits at dumping dmesg (rev3)
URL   : https://patchwork.freedesktop.org/series/140182/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8132_full -> IGTPW_12223_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12223_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12223_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12223_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1] +3 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk9/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@i915_module_load@reload:
    - shard-dg2:          [PASS][2] -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-8/igt@i915_module_load@reload.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-11/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-rkl:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:
    - shard-dg2:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html

  
#### Warnings ####

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][10] ([i915#9519]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_hdr@brightness-with-hdr:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-9/igt@kms_hdr@brightness-with-hdr.html

  
Known issues
------------

  Here are the changes found in IGTPW_12223_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8411]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8411]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#8411])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][16] ([i915#11814] / [i915#11815])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8414]) +8 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#8414])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-7/igt@drm_fdinfo@virtual-busy.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8414]) +9 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@drm_fdinfo@virtual-busy-all.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#3936])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-7/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3936])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#3555] / [i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-9/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][25] -> [INCOMPLETE][26] ([i915#7297]) +1 other test incomplete
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-2/igt@gem_ccs@suspend-resume.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-2/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#7697])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#7697])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#8562])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][30] ([i915#11980] / [i915#12580])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-5/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][31] ([i915#11980] / [i915#12580])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@gem_ctx_persistence@hostile.html
    - shard-tglu:         [PASS][32] -> [FAIL][33] ([i915#11980] / [i915#12580])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-10/igt@gem_ctx_persistence@hostile.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-10/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hang:
    - shard-snb:          NOTRUN -> [SKIP][34] ([i915#1099]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hang.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-10/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-1/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#280])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [FAIL][38] ([i915#5784])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4771])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@gem_exec_balancer@bonded-dual.html
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4771])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4036])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@gem_exec_balancer@invalid-bonds.html
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4036])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#8555])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-14/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#4525])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3539] / [i915#4852])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-6/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3281]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-cpu-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#3281])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-wc-active.html
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#3281]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@gem_exec_reloc@basic-cpu-wc-active.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3281]) +10 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-14/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-4/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4537] / [i915#4812]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4812]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][54] ([i915#7975] / [i915#8213]) +1 other test abort
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-2/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4860])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4860]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#2190])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-5/igt@gem_huc_copy@huc-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][58] ([i915#2190])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4613])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-4/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#4613]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-10/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][61] ([i915#4613]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk9/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4613]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][63] ([i915#4613])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#8289])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-4/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4077]) +13 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4083]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-6/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4083]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-2/igt@gem_mmap_wc@read-write.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4083]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3282]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][71] ([i915#2658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-9/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3282]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-14/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          NOTRUN -> [TIMEOUT][73] ([i915#12964])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-4/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#13033])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4270]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          NOTRUN -> [TIMEOUT][76] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4270]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-on.html
    - shard-tglu:         [PASS][78] -> [SKIP][79] ([i915#4270]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-on.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_readwrite@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#3282]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-5/igt@gem_readwrite@read-write.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#5190] / [i915#8428]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-1/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#8428])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-7/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4079]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-14/igt@gem_set_tiling_vs_gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4079])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-6/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4885])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4885])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-8/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4077]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-8/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4077]) +12 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-10/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#3297]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-6/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#3297] / [i915#3323])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3281] / [i915#3297])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-7/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3281] / [i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#3297]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#3297]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#3297])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#2856]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-11/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-5/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#2527])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-2/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-tglu-1:       NOTRUN -> [SKIP][99] ([i915#2527] / [i915#2856]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_fb_tiling:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4881])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         NOTRUN -> [ABORT][101] ([i915#13010])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-6/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         NOTRUN -> [ABORT][102] ([i915#12817] / [i915#13010] / [i915#9820])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          NOTRUN -> [ABORT][103] ([i915#9820])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#6412])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-1/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#6412])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-3/igt@i915_module_load@resize-bar.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#6412])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-5/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#6590]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-7/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [WARN][108] ([i915#2681]) +6 other tests warn
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#11681] / [i915#6621])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#4387])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#5723])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][112] ([i915#9311]) +1 other test dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk3/igt@i915_selftest@mock.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk:          [PASS][113] -> [INCOMPLETE][114] ([i915#4817]) +1 other test incomplete
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-glk3/igt@i915_suspend@basic-s3-without-i915.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][115] ([i915#4817])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4212])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4212]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#4212])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-5/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#8709]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#8709]) +7 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#8709]) +11 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#6228])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@kms_async_flips@invalid-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#6228])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-7/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#1769] / [i915#3555])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][125] ([i915#12964]) +13 other tests dmesg-warn
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-b-hdmi-a-2.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4538] / [i915#5286]) +7 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#5286]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#5286]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#5286]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][130] -> [FAIL][131] ([i915#5138])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#3638])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#3638])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          [PASS][134] -> [DMESG-WARN][135] ([i915#4423]) +4 other tests dmesg-warn
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg1-13/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4538] / [i915#5190]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#5190]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538]) +5 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-14/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][139] +111 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][140] ([i915#6095]) +29 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#6095]) +170 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#12313])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#6095]) +93 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#6095]) +84 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#12313]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#6095]) +19 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][148] +346 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#12805])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#12805])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#6095]) +13 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#10307] / [i915#6095]) +156 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#4423] / [i915#6095]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#12313])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#3742])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-1/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#3742])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#3742])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#3742])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#11616] / [i915#7213]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#4087]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#7828]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#7828]) +10 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-10/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#7828]) +7 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#7828]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#7828]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-2/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7828]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#4423] / [i915#7828])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-1:
    - shard-rkl:          [PASS][168] -> [DMESG-WARN][169] ([i915#12964]) +45 other tests dmesg-warn
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-2/igt@kms_color@ctm-max@pipe-b-hdmi-a-1.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-2/igt@kms_color@ctm-max@pipe-b-hdmi-a-1.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-9/igt@kms_content_protection@atomic-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#7118] / [i915#9424])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-3/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#7118] / [i915#9424])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#3116] / [i915#3299]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#6944] / [i915#9424]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-7/igt@kms_content_protection@lic-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#9424])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@kms_content_protection@lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#9424])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-2/igt@kms_content_protection@lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#9424])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#6944] / [i915#9424]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_content_protection@uevent.html
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#7116] / [i915#9424])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#13049]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#13049]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#13049]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#13049]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#3555]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#3555]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#3555]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#3555] / [i915#8814])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][189] ([i915#7882])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#4103] / [i915#4213])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#4103])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#4103] / [i915#4213])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - shard-glk:          NOTRUN -> [FAIL][193] ([i915#2346])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk8/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - shard-rkl:          [PASS][194] -> [DMESG-WARN][195] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#5354]) +24 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][197] +9 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#9809]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#9067])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#4103]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#9833])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-11/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#8588])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-7/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#8588])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#8588])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3804])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#1257])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [PASS][207] -> [SKIP][208] ([i915#12402])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-10/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#3555] / [i915#3840]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-5/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#3840])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3840])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#3555] / [i915#3840])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#3555] / [i915#3840]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][214] ([i915#9878])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk9/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#3469])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#3469])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#2065] / [i915#4854])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-9/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#1839])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#658])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#658])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#3637]) +8 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-2/igt@kms_flip@2x-flip-vs-modeset.html
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#3637]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-4/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#9934]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#9934]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][225] ([i915#3637]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#9934]) +8 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-mtlp:         [PASS][227] -> [FAIL][228] ([i915#11989]) +6 other tests fail
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][229] ([i915#11989]) +6 other tests fail
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-10/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2:          [PASS][230] -> [FAIL][231] ([i915#13027])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-1/igt@kms_flip@flip-vs-expired-vblank.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][232] ([i915#1982] / [i915#4839])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][233] ([i915#1982])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          [PASS][234] -> [FAIL][235] ([i915#11989]) +3 other tests fail
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-snb5/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-snb1/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1:
    - shard-tglu-1:       NOTRUN -> [FAIL][236] ([i915#11989]) +3 other tests fail
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-tglu:         [PASS][237] -> [FAIL][238] ([i915#11989]) +5 other tests fail
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-6/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-5/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a2:
    - shard-rkl:          [PASS][239] -> [FAIL][240] ([i915#11989]) +4 other tests fail
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-1/igt@kms_flip@plain-flip-ts-check@b-hdmi-a2.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-1/igt@kms_flip@plain-flip-ts-check@b-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#2672] / [i915#3555]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#2672] / [i915#3555]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#2672]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#2672] / [i915#3555])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][245] ([i915#2587] / [i915#2672]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#2587] / [i915#2672]) +5 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#2672] / [i915#3555]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#2672]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#2587] / [i915#2672] / [i915#3555])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#2587] / [i915#2672]) +6 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#2672] / [i915#3555]) +4 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][255] -> [FAIL][256] ([i915#6880]) +1 other test fail
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#8708]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#1825]) +21 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][259] +62 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#3023]) +9 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][261] +62 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-snb:          NOTRUN -> [SKIP][262] +93 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#8708]) +13 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][264] ([i915#9766])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#3458]) +11 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#10433] / [i915#3458]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#1825]) +16 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#3458]) +21 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#8708]) +21 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#3555] / [i915#8228])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          [PASS][271] -> [SKIP][272] ([i915#3555] / [i915#8228])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-10/igt@kms_hdr@bpc-switch-suspend.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#3555] / [i915#8228])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#12388])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#12394])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-9/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#12388]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#12339]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-10/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#12339])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#6301])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][280] +7 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-4/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][281] ([i915#12178])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk2/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][282] ([i915#7862]) +1 other test fail
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][283] ([i915#12169])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk8/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][284] ([i915#10647]) +1 other test fail
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk8/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#8821])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#12247]) +9 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#12247]) +9 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#12247] / [i915#6953]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#12247]) +21 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - shard-rkl:          [PASS][290] -> [DMESG-WARN][291] ([i915#12964] / [i915#1982])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#12247] / [i915#6953])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#12247]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#4423] / [i915#5354])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#9685])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#3828])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         NOTRUN -> [FAIL][297] ([i915#9295])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-mtlp:         NOTRUN -> [FAIL][298] ([i915#12912])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-2/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#9685])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-6/igt@kms_pm_dc@dc6-psr.html
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#9685])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-2/igt@kms_pm_dc@dc6-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#9685])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][302] -> [SKIP][303] ([i915#4281])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#9340])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#8430])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#9519]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-mtlp:         NOTRUN -> [SKIP][307] ([i915#9519])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [PASS][308] -> [SKIP][309] ([i915#9519])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#9519])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#9519])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][312] -> [SKIP][313] ([i915#9519]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#11520]) +9 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#11520]) +2 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][316] ([i915#11520]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-snb4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][317] ([i915#11520]) +4 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#11520]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#11520]) +11 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#12316]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][321] ([i915#11520]) +7 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk4/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#9683])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-3/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#9683]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@kms_psr2_su@page_flip-p010.html
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#9683]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#9683]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][326] ([i915#4348]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#9732]) +22 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-4/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#9688]) +6 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-8/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#1072] / [i915#9732]) +15 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-3/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html

  * igt@kms_psr@pr-cursor-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#1072] / [i915#9732]) +23 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@kms_psr@pr-cursor-mmap-gtt.html

  * igt@kms_psr@pr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][331] ([i915#9732]) +13 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#1072] / [i915#9732]) +7 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-7/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][333] ([i915#9685]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#4884])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#4235])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-5/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#5289])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#5289])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][338] ([i915#5289]) +3 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#3555]) +6 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#3555]) +8 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][341] ([i915#12231]) +1 other test abort
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-4/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][342] ([i915#12231]) +1 other test abort
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk1/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#3555] / [i915#8809])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-8/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][344] ([i915#8623]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern.html
    - shard-tglu:         NOTRUN -> [SKIP][345] ([i915#8623]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#8623])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#8623])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [PASS][348] -> [DMESG-FAIL][349] ([i915#12964]) +2 other tests dmesg-fail
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-2/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#3555] / [i915#8808])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-7/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#11920])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-6/igt@kms_vrr@lobf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][352] ([i915#11920])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#11920])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][354] ([i915#9906])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-9/igt@kms_vrr@max-min.html
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#9906])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-3/igt@kms_vrr@max-min.html
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#9906])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#3555] / [i915#9906])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-5/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#2437] / [i915#9412])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#2437] / [i915#9412])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-tglu-1:       NOTRUN -> [SKIP][360] ([i915#2437] / [i915#9412])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-glk:          NOTRUN -> [SKIP][361] ([i915#2437])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-glk1/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#7387])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-6/igt@perf@global-sseu-config.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-tglu:         [PASS][363] -> [FAIL][364] ([i915#12513] / [i915#4349])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-3/igt@perf_pmu@busy-accuracy-98.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-10/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-accuracy-98@vecs0:
    - shard-tglu:         [PASS][365] -> [FAIL][366] ([i915#4349])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-3/igt@perf_pmu@busy-accuracy-98@vecs0.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-10/igt@perf_pmu@busy-accuracy-98@vecs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#8850])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-3/igt@perf_pmu@cpu-hotplug.html
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#8850])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@perf_pmu@cpu-hotplug.html
    - shard-tglu:         NOTRUN -> [SKIP][369] ([i915#8850])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-9/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][370] +10 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-11/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-tglu:         [PASS][371] -> [ABORT][372] ([i915#13010]) +1 other test abort
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-9/igt@perf_pmu@module-unload.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-9/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#8516])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@semaphore-busy:
    - shard-dg2:          [PASS][374] -> [FAIL][375] ([i915#4349]) +1 other test fail
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-6/igt@perf_pmu@semaphore-busy.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-6/igt@perf_pmu@semaphore-busy.html

  * igt@perf_pmu@semaphore-busy@bcs0:
    - shard-mtlp:         [PASS][376] -> [FAIL][377] ([i915#4349]) +2 other tests fail
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-2/igt@perf_pmu@semaphore-busy@bcs0.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-2/igt@perf_pmu@semaphore-busy@bcs0.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][378] ([i915#9351])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][379] ([i915#9351])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][380] ([i915#3708] / [i915#4077])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-4/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#3708] / [i915#4077])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-18/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#3708] / [i915#4077])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#3708]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-12/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@fence-read-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][384] ([i915#3708])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-2/igt@prime_vgem@fence-read-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#3708])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-1/igt@prime_vgem@fence-read-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][386] ([i915#3708])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-5/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          NOTRUN -> [SKIP][387] ([i915#9917])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-7/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][388] ([i915#12910]) +18 other tests fail
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-2/igt@sriov_basic@bind-unbind-vf@vf-4.html

  
#### Possible fixes ####

  * igt@gem_cs_tlb@engines@rcs0:
    - shard-rkl:          [DMESG-WARN][389] ([i915#12964]) -> [PASS][390] +58 other tests pass
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-1/igt@gem_cs_tlb@engines@rcs0.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@gem_cs_tlb@engines@rcs0.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          [FAIL][391] ([i915#9561]) -> [PASS][392] +1 other test pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-6/igt@gem_ctx_freq@sysfs.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-10/igt@gem_ctx_freq@sysfs.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [ABORT][393] ([i915#7975] / [i915#8213]) -> [PASS][394]
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg1-14/igt@gem_eio@hibernate.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg1-13/igt@gem_eio@hibernate.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-tglu:         [ABORT][395] ([i915#7975] / [i915#8213]) -> [PASS][396] +1 other test pass
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-5/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         [SKIP][397] ([i915#4270]) -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-5/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][399] ([i915#9820]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [ABORT][401] ([i915#9820]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [ABORT][403] ([i915#10131]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-rkl:          [SKIP][405] -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-5/igt@i915_pm_rpm@gem-evict-pwrite.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_suspend@debugfs-reader:
    - shard-mtlp:         [INCOMPLETE][407] -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-4/igt@i915_suspend@debugfs-reader.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-6/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [INCOMPLETE][409] ([i915#4817]) -> [PASS][410]
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-5/igt@i915_suspend@sysfs-reader.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-5/igt@i915_suspend@sysfs-reader.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-mtlp:         [FAIL][411] ([i915#12469]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [FAIL][413] -> [PASS][414] +3 other tests pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a2:
    - shard-rkl:          [FAIL][415] ([i915#11989] / [i915#12840]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-3/igt@kms_flip@blocking-wf_vblank@b-hdmi-a2.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-1/igt@kms_flip@blocking-wf_vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2:          [FAIL][417] ([i915#11989]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          [FAIL][419] ([i915#11989]) -> [PASS][420] +3 other tests pass
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1:
    - shard-snb:          [FAIL][421] ([i915#11989]) -> [PASS][422] +4 other tests pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-snb5/igt@kms_flip@flip-vs-absolute-wf_vblank@b-vga1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
    - shard-mtlp:         [FAIL][423] ([i915#11989] / [i915#13071]) -> [PASS][424]
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
    - shard-tglu:         [FAIL][425] ([i915#11989]) -> [PASS][426] +5 other tests pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-tglu-10/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-mtlp:         [FAIL][427] ([i915#11989]) -> [PASS][428] +4 other tests pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2:          [FAIL][429] ([i915#6880]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][431] ([i915#9519]) -> [PASS][432] +1 other test pass
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][433] ([i915#9519]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [FAIL][435] ([IGT#160]) -> [PASS][436]
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-2/igt@kms_sysfs_edid_timing.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-10/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-rkl:          [DMESG-WARN][437] ([i915#12917] / [i915#12964]) -> [PASS][438]
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-rkl-2/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [FAIL][439] ([i915#11943]) -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-dg2-11/igt@perf_pmu@all-busy-idle-check-all.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-dg2-4/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         [FAIL][441] ([i915#11943]) -> [PASS][442]
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8132/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [FAIL][443] ([i915#4349]) -> [PASS][444] +1 other test pass
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12223/index.html
