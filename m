Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB35EE77180
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 16:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C09510E4D4;
	Mon,  9 Dec 2024 16:39:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E35A10E4D4;
 Mon,  9 Dec 2024 16:39:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_test/kms=5Fcontent=5Fpro?=
 =?utf-8?q?tection=3A_Account_for_reauthetication_in_LIC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Dec 2024 16:39:48 -0000
Message-ID: <173376238824.510855.1475921117681592271@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241203061519.2121105-1-suraj.kandpal@intel.com>
In-Reply-To: <20241203061519.2121105-1-suraj.kandpal@intel.com>
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

Series: test/kms_content_protection: Account for reauthetication in LIC (rev2)
URL   : https://patchwork.freedesktop.org/series/141871/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15775_full -> IGTPW_12231_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12231_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12231_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/index.html

Participating hosts (9 -> 11)
------------------------------

  Additional (2): shard-snb-0 shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12231_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-glk3/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_suspend@debugfs-reader:
    - shard-snb:          NOTRUN -> [ABORT][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-snb7/igt@i915_suspend@debugfs-reader.html

  
Known issues
------------

  Here are the changes found in IGTPW_12231_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#11078])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#11078])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#11078])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-2/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#11078])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-2/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs0:
    - shard-dg2:          NOTRUN -> [SKIP][7] ([i915#8414]) +8 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-4/igt@drm_fdinfo@busy-idle-check-all@vcs0.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#8414]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-14/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-4/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][12] ([i915#1099])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-snb2/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8555])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8555])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#280])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-4/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#280])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-14/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#280])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-10/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@hang:
    - shard-dg2:          NOTRUN -> [ABORT][19] ([i915#13218]) +28 other tests abort
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-3/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#4525]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-10/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#4525]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@gem_exec_balancer@parallel-out-fence.html
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#4525])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@gem_exec_balancer@parallel-out-fence.html
    - shard-mtlp:         NOTRUN -> [ABORT][23] ([i915#13218])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#4812]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-3/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#3281]) +6 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-10/igt@gem_exec_reloc@basic-softpin.html
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#3281]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-17/igt@gem_exec_reloc@basic-softpin.html
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#3281]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#3281]) +10 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4537] / [i915#4812])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-chain.html
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#4812]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4860]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#4860])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#4860]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-4/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#12193])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#4613]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#4565])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#4613]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][38] ([i915#4613])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][39] ([i915#4613]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-glk6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4077]) +10 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-4/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4077]) +11 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-17/igt@gem_mmap_gtt@basic-small-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4077])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4083]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-10/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4083]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3282]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-4/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-random:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#3282])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@gem_pwrite@basic-random.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#3282]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-2/igt@gem_pwrite@basic-self.html
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3282]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][49] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#13033])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-10/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4270]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-10/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][52] ([i915#12964]) +1 other test timeout
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-4/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4270]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][54] +202 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#5190] / [i915#8428]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-10/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#8428])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4079]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#8411])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4079]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3297]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-3/igt@gem_userptr_blits@unsync-unmap.html
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3297]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap.html
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3297]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap.html
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#3297]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-7/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][64] +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-8/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#2527]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-large:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#2527])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@gen9_exec_parse@bb-large.html
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#2527] / [i915#2856]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-2/igt@gen9_exec_parse@bb-large.html
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#2856])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-3/igt@gen9_exec_parse@bb-large.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][69] ([i915#12964]) +9 other tests dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          NOTRUN -> [ABORT][70] ([i915#9820])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          NOTRUN -> [ABORT][71] ([i915#9820])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         NOTRUN -> [ABORT][72] ([i915#10887] / [i915#12817] / [i915#13010] / [i915#9820])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          NOTRUN -> [ABORT][73] ([i915#9820])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-glk5/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         NOTRUN -> [ABORT][74] ([i915#10131] / [i915#10887] / [i915#9820])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#6412])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-6/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#7178])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [ABORT][77] ([i915#13218]) +29 other tests abort
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-tglu:         NOTRUN -> [WARN][78] ([i915#2681]) +2 other tests warn
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          NOTRUN -> [FAIL][79] ([i915#3591])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          NOTRUN -> [FAIL][80] ([i915#12739] / [i915#3591])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][81] -> [INCOMPLETE][82] ([i915#7790])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15775/shard-snb1/igt@i915_pm_rps@reset.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-snb2/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#11681])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-1/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         NOTRUN -> [FAIL][84] ([i915#8346])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@i915_pm_rps@waitboost.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#7707])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-6/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4212])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-5/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4212])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#9531])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#9531])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#9531])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-14/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#9531])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [FAIL][92] ([i915#5138])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#5286]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
    - shard-tglu-1:       NOTRUN -> [SKIP][94] ([i915#5286])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#5286]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4538] / [i915#5286]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#4538] / [i915#5190]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#3638]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#3638]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-17/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4538]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-8/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][102] ([i915#6095]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#6095]) +44 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#10307] / [i915#6095]) +63 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#6095]) +73 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#6095]) +13 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][107] ([i915#12796])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#6095]) +64 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#12313])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#3742])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@kms_cdclk@plane-scaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][111] ([i915#3742])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#7828]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#7828])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_chamelium_edid@dp-mode-timings.html
    - shard-tglu-1:       NOTRUN -> [SKIP][114] ([i915#7828])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#7828]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#7828]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#7828]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-6/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#6944] / [i915#9424])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#7118])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-6/igt@kms_content_protection@srm.html
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#7118])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-2/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#7116])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#6944] / [i915#7116] / [i915#7118])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#13049])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#13049])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#13049])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#13049])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-snb:          NOTRUN -> [ABORT][127] ([i915#13242]) +12 other tests abort
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-snb7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#4103]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4103] / [i915#4213]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - shard-glk:          NOTRUN -> [FAIL][130] ([i915#2346])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-glk8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#4103]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#4213])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#4103] / [i915#4213]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-tglu-1:       NOTRUN -> [SKIP][134] ([i915#4103])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#3555]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-2/igt@kms_display_modes@extended-mode-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#3555]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@kms_display_modes@extended-mode-basic.html
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#3555]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#3555]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#3804])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#8812])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-4/igt@kms_draw_crc@draw-method-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#8812])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#3840])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#3840])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#3840])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#3840])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][146] ([i915#12745] / [i915#4839])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][147] ([i915#4839]) +1 other test incomplete
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#9934]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#9934]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#9934]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#3637]) +4 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#3637])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-rkl:          [PASS][153] -> [DMESG-WARN][154] ([i915#12964]) +3 other tests dmesg-warn
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15775/shard-rkl-4/igt@kms_flip@flip-vs-panning-interruptible.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-4/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-tglu:         NOTRUN -> [ABORT][155] ([i915#10159] / [i915#13218])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][156] ([i915#12745])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [FAIL][157] ([i915#11989] / [i915#12840]) +1 other test fail
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible.html
    - shard-dg1:          NOTRUN -> [FAIL][158] ([i915#11989] / [i915#12840])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][159] ([i915#11989])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:
    - shard-dg1:          NOTRUN -> [FAIL][160] ([i915#11989])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][161] ([i915#11989]) +4 other tests fail
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#2672] / [i915#3555]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#2672] / [i915#3555])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#2672] / [i915#3555])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#2672]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#2587] / [i915#2672]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#2587] / [i915#2672]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#2587] / [i915#2672] / [i915#3555])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#2587] / [i915#2672] / [i915#3555])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#2672]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [FAIL][172] ([i915#6880])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#8708]) +7 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#5354]) +26 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#1825]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][176] +28 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#8708])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#3458]) +14 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
    - shard-tglu-1:       NOTRUN -> [SKIP][179] +11 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#3023]) +20 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#1825]) +30 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][182] +53 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#8708]) +7 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][184] +283 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#3458]) +13 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#3555] / [i915#8228])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@kms_hdr@static-toggle-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#3555] / [i915#8228])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#11614] / [i915#3582]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#3555])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#8806])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#12247]) +9 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#12247]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#12247] / [i915#6953] / [i915#9423])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#12247] / [i915#6953]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#12247] / [i915#6953])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#12247] / [i915#6953]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#12247]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#12247]) +8 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#12247]) +12 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#12247] / [i915#3555])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#12247]) +5 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#5354])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-5/igt@kms_pm_backlight@basic-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#5354])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@kms_pm_backlight@basic-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#9812])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#3828])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#9519])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#6524] / [i915#6805])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-1/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#6524])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#6524])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-9/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#11520]) +5 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-glk:          NOTRUN -> [SKIP][212] ([i915#11520]) +5 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-glk1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#11520]) +4 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#11520]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-11/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#11520]) +5 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][216] ([i915#11520])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][217] ([i915#11520]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-snb2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#9688])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][219] ([i915#9732]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#1072] / [i915#9732]) +22 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#4077] / [i915#9688]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-mtlp-4/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#1072] / [i915#9732]) +23 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-4/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#9732]) +19 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-3/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#1072] / [i915#9732]) +22 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-17/igt@kms_psr@psr2-primary-mmap-cpu.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#12755])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-11/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#5190]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#5289])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#5289])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#5289])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-snb:          NOTRUN -> [ABORT][230] ([i915#13179]) +1 other test abort
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-snb7/igt@kms_selftest@drm_framebuffer.html

  * igt@perf@gen12-group-exclusive-stream-ctx-handle:
    - shard-tglu-1:       NOTRUN -> [ABORT][231] ([i915#13218]) +2 other tests abort
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-1/igt@perf@gen12-group-exclusive-stream-ctx-handle.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [ABORT][232] ([i915#13218]) +29 other tests abort
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][233] ([i915#4349]) +3 other tests fail
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@multi-client@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][234] ([i915#13218]) +10 other tests abort
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-snb5/igt@perf_pmu@multi-client@rcs0.html
    - shard-dg1:          NOTRUN -> [ABORT][235] ([i915#13218]) +29 other tests abort
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-12/igt@perf_pmu@multi-client@rcs0.html

  * igt@perf_pmu@render-node-busy@rcs0:
    - shard-glk:          NOTRUN -> [ABORT][236] ([i915#13218]) +25 other tests abort
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-glk7/igt@perf_pmu@render-node-busy@rcs0.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#3708]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-5/igt@prime_vgem@fence-read-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#3708]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-3/igt@prime_vgem@fence-read-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#3708]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-13/igt@prime_vgem@fence-read-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-tglu:         NOTRUN -> [FAIL][240] ([i915#12910])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#9917])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-10/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#9917])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#9917])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][244] +9 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-2/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#4818])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#4818])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-dg2-6/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload-no-display:
    - shard-rkl:          [DMESG-WARN][247] ([i915#12964]) -> [PASS][248] +1 other test pass
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15775/shard-rkl-4/igt@i915_module_load@reload-no-display.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-4/igt@i915_module_load@reload-no-display.html
    - shard-tglu:         [ABORT][249] ([i915#13010]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15775/shard-tglu-2/igt@i915_module_load@reload-no-display.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-tglu-9/igt@i915_module_load@reload-no-display.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][251] ([i915#9519]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15775/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
  [i915#10159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10159
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12653]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12653
  [i915#12739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12739
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
  [i915#12840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12840
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13010]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13010
  [i915#13033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13033
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
  [i915#13242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13242
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7790
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8806
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8134 -> IGTPW_12231
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15775: 4de82d50b8de6a278c1483a7f76ae830c89d1824 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12231: 12231
  IGT_8134: 027fbf68a00630d7bb8ae200c620296e2bad971d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12231/index.html
