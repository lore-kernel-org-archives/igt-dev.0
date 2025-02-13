Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1120C0219D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 13:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA6210EA9C;
	Thu, 13 Feb 2025 13:26:54 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0C810EAAF;
 Thu, 13 Feb 2025 13:26:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1759267575749500788=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_starting_with_=5B?=
 =?utf-8?q?i-g-t=2C1/4=5D_lib/xe=3A_Fix_a_comment_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 13 Feb 2025 13:26:53 -0000
Message-ID: <173945321354.1669668.18387082630649544624@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213021915.264978-1-oak.zeng@intel.com>
In-Reply-To: <20250213021915.264978-1-oak.zeng@intel.com>
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

--===============1759267575749500788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/4] lib/xe: Fix a comment error
URL   : https://patchwork.freedesktop.org/series/144765/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_16125_full -> IGTPW_12585_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12585_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12585_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/index.html

Participating hosts (10 -> 11)
------------------------------

  Additional (1): shard-snb-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12585_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_copy@linear:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@gem_render_copy@linear.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk8/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk1/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-snb6/igt@i915_pm_rps@reset.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-snb5/igt@i915_pm_rps@reset.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_display_modes@extended-mode-basic.html

  
New tests
---------

  New tests have been introduced between CI_DRM_16125_full and IGTPW_12585_full:

### New IGT tests (1) ###

  * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.43] s

  

Known issues
------------

  Here are the changes found in IGTPW_12585_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu:         NOTRUN -> [SKIP][7] ([i915#11078])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#8414]) +9 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8414])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][10] ([i915#7697])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#13008])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][14] -> [INCOMPLETE][15] ([i915#13356]) +1 other test incomplete
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-dg2-11/igt@gem_ccs@suspend-resume.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-3/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#7697])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-9/igt@gem_close_race@multigpu-basic-threads.html
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#7697])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][18] ([i915#6335])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8555])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#280])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-5/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg2-9:        NOTRUN -> [ABORT][24] ([i915#7975])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-mtlp:         [PASS][25] -> [ABORT][26] ([i915#13193]) +2 other tests abort
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-mtlp-1/igt@gem_eio@in-flight-contexts-immediate.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-7/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> [DMESG-FAIL][27] ([i915#4423])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][28] -> [FAIL][29] ([i915#12543] / [i915#5784])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-dg1-19/igt@gem_eio@reset-stress.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2-9:        NOTRUN -> [SKIP][30] ([i915#4771])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#4525])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#4525])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#4812]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@gem_exec_balancer@sliced.html
    - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#4812])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-5/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2-9:        NOTRUN -> [SKIP][35] ([i915#6334]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#6344])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-10/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_endless@dispatch@ccs0:
    - shard-dg2:          [PASS][37] -> [TIMEOUT][38] ([i915#3778] / [i915#7016]) +1 other test timeout
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-dg2-4/igt@gem_exec_endless@dispatch@ccs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-5/igt@gem_exec_endless@dispatch@ccs0.html

  * igt@gem_exec_fence@submit:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4812]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-17/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-8/igt@gem_exec_flush@basic-uc-ro-default.html
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#3281]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#3281]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-1/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-wc-gtt-active:
    - shard-dg2-9:        NOTRUN -> [SKIP][45] ([i915#3281])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_exec_reloc@basic-wc-gtt-active.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3281]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3281]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4537] / [i915#4812])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2-9:        NOTRUN -> [SKIP][49] ([i915#4537] / [i915#4812])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-glk:          NOTRUN -> [INCOMPLETE][51] ([i915#13196]) +1 other test incomplete
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk8/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4860])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2-9:        NOTRUN -> [SKIP][53] ([i915#4860]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4860])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][55] ([i915#2190])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#4613] / [i915#7582])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#4613]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#4613]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4613])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-5/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#4613]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][61] ([i915#4613]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk8/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#8289])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#284])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-6/igt@gem_media_vme.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4083]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@basic-write-read-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4077]) +10 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@gem_mmap_gtt@basic-write-read-distinct.html

  * igt@gem_mmap_gtt@hang:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4077]) +11 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@gem_mmap_gtt@hang.html

  * igt@gem_mmap_offset@close-race:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][67] ([i915#12964]) +8 other tests dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@gem_mmap_offset@close-race.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4083]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-7/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_mmap_wc@write-read:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4083]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-7/igt@gem_mmap_wc@write-read.html
    - shard-dg2-9:        NOTRUN -> [SKIP][70] ([i915#4083]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3282]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3282]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3282]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][74] ([i915#2658])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][75] ([i915#2658])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk4/igt@gem_pread@exhaustion.html

  * igt@gem_pread@uncached:
    - shard-dg2-9:        NOTRUN -> [SKIP][76] ([i915#3282]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_pread@uncached.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#4270])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#13398])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-6/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-dg2-9:        NOTRUN -> [SKIP][79] ([i915#4270])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          NOTRUN -> [TIMEOUT][80] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4270]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#3282]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#5190] / [i915#8428]) +6 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-6/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][84] ([i915#5190] / [i915#8428]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#8428]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4079])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-13/igt@gem_tiled_pread_pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4079])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@gem_tiled_pread_pwrite.html
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#4079]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-tglu-1:       NOTRUN -> [FAIL][89] ([i915#12941])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_tiled_wb:
    - shard-dg2-9:        NOTRUN -> [SKIP][90] ([i915#4077]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_tiled_wb.html

  * igt@gem_userptr_blits@access-control:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3297]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@gem_userptr_blits@access-control.html
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#3297]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#3297]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3297])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#2856]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#2527]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#2856]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#2527]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2-9:        NOTRUN -> [SKIP][101] ([i915#2856])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#2527] / [i915#2856]) +5 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-9/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_module_load@load:
    - shard-glk:          ([PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123]) -> ([PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [DMESG-WARN][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140]) ([i915#118])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk2/igt@i915_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk9/igt@i915_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk4/igt@i915_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk3/igt@i915_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk9/igt@i915_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk6/igt@i915_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk7/igt@i915_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk1/igt@i915_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk4/igt@i915_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk6/igt@i915_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk1/igt@i915_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk4/igt@i915_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk7/igt@i915_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk3/igt@i915_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk7/igt@i915_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk2/igt@i915_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk6/igt@i915_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk9/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk1/igt@i915_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk8/igt@i915_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk3/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk1/igt@i915_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk1/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk2/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk2/igt@i915_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk3/igt@i915_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk3/igt@i915_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk4/igt@i915_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk6/igt@i915_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk6/igt@i915_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk7/igt@i915_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk7/igt@i915_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk7/igt@i915_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk7/igt@i915_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk8/igt@i915_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk8/igt@i915_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk9/igt@i915_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk9/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][141] -> [ABORT][142] ([i915#9820])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#6412])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#8399])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#8399])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#11681]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@i915_pm_rps@thresholds-idle-park.html
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#11681])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#7984])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@i915_power@sanity.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#6188])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_selftest@live:
    - shard-rkl:          [PASS][150] -> [DMESG-FAIL][151] ([i915#12964] / [i915#13550])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-rkl-8/igt@i915_selftest@live.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [PASS][152] -> [DMESG-FAIL][153] ([i915#13550])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-rkl-8/igt@i915_selftest@live@gt_pm.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][154] -> [DMESG-FAIL][155] ([i915#12061]) +1 other test dmesg-fail
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-mtlp-5/igt@i915_selftest@live@workarounds.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-snb:          [PASS][156] -> [ABORT][157] ([i915#11703])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-snb1/igt@i915_suspend@basic-s3-without-i915.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][158] ([i915#4817])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#4212])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-7/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2-9:        NOTRUN -> [SKIP][160] ([i915#4212])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#12454] / [i915#12712])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#8709]) +7 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#9531])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         [PASS][164] -> [FAIL][165] ([i915#11808] / [i915#5956]) +1 other test fail
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#1769] / [i915#3555])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#1769] / [i915#3555]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][168] ([i915#1769])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][169] ([i915#1769])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-dg1:          [PASS][170] -> [DMESG-WARN][171] ([i915#4423]) +3 other tests dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-dg1-15/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#5286]) +6 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#5286]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#4538] / [i915#5286]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#5286]) +7 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][176] -> [FAIL][177] ([i915#5138])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#3638]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][179] +13 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-3/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2-9:        NOTRUN -> [SKIP][180] +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#4538] / [i915#5190]) +7 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#3638]) +4 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-dg2-9:        NOTRUN -> [SKIP][183] ([i915#4538] / [i915#5190]) +3 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#6187])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#4538]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][186] ([i915#10307] / [i915#6095]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#10307] / [i915#6095]) +186 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#6095]) +69 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#12313])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#12313]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][191] ([i915#6095]) +34 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#12805])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#6095]) +29 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][194] ([i915#12805])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#6095]) +15 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#6095]) +90 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#6095]) +142 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][198] ([i915#12313]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#4423] / [i915#6095])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-18/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#7213] / [i915#9010])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#4087]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#11151] / [i915#7828]) +12 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#11151] / [i915#7828]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-13/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#11151] / [i915#7828]) +8 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg2-9:        NOTRUN -> [SKIP][206] ([i915#11151] / [i915#7828])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#11151] / [i915#7828]) +7 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#11151] / [i915#7828]) +8 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#11151] / [i915#7828]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [PASS][210] -> [SKIP][211] ([i915#3555])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-dg2-11/igt@kms_color@deep-color.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-8/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#7118] / [i915#9424])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#3116] / [i915#3299])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#3299])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#3116] / [i915#3299]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#6944] / [i915#9424])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-9:        NOTRUN -> [SKIP][217] ([i915#9424])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#6944] / [i915#9424])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-tglu-1:       NOTRUN -> [SKIP][219] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#13049]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#13049])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          [PASS][222] -> [DMESG-WARN][223] ([i915#12964]) +17 other tests dmesg-warn
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#13049]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#13049])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][226] ([i915#13566]) +1 other test fail
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][227] -> [FAIL][228] ([i915#13566]) +4 other tests fail
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-rkl-1/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2-9:        NOTRUN -> [SKIP][229] ([i915#3555])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-snb:          NOTRUN -> [SKIP][230] +30 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-snb7/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#13049])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#8814]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#3555]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         [PASS][234] -> [FAIL][235] ([i915#13566]) +5 other tests fail
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][236] ([i915#13566]) +4 other tests fail
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#3555] / [i915#8814])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#9809]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#4103]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][240] +23 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#13046] / [i915#5354]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-9:        NOTRUN -> [SKIP][242] ([i915#13046] / [i915#5354])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#4103])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#4103] / [i915#4213])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#9723])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#1257])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-6/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#8812])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#8812])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#3840])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#3840])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#3555] / [i915#3840]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#3555] / [i915#3840])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#3555] / [i915#3840])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#3555] / [i915#3840]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#3555] / [i915#3840]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#1839])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#1839]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#9337])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#658])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#658])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#9934]) +4 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#3637]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][263] ([i915#12314] / [i915#12745] / [i915#4839])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][264] ([i915#4839])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#3637]) +4 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#9934]) +7 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#9934]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#3637]) +6 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-9:        NOTRUN -> [SKIP][269] ([i915#9934])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@dpms-off-confusion:
    - shard-glk:          [PASS][270] -> [DMESG-WARN][271] ([i915#118]) +1 other test dmesg-warn
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk7/igt@kms_flip@dpms-off-confusion.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk8/igt@kms_flip@dpms-off-confusion.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-mtlp:         [PASS][272] -> [FAIL][273] ([i915#11989]) +1 other test fail
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-mtlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#8381])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-18/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2-9:        NOTRUN -> [SKIP][275] ([i915#8381])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][276] ([i915#12745] / [i915#4839])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][277] ([i915#12745])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - shard-dg2:          [PASS][278] -> [FAIL][279] ([i915#11989]) +2 other tests fail
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-dg2-3/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:
    - shard-tglu:         [PASS][280] -> [FAIL][281] ([i915#11989]) +2 other tests fail
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-tglu-2/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#2672] / [i915#3555])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][283] ([i915#2587] / [i915#2672]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#2587] / [i915#2672]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#2587] / [i915#2672]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#2672]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#2587] / [i915#2672] / [i915#3555])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#2587] / [i915#2672] / [i915#3555])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][291] ([i915#2587] / [i915#2672] / [i915#3555])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#2672]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#2672] / [i915#3555]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#2672] / [i915#3555]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#2672] / [i915#8813]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][296] ([i915#2672] / [i915#3555]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][297] ([i915#2672] / [i915#3555] / [i915#5190])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][298] ([i915#2672])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2:          [PASS][299] -> [FAIL][300] ([i915#6880]) +1 other test fail
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#8708]) +14 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][302] +63 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-snb:          [PASS][303] -> [SKIP][304] +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][305] +23 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-9:        NOTRUN -> [SKIP][306] ([i915#5354]) +6 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-dg2:          NOTRUN -> [FAIL][307] ([i915#6880])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#10055])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#8708]) +4 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#3023]) +26 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][311] ([i915#1825]) +23 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][312] +81 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#9766])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#3458]) +7 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#3458]) +14 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][316] ([i915#3458]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][317] ([i915#8708]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#5354]) +20 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#8708]) +3 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#1825]) +41 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#3555] / [i915#8228]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#3555] / [i915#8228]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#3555] / [i915#8228]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-9:        NOTRUN -> [SKIP][324] ([i915#3555] / [i915#8228])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#3555] / [i915#8228])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [PASS][326] -> [SKIP][327] ([i915#3555] / [i915#8228]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-dg2-10/igt@kms_hdr@static-toggle.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-5/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#10656])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_joiner@basic-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#10656])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-13/igt@kms_joiner@basic-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#10656]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-10/igt@kms_joiner@basic-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#10656]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-3/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#10656])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][333] ([i915#12388])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-9:        NOTRUN -> [SKIP][334] ([i915#10656])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#12388])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][336] ([i915#12388])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#12394])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#12339])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#13522])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#4816])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][341] +7 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [PASS][342] -> [DMESG-FAIL][343] ([i915#12964]) +1 other test dmesg-fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][344] ([i915#10647] / [i915#12169])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][345] ([i915#10647]) +1 other test fail
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][346] ([i915#3555] / [i915#8806])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#3555]) +6 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#6953])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#12247] / [i915#9423])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-9:        NOTRUN -> [SKIP][350] ([i915#12247] / [i915#9423])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2-9:        NOTRUN -> [SKIP][351] ([i915#12247]) +3 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-tglu-1:       NOTRUN -> [SKIP][352] ([i915#12247]) +8 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#12247]) +22 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#12247] / [i915#6953] / [i915#9423]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#12247] / [i915#6953])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#12247] / [i915#6953])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#12247] / [i915#6953])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][358] ([i915#12247] / [i915#6953])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][359] ([i915#12247]) +5 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#12247]) +8 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#12247]) +12 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#12247] / [i915#3555])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#12247]) +11 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][364] ([i915#12343])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][365] ([i915#9812])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#3828])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#5978])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#9340])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][369] ([i915#9519])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-mtlp:         NOTRUN -> [SKIP][370] ([i915#9519]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][371] -> [SKIP][372] ([i915#9519])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#9519]) +3 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@pm-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#4077]) +5 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-17/igt@kms_pm_rpm@pm-tiling.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#6524] / [i915#6805])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg2-9:        NOTRUN -> [SKIP][376] ([i915#6524] / [i915#6805])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][377] ([i915#11520]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-snb4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][378] ([i915#11520]) +4 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][379] ([i915#11520]) +12 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk9/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#11520]) +8 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][381] ([i915#11520]) +3 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][382] ([i915#9808])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][383] ([i915#12316]) +3 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][384] ([i915#11520]) +8 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-9:        NOTRUN -> [SKIP][385] ([i915#11520]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#11520]) +6 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][387] ([i915#9683]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu-1:       NOTRUN -> [SKIP][388] ([i915#9683])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-mtlp:         NOTRUN -> [SKIP][389] ([i915#4348])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#1072] / [i915#9732]) +13 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-9:        NOTRUN -> [SKIP][391] ([i915#1072] / [i915#9732]) +2 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-mtlp:         NOTRUN -> [SKIP][392] ([i915#9688]) +10 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][393] ([i915#9732]) +13 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][394] ([i915#1072] / [i915#9732]) +24 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-1/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-primary-render:
    - shard-tglu:         NOTRUN -> [SKIP][395] ([i915#9732]) +18 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-3/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#1072] / [i915#9732]) +8 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-17/igt@kms_psr@psr2-sprite-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][397] ([i915#4077] / [i915#9688]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][398] +364 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk3/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#9685])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu-1:       NOTRUN -> [SKIP][400] ([i915#9685]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2-9:        NOTRUN -> [SKIP][401] ([i915#4235])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg1:          NOTRUN -> [SKIP][402] ([i915#5289])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-9:        NOTRUN -> [SKIP][403] ([i915#12755] / [i915#5190])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-mtlp:         NOTRUN -> [SKIP][404] ([i915#12755])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][405] ([i915#3555]) +3 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][406] ([i915#13179]) +1 other test abort
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_selftest@drm_framebuffer.html
    - shard-snb:          NOTRUN -> [ABORT][407] ([i915#13179]) +1 other test abort
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-snb4/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][408] ([i915#13179]) +1 other test abort
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk7/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [PASS][409] -> [FAIL][410] ([i915#5465]) +2 other tests fail
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-tglu-6/igt@kms_setmode@basic.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][411] ([i915#3555]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-dg1:          NOTRUN -> [SKIP][412] ([i915#3555]) +3 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][413] ([i915#3555] / [i915#8809])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][414] ([i915#3555] / [i915#8809] / [i915#8823])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg1:          NOTRUN -> [FAIL][415] ([IGT#160] / [i915#6493])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][416] ([i915#10959])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk7/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][417] ([i915#8623]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][418] ([i915#8623])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][419] ([i915#8623])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-tglu:         NOTRUN -> [SKIP][420] ([i915#8623])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-mtlp:         NOTRUN -> [SKIP][421] ([i915#8623])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][422] ([i915#12276]) +1 other test incomplete
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk3/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][423] ([i915#9906])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-dg2-9:        NOTRUN -> [SKIP][424] ([i915#11920])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          NOTRUN -> [SKIP][425] ([i915#9906])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         NOTRUN -> [FAIL][426] ([i915#10393]) +1 other test fail
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg1:          NOTRUN -> [SKIP][427] ([i915#9906])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-tglu:         NOTRUN -> [SKIP][428] ([i915#9906])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][429] ([i915#2437]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config:
    - shard-dg2-9:        NOTRUN -> [SKIP][430] ([i915#7387])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@perf@global-sseu-config.html

  * igt@perf@mi-rpc:
    - shard-mtlp:         NOTRUN -> [SKIP][431] ([i915#2434])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-4/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][432] ([i915#2435])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2-9:        NOTRUN -> [FAIL][433] ([i915#12549] / [i915#6806]) +1 other test fail
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@perf_pmu@frequency@gt0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][434] ([i915#3291] / [i915#3708]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@p

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/index.html

--===============1759267575749500788==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/4] lib/xe: Fix=
 a comment error</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144765/">https://patchwork.freedesktop.org/series/144765/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_12585/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12585/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_16125_full -&gt; IGTPW_12585_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12585_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_12585_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/index=
.html</p>
<h2>Participating hosts (10 -&gt; 11)</h2>
<p>Additional (1): shard-snb-0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1258=
5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_render_copy@linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@gem_render_copy@linear.html">DMES=
G-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk8/igt@gem_tiled_swapping@non-threaded.ht=
ml">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk1/igt@gem_workarounds@suspend-resume.htm=
l">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-snb6/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-snb5/igt@i91=
5_pm_rps@reset.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_16125_full and IGTPW_12585=
_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-hdmi-a-1:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.43] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12585_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@drm_fdinfo@busy-hang@bcs0.html">S=
KIP</a> ([i915#8414]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@drm_fdinfo@virtual-busy-idle.htm=
l">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@gem_ccs@block-multicopy-compresse=
d.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html=
">SKIP</a> ([i915#13008])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-dg2-11/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-3=
/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> ([i915#13356]) +1 other te=
st incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-9/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> ([i915#7697])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_create@create-ext-cpu-access=
-big.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-han=
g.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> ([i915#280])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-5/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html">S=
KIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_eio@hibernate.html">ABORT</a>=
 ([i915#7975])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-mtlp-1/igt@gem_eio@in-flight-contexts-immediate.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_125=
85/shard-mtlp-7/igt@gem_eio@in-flight-contexts-immediate.html">ABORT</a> ([=
i915#13193]) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@gem_eio@kms.html">DMESG-FAIL</a>=
 ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-dg1-19/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg1-12/=
igt@gem_eio@reset-stress.html">FAIL</a> ([i915#12543] / [i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_exec_balancer@bonded-sync.htm=
l">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@gem_exec_balancer@parallel-conte=
xts.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@gem_exec_balancer@parallel-out-fe=
nce.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@gem_exec_balancer@sliced.html">SK=
IP</a> ([i915#4812]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-5/igt@gem_exec_balancer@sliced.html">S=
KIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_exec_capture@capture-invisibl=
e.html">SKIP</a> ([i915#6334]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-10/igt@gem_exec_capture@capture-recove=
rable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@ccs0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-dg2-4/igt@gem_exec_endless@dispatch@ccs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shar=
d-dg2-5/igt@gem_exec_endless@dispatch@ccs0.html">TIMEOUT</a> ([i915#3778] /=
 [i915#7016]) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-17/igt@gem_exec_fence@submit.html">SKIP=
</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_exec_flush@basic-uc-pro-defau=
lt.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-8/igt@gem_exec_flush@basic-uc-ro-defaul=
t.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@gem_exec_flush@basic-uc-ro-defau=
lt.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@gem_exec_reloc@basic-cpu-wc-nore=
loc.html">SKIP</a> ([i915#3281]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-1/igt@gem_exec_reloc@basic-scanout.html=
">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-active:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_exec_reloc@basic-wc-gtt-activ=
e.html">SKIP</a> ([i915#3281])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@gem_exec_reloc@basic-write-gtt-a=
ctive.html">SKIP</a> ([i915#3281]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@gem_exec_reloc@basic-write-read-a=
ctive.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@gem_exec_schedule@preempt-queue.h=
tml">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_exec_schedule@preempt-queue-c=
ontexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@gem_exec_schedule@semaphore-powe=
r.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk8/igt@gem_exec_suspend@basic-s3@smem.htm=
l">INCOMPLETE</a> ([i915#13196]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify=
-x.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-f=
ences-busy.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@gem_fenced_exec_thrash@no-spare-=
fences-busy-interruptible.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_huc_copy@huc-copy.html">SKIP=
</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@gem_lmem_swapping@heavy-verify-r=
andom.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi=
.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-5/igt@gem_lmem_swapping@parallel-multi=
.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-7/igt@gem_lmem_swapping@parallel-random=
-verify-ccs.html">SKIP</a> ([i915#4613]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk8/igt@gem_lmem_swapping@random-engines.h=
tml">SKIP</a> ([i915#4613]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@gem_media_fill@media-fill.html">=
SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-6/igt@gem_media_vme.html">SKIP</a> ([i9=
15#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@gem_mmap@bad-offset.html">SKIP</=
a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-read-distinct:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@gem_mmap_gtt@basic-write-read-di=
stinct.html">SKIP</a> ([i915#4077]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@gem_mmap_gtt@hang.html">SKIP</a> =
([i915#4077]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@close-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@gem_mmap_offset@close-race.html">=
DMESG-WARN</a> ([i915#12964]) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@invalid-flags:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-7/igt@gem_mmap_wc@invalid-flags.html">S=
KIP</a> ([i915#4083]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-7/igt@gem_mmap_wc@write-read.html">SKI=
P</a> ([i915#4083]) +4 other tests skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_mmap_wc@write-read.html">SKIP=
</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-6/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-display.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-uncached.html">SKIP</a> ([i915#3282]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@gem_pread@exhaustion.html">SKIP<=
/a> ([i915#3282]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@gem_pread@exhaustion.html">WARN<=
/a> ([i915#2658])</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk4/igt@gem_pread@exhaustion.html">WARN</a=
> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_pread@uncached.html">SKIP</a>=
 ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@gem_pxp@create-regular-buffer.htm=
l">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-6/igt@gem_pxp@hw-rejects-pxp-context.h=
tml">SKIP</a> ([i915#13398])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_pxp@reject-modify-context-pro=
tection-off-1.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@gem_pxp@verify-pxp-execution-afte=
r-suspend-resume.html">TIMEOUT</a> ([i915#12917] / [i915#12964]) +2 other t=
ests timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@gem_pxp@verify-pxp-stale-ctx-exe=
cution.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@gem_readwrite@write-bad-handle.h=
tml">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-6/igt@gem_render_copy@linear-to-vebox-y=
f-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_render_copy@y-tiled-mc-ccs-to=
-yf-tiled-ccs.html">SKIP</a> ([i915#5190] / [i915#8428]) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@gem_render_copy@y-tiled-to-vebox=
-x-tiled.html">SKIP</a> ([i915#8428]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-13/igt@gem_tiled_pread_pwrite.html">SKI=
P</a> ([i915#4079])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@gem_tiled_pread_pwrite.html">SKI=
P</a> ([i915#4079])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@gem_tiled_pread_pwrite.html">SKIP=
</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_tiled_swapping@non-threaded.=
html">FAIL</a> ([i915#12941])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_wb:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gem_tiled_wb.html">SKIP</a> ([i91=
5#4077]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@gem_userptr_blits@access-control.=
html">SKIP</a> ([i915#3297]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gem_userptr_blits@access-control=
.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@gem_userptr_blits@invalid-mmap-o=
ffset-unsync.html">SKIP</a> ([i915#3297]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-af=
ter-close.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-a=
fter-close.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@gen9_exec_parse@allowed-all.html=
">SKIP</a> ([i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@gen9_exec_parse@allowed-single.h=
tml">SKIP</a> ([i915#2527]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@gen9_exec_parse@basic-rejected-ct=
x-param.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html">=
SKIP</a> ([i915#2527]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@gen9_exec_parse@bb-start-out.htm=
l">SKIP</a> ([i915#2527] / [i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@gen9_exec_parse@bb-start-param.ht=
ml">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-9/igt@gen9_exec_parse@cmd-crossing-pag=
e.html">SKIP</a> ([i915#2527] / [i915#2856]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_16125/shard-glk2/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk9/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_16125/shard-glk4/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-=
glk3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk9/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
6125/shard-glk6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk7/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_16125/shard-glk1/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk4/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_16125/shard-glk6/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard=
-glk1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk4/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
16125/shard-glk7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk3/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_16125/shard-glk7/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk2/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_16125/shard-glk6/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shar=
d-glk9/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk1/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_16125/shard-glk8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16125/shard-glk3/igt@i915_modul=
e_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_12585/shard-glk1/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk=
1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_12585/shard-glk2/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/=
shard-glk2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk3/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_12585/shard-glk3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk4/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12585/shard-glk6/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk6/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_12585/shard-glk7/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-=
glk7/igt@i915_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk7/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_12585/shard-glk7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk8/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12585/shard-glk8/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-glk9/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_12585/shard-glk9/igt@i915_module_load@load.html">PASS<=
/a>) ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-snb4/igt@i915_module_load@reload-with-fault-injection.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_12585/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html">=
ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@i915_module_load@resize-bar.html=
">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@i915_pm_freq_api@freq-reset-mult=
iple.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.htm=
l">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@i915_pm_rps@thresholds-idle-park=
.html">SKIP</a> ([i915#11681]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@i915_pm_rps@thresholds-idle-park=
.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@i915_power@sanity.html">SKIP</a> =
([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@i915_query@query-topology-coheren=
t-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-rkl-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@=
i915_selftest@live.html">DMESG-FAIL</a> ([i915#12964] / [i915#13550])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-rkl-8/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-rkl-=
2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i915#13550])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-mtlp-5/igt@i915_selftest@live@workarounds.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/sha=
rd-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> ([i915#12=
061]) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-snb1/igt@i915_suspend@basic-s3-without-i915.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/s=
hard-snb4/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> ([i915#117=
03])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk7/igt@i915_suspend@debugfs-reader.html">=
INCOMPLETE</a> ([i915#4817])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-7/igt@kms_addfb_basic@basic-x-tiled-le=
gacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_addfb_basic@framebuffer-vs-se=
t-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html">SKIP</a> ([i915#12454] / [i915#12712])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-dp-4-=
4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_async_flips@async-flip-with-=
page-flip-events-atomic@pipe-a-dp-4-4-mc-ccs.html">SKIP</a> ([i915#8709]) +=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-tran=
sition-fencing-internal-panels.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-mtlp-4/igt@kms_atomic_transi=
tion@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> ([=
i915#11808] / [i915#5956]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_atomic_transition@plane-all-m=
odeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]=
)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555=
]) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-snb1/igt@kms_atomic_transition@plane-all-mo=
deset-transition-internal-panels.html">SKIP</a> ([i915#1769])</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk8/igt@kms_atomic_transition@plane-all-mo=
deset-transition-internal-panels.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-dg1-15/igt@kms_atomic_transition@plane-use-after-nonblo=
cking-unbind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_12585/shard-dg1-14/igt@kms_atomic_transition@plane-use-aft=
er-nonblocking-unbind.html">DMESG-WARN</a> ([i915#4423]) +3 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-0=
.html">SKIP</a> ([i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-1=
80.html">SKIP</a> ([i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-9=
0.html">SKIP</a> ([i915#4538] / [i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-6/igt@kms_big_fb@4-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> ([i915#5286]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-0-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_12585/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp=
-rotate-0-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@kms_big_fb@linear-32bpp-rotate-9=
0.html">SKIP</a> ([i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-3/igt@kms_big_fb@linear-64bpp-rotate-2=
70.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_big_fb@linear-8bpp-rotate-90.=
html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_big_fb@y-tiled-32bpp-rotate-=
270.html">SKIP</a> ([i915#4538] / [i915#5190]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_big_fb@y-tiled-8bpp-rotate-27=
0.html">SKIP</a> ([i915#3638]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-1=
80.html">SKIP</a> ([i915#4538] / [i915#5190]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#4538]) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_ccs@bad-aux-stride-y-tiled-ge=
n12-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> ([i915#10307] / [i915#6095]) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_ccs@bad-pixel-format-y-tiled=
-ccs@pipe-c-dp-3.html">SKIP</a> ([i915#10307] / [i915#6095]) +186 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-4/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +69 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-6/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:=
</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#6095]) +34 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-9/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">SKIP</a> ([i915#12805])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +29 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-til=
ed-lnl-ccs.html">SKIP</a> ([i915#12805])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-y-ti=
led-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> ([i915#6095]) +15 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs.html">SKIP</a> ([i915#6095]) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#6095]) +142 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_ccs@random-ccs-data-4-tiled-l=
nl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-18/igt@kms_ccs@random-ccs-data-y-tiled-=
gen12-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#4423] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-=
ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#609=
5]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-4/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> ([i915#7213] / [i915#9010])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hd=
mi-a-1.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-chan=
ge-during-suspend.html">SKIP</a> ([i915#11151] / [i915#7828]) +12 other tes=
ts skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-13/igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-suspend.html">SKIP</a> ([i915#11151] / [i915#7828]) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast=
.html">SKIP</a> ([i915#11151] / [i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_chamelium_frames@dp-crc-singl=
e.html">SKIP</a> ([i915#11151] / [i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd.html">S=
KIP</a> ([i915#11151] / [i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_chamelium_hpd@dp-hpd-fast.ht=
ml">SKIP</a> ([i915#11151] / [i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-5/igt@kms_chamelium_hpd@hdmi-hpd-with-=
enabled-mode.html">SKIP</a> ([i915#11151] / [i915#7828]) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-dg2-11/igt@kms_color@deep-color.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-8/i=
gt@kms_color@deep-color.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@kms_content_protection@atomic.htm=
l">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-6/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> ([i915#3116] / [i915#3299]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_content_protection@lic-type-0=
.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-4/igt@kms_content_protection@lic-type-=
1.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_content_protection@type1.htm=
l">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> ([i915#13049]) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x256.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
585/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x256.html">DMESG-WARN=
</a> ([i915#12964]) +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-51=
2x170.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-6=
4x21@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#13566]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-rkl-1/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hd=
mi-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_12585/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a=
-hdmi-a-2.html">FAIL</a> ([i915#13566]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_cursor_crc@cursor-random-32x3=
2.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-snb7/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-256x85.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-move=
ment-64x21.html">SKIP</a> ([i915#8814]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_cursor_crc@cursor-rapid-move=
ment-max-size.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_125=
85/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> ([i=
915#13566]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128=
x42@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#13566]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-ma=
x-size.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_cursor_legacy@2x-cursor-vs-f=
lip-legacy.html">SKIP</a> ([i915#9809]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-legacy.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_cursor_legacy@cursora-vs-flip=
b-atomic-transitions-varying-size.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flip=
a-atomic-transitions-varying-size.html">SKIP</a> ([i915#13046] / [i915#5354=
]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flip=
a-varying-size.html">SKIP</a> ([i915#13046] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] =
/ [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-6/igt@kms_dp_aux_dev.html">SKIP</a> ([i=
915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-wc=
.html">SKIP</a> ([i915#8812])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-wc=
.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp-with-b=
pc.html">SKIP</a> ([i915#3840])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-b=
pc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_dsc@dsc-with-bpc.html">SKIP<=
/a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> ([i915#3555] / [i915#3840])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats.h=
tml">SKIP</a> ([i915#3555] / [i915#3840])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.h=
tml">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> ([i915#3555] / [i915#3840]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_feature_discovery@display-2x=
.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-3/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> ([i915#1839]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_feature_discovery@psr2.html">=
SKIP</a> ([i915#658])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_feature_discovery@psr2.html">=
SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_flip@2x-flip-vs-blocking-wf-=
vblank.html">SKIP</a> ([i915#9934]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences-inter=
ruptible.html">SKIP</a> ([i915#3637]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interr=
uptible.html">INCOMPLETE</a> ([i915#12314] / [i915#12745] / [i915#4839])</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interr=
uptible@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> ([i915#4839])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-7/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce-interruptible.html">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_flip@2x-plain-flip-interrupti=
ble.html">SKIP</a> ([i915#9934]) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> ([i915#9934]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@kms_flip@2x-plain-flip-ts-check-=
interruptible.html">SKIP</a> ([i915#3637]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs=
-dpms-off-vs-modeset-interruptible.html">SKIP</a> ([i915#9934])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-glk7/igt@kms_flip@dpms-off-confusion.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-gl=
k8/igt@kms_flip@dpms-off-confusion.html">DMESG-WARN</a> ([i915#118]) +1 oth=
er test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-mtlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interrup=
tible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_12585/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interr=
uptible.html">FAIL</a> ([i915#11989]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-18/igt@kms_flip@flip-vs-fences.html">SK=
IP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_flip@flip-vs-fences-interrupt=
ible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk2/igt@kms_flip@flip-vs-suspend-interrupt=
ible.html">INCOMPLETE</a> ([i915#12745] / [i915#4839])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk2/igt@kms_flip@flip-vs-suspend-interrupt=
ible@a-hdmi-a1.html">INCOMPLETE</a> ([i915#12745])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-dg2-3/igt@kms_flip@plain-flip-ts-check-interruptible@a-=
hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12585/shard-dg2-5/igt@kms_flip@plain-flip-ts-check-interruptibl=
e@a-hdmi-a3.html">FAIL</a> ([i915#11989]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-tglu-2/igt@kms_flip@plain-flip-ts-check-interruptible@b=
-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_12585/shard-tglu-7/igt@kms_flip@plain-flip-ts-check-interrupti=
ble@b-hdmi-a1.html">FAIL</a> ([i915#11989]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#35=
55])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i91=
5#2587] / [i915#2672]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i91=
5#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2=
587] / [i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915=
#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555=
] / [i915#8813]) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]=
 / [i915#5190]) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672=
] / [i915#3555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672=
] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] =
/ [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#267=
2]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#35=
55]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2=
672] / [i915#8813]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i=
915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672])=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr=
-indfb-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_12585/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-prims=
crn-spr-indfb-move.html">FAIL</a> ([i915#6880]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +14 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-i=
ndfb-fullscreen.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-spr-indfb-fullscreen.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-render.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-spr-indfb-fullscreen.html">SKIP</a> ([i915#5354]) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb=
565-draw-blt.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-til=
ing-y.html">SKIP</a> ([i915#10055])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#3023]) +26 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-cur-indfb-onoff.html">SKIP</a> ([i915#1825]) +23 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-shrfb-msflip-blt.html">SKIP</a> +81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-=
offscren-pri-shrfb-draw-blt.html">SKIP</a> ([i915#3458]) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscren-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +14 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-indfb-pgflip-blt.html">SKIP</a> ([i915#3458]) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +20 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-shrfb-plflip-blt.html">SKIP</a> ([i915#1825]) +41 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_hdr@bpc-switch-dpms.html">SKI=
P</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_hdr@bpc-switch-dpms.html">SK=
IP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-6/igt@kms_hdr@bpc-switch-dpms.html">SK=
IP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-dg2-10/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-dg2-5/=
igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_joiner@basic-big-joiner.html"=
>SKIP</a> ([i915#10656])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-13/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> ([i915#10656])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-10/igt@kms_joiner@basic-big-joiner.htm=
l">SKIP</a> ([i915#10656]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-3/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> ([i915#10656]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_joiner@basic-big-joiner.html"=
>SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_joiner@invalid-modeset-big-jo=
iner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-7/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html">SKIP</a> ([i915#12388])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-=
ultra-joiner.html">SKIP</a> ([i915#12394])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-5/igt@kms_joiner@invalid-modeset-ultra-=
joiner.html">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> ([i915#13522])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-1/igt@kms_pipe_b_c_ivb@disable-pipe-b-e=
nable-pipe-c.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-rkl-2/igt@kms_plane@plane-panning-bottom-right-suspend@=
pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_12585/shard-rkl-7/igt@kms_plane@plane-panning-bottom-right-suspe=
nd@pipe-a.html">DMESG-FAIL</a> ([i915#12964]) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque=
-fb.html">FAIL</a> ([i915#10647] / [i915#12169])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque=
-fb@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#10647]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@kms_plane_multiple@tiling-y.html=
">SKIP</a> ([i915#3555] / [i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-s=
ize.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_plane_scaling@plane-downscale=
-factor-0-25-with-modifiers.html">SKIP</a> ([i915#12247] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_plane_scaling@plane-downscale=
-factor-0-25-with-pixel-format.html">SKIP</a> ([i915#12247] / [i915#9423])<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-d:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_plane_scaling@plane-downscale=
-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> ([i915#12247]) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-rotation@pipe-b.html">SKIP</a> ([i915#12247]) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-2=
0x20-with-rotation@pipe-a.html">SKIP</a> ([i915#12247]) +22 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#695=
3] / [i915#9423]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953=
])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#695=
3])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#695=
3])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#695=
3])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> ([i915#12247]) +8 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247]) +12=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-9/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-=
factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247]) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> ([i915#12343])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-3/igt@kms_pm_dc@dc5-retention-flops.htm=
l">SKIP</a> ([i915#3828])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-2/igt@kms_pm_dc@dc6-dpms.html">SKIP</a>=
 ([i915#5978])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> ([i915#9340])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shar=
d-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> ([i915#9519]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-17/igt@kms_pm_rpm@pm-tiling.html">SKIP<=
/a> ([i915#4077]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_prime@basic-modeset-hybrid.h=
tml">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_prime@d3hot.html">SKIP</a> ([=
i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-snb4/igt@kms_psr2_sf@fbc-pr-overlay-plane-m=
ove-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-continuous-sf.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk9/igt@kms_psr2_sf@fbc-pr-plane-move-sf-d=
mg-area.html">SKIP</a> ([i915#11520]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-prim=
ary-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> ([i915#11520]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area@pipe-a-edp-1.html">SKIP</a> ([i915#9808])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area@pipe-b-edp-1.html">SKIP</a> ([i915#12316]) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-7/igt@kms_psr2_sf@pr-cursor-plane-move=
-continuous-sf.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_psr2_sf@psr2-overlay-plane-mo=
ve-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_psr2_sf@psr2-primary-plane-u=
pdate-sf-dmg-area.html">SKIP</a> ([i915#11520]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.=
html">SKIP</a> ([i915#9683]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-4/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> ([i915#4348])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-10/igt@kms_psr@fbc-psr-primary-mmap-gtt=
.html">SKIP</a> ([i915#1072] / [i915#9732]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_psr@fbc-psr-sprite-plane-onof=
f.html">SKIP</a> ([i915#1072] / [i915#9732]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_psr@fbc-psr2-no-drrs.html">S=
KIP</a> ([i915#9688]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html=
">SKIP</a> ([i915#9732]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-1/igt@kms_psr@psr2-cursor-mmap-gtt.html=
">SKIP</a> ([i915#1072] / [i915#9732]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-3/igt@kms_psr@psr2-primary-render.html=
">SKIP</a> ([i915#9732]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-17/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> ([i915#1072] / [i915#9732]) +8 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-2/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> ([i915#4077] / [i915#9688]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk3/igt@kms_psr@psr2-sprite-plane-onoff.ht=
ml">SKIP</a> +364 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-7/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> ([i915#9685])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_rotation_crc@exhaust-fences.h=
tml">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-90.html">SKIP</a> ([i915#12755] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation=
-90-pos-100-0.html">SKIP</a> ([i915#12755])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_selftest@drm_framebuffer.html=
">ABORT</a> ([i915#13179]) +1 other test abort</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-snb4/igt@kms_selftest@drm_framebuffer.html"=
>ABORT</a> ([i915#13179]) +1 other test abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk7/igt@kms_selftest@drm_framebuffer.html"=
>ABORT</a> ([i915#13179]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_16125/shard-tglu-6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12585/shard-tglu-2/igt=
@kms_setmode@basic.html">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-19/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-5/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> ([i915#3555] / [i915#8809])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> ([i915#3555] / [i915#8809] / [i915#8823])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@kms_sysfs_edid_timing.html">FAIL=
</a> ([IGT#160] / [i915#6493])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk7/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> ([i915#10959])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-4/igt@kms_tiled_display@basic-test-patt=
ern.html">SKIP</a> ([i915#8623]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-8/igt@kms_tiled_display@basic-test-patt=
ern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-14/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-1/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk3/igt@kms_vblank@ts-continuation-suspend=
.html">INCOMPLETE</a> ([i915#12276]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@kms_vrr@lobf.html">SKIP</a> ([i91=
5#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-11/igt@kms_vrr@max-min.html">SKIP</a> (=
[i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-6/igt@kms_vrr@negative-basic.html">FAI=
L</a> ([i915#10393]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-virtu=
al.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-glk8/igt@kms_writeback@writeback-pixel-form=
ats.html">SKIP</a> ([i915#2437]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@perf@global-sseu-config.html">SKI=
P</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-mtlp-4/igt@perf@mi-rpc.html">SKIP</a> ([i91=
5#2434])</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> ([i915#2435])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-dg2-9/igt@perf_pmu@frequency@gt0.html">FAIL=
</a> ([i915#12549] / [i915#6806]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12585/shard-rkl-4/igt@p">SKIP</a> ([i915#3291] / [i915#=
3708]) +1 other test skip</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1759267575749500788==--
