Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AC8C54E5D
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 01:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0148F10EB46;
	Wed, 13 Mar 2024 01:42:39 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E283010EB46;
 Wed, 13 Mar 2024 01:42:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8440516417017806622=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_Add_GT_IP_version_query_sup?=
 =?utf-8?q?port_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 Mar 2024 01:42:36 -0000
Message-ID: <171029415689.714564.9508851215156579627@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240312205431.2869411-1-matthew.d.roper@intel.com>
In-Reply-To: <20240312205431.2869411-1-matthew.d.roper@intel.com>
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

--===============8440516417017806622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add GT IP version query support (rev3)
URL   : https://patchwork.freedesktop.org/series/127456/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14421_full -> IGTPW_10818_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10818_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10818_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/index.html

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10818_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@banned:
    - shard-dg1:          NOTRUN -> [ABORT][1] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@gem_eio@banned.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - shard-dg2:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a3:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-13/igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a3.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  
#### Warnings ####

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          [FAIL][7] ([i915#10380]) -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-6/igt@api_intel_bb@render-ccs.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@api_intel_bb@render-ccs.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][9] ([i915#9519]) -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  
Known issues
------------

  Here are the changes found in IGTPW_10818_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@drm_fdinfo@busy@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8414]) +21 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@drm_fdinfo@busy@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][13] -> [FAIL][14] ([i915#7742])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#8414]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#3936])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#3936])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [PASS][20] -> [FAIL][21] ([i915#6268])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][22] ([i915#1099])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-snb1/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8555])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8555])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#8555])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#280])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#280])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#4812]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#4771])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4036])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#6344])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@many-4k-incremental:
    - shard-dg2:          NOTRUN -> [FAIL][32] ([i915#9606]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@gem_exec_capture@many-4k-incremental.html
    - shard-tglu:         NOTRUN -> [FAIL][33] ([i915#9606])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-4/igt@gem_exec_capture@many-4k-incremental.html

  * igt@gem_exec_capture@many-4k-zero:
    - shard-dg1:          NOTRUN -> [FAIL][34] ([i915#9606]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@gem_exec_capture@many-4k-zero.html
    - shard-rkl:          NOTRUN -> [FAIL][35] ([i915#9606])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@gem_exec_capture@many-4k-zero.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         [PASS][37] -> [FAIL][38] ([i915#2842]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#2842])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3539]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][42] ([i915#2842])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4812]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-1/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#3281]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-5/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3281]) +10 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#3281]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#3281]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-2/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#4860])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_fence_thrash@bo-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4860])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-8/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4860]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
    - shard-dg2:          [PASS][54] -> [FAIL][55] ([i915#10378])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-5/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#4613]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][57] ([i915#4613]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk1/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4613]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-2/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#4613]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4083]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4077]) +17 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4083]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4083]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3282]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3282]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_pread@display:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#3282])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-5/igt@gem_pread@display.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#3282]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][68] ([i915#2658])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4270]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@gem_pxp@create-protected-buffer.html
    - shard-tglu:         NOTRUN -> [SKIP][70] ([i915#4270])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-7/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4270])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-4/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4270]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@gem_pxp@display-protected-crc.html
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#4270]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-1/igt@gem_pxp@display-protected-crc.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#8428]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#5190]) +10 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4079])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4079])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#8411])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4885])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4079]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiling_max_stride:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#4077]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@access-control:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#3297]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3297]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_userptr_blits@coherency-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#3297])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#3297]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-14/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#3282] / [i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-19/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#3297] / [i915#4958])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_userptr_blits@sd-probe.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#2527]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-14/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#2856]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@gen9_exec_parse@unaligned-access.html
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#2527]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#2527] / [i915#2856]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-4/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#8399])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#6590])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-fence@gt0:
    - shard-tglu:         NOTRUN -> [WARN][94] ([i915#2681])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-fence@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [PASS][95] -> [FAIL][96] ([i915#3591]) +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
    - shard-dg2:          [PASS][97] -> [ABORT][98] ([i915#10367])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-5/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
    - shard-dg1:          [PASS][99] -> [ABORT][100] ([i915#10367])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-18/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-19/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html

  * igt@i915_pm_rps@basic-api:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#6621])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#6621])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#7707])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-7/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4212]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#4215])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4215] / [i915#5190])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#4212])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#8709]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#8709]) +11 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#9531])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#9531])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-9/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#1769] / [i915#3555])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#1769] / [i915#3555])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#1769] / [i915#3555])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#1769] / [i915#3555])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#4538] / [i915#5286]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#5286]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][118] -> [FAIL][119] ([i915#5138])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#5286]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#3638]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-snb:          NOTRUN -> [SKIP][122] +15 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-snb7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#3638]) +6 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-19/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         [PASS][124] -> [FAIL][125] ([i915#3743]) +1 other test fail
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4538] / [i915#5190]) +11 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4538]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#2705])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-4/igt@kms_big_joiner@invalid-modeset.html
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#2705])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#10307]) +139 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#10278])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-19/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#6095]) +15 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#6095]) +71 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#10278])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#6095]) +19 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#6095]) +53 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#3742])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#4087]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#7828]) +10 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_chamelium_audio@hdmi-audio.html
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#7828]) +5 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#7828]) +9 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-mtlp:         NOTRUN -> [SKIP][142] +9 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#7828]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#7828]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-1/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#3299]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#3359])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#3359])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#8814]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#3359])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#4103] / [i915#4213]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#4103])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#5354]) +48 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#9809]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][154] -> [FAIL][155] ([i915#2346])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#4103] / [i915#4213])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#9723])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#9227])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#9723])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#9723]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#9833])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#3555]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-14/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#3555] / [i915#8812])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-3/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#3555] / [i915#3840])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#3555] / [i915#3840])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#3555] / [i915#3840])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-7/igt@kms_dsc@dsc-with-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#3555] / [i915#3840]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#3955])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3469])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#4854])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-1/igt@kms_feature_discovery@chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#4854])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#4854])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#1839])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#658])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-6/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#658])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_feature_discovery@psr1.html
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#658])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_feature_discovery@psr1.html

  * igt@kms_fence_pin_leak:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#4881])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-1/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#3637]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#8381]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#3637]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-10/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#9934])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-14/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][182] ([i915#2122])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#8381])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#2672]) +6 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#2587] / [i915#2672])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#2672]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#2672]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#2672] / [i915#3555])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#2587] / [i915#2672]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][190] -> [FAIL][191] ([i915#6880])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#8708]) +21 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3023]) +17 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#1825]) +13 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#1825]) +34 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#10055]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#10070])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#3458]) +13 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#3458]) +21 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#8708]) +20 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#8708]) +6 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#433])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3555] / [i915#8228])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#3555] / [i915#8228]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#3555] / [i915#8228]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_hdr@static-swap.html
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#3555] / [i915#8228])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-9/igt@kms_hdr@static-swap.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][207] ([i915#7862]) +1 other test fail
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#8806])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#9423]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#5176]) +3 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#9423]) +5 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#9423]) +11 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#5176] / [i915#9423]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#5176] / [i915#9423]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#5235]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#5235]) +7 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#5235] / [i915#9423]) +23 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#5235]) +7 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-19/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#5235] / [i915#9423] / [i915#9728]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-2.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#5354]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#5354])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#9685])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#9685])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][224] -> [SKIP][225] ([i915#9519]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][226] -> [FAIL][227] ([i915#8717])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-6/igt@kms_pm_rpm@i2c.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][228] -> [SKIP][229] ([i915#9519])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#9519])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#4077]) +11 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_prime@d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#6524] / [i915#6805])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][233] +40 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][234] +29 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][235] +39 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#4348])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#9683])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#9683])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#9683])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#9732]) +21 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_psr@fbc-pr-sprite-render.html
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#9732]) +6 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-9/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#9673] / [i915#9732])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][243] +393 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk4/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#9732]) +13 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#9688]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-2/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#9732]) +23 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#4235])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#5289]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#5289]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#3555]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#3555]) +4 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#3555]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg1:          NOTRUN -> [FAIL][253] ([IGT#2] / [i915#6493])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#8623])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#8623])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#8623])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-snb:          [PASS][257] -> [FAIL][258] ([i915#9196])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-snb1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-snb5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-tglu:         [PASS][259] -> [FAIL][260] ([i915#9196])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#9906]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-14/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#2437] / [i915#9412])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-5/igt@kms_writeback@writeback-pixel-formats.html
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#2437] / [i915#9412])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_writeback@writeback-pixel-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#2437] / [i915#9412])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#2436] / [i915#7387])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#2436])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#7387])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@perf@global-sseu-config.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][268] ([i915#9100])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [PASS][269] -> [FAIL][270] ([i915#4349])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-mtlp-1/igt@perf_pmu@busy-double-start@rcs0.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#8516])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#8516])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][273] ([i915#5493])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#3708]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#3291] / [i915#3708])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#3708]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@prime_vgem@fence-read-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#3708])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-5/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglu:         NOTRUN -> [SKIP][278] +43 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-2/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#9917])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#4818])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-13/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#2575]) +3 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-4/igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync.html

  * igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#2575]) +13 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html

  * igt@v3d/v3d_submit_csd@job-perfmon:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#2575]) +16 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@v3d/v3d_submit_csd@job-perfmon.html

  * igt@v3d/v3d_wait_bo@unused-bo-1ns:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#2575]) +9 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-10/igt@v3d/v3d_wait_bo@unused-bo-1ns.html

  * igt@vc4/vc4_label_bo@set-bad-name:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#7711]) +8 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@vc4/vc4_label_bo@set-bad-name.html

  * igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#7711]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-3/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html

  * igt@vc4/vc4_purgeable_bo@mark-purgeable:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#7711]) +5 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@vc4/vc4_purgeable_bo@mark-purgeable.html

  * igt@vc4/vc4_tiling@set-bad-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#7711]) +9 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@vc4/vc4_tiling@set-bad-modifier.html

  
#### Possible fixes ####

  * igt@gem_eio@hibernate:
    - shard-dg1:          [ABORT][289] ([i915#7975] / [i915#8213]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-18/igt@gem_eio@hibernate.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@gem_eio@hibernate.html

  * igt@gem_eio@suspend:
    - shard-dg2:          [INCOMPLETE][291] -> [PASS][292]
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-6/igt@gem_eio@suspend.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@gem_eio@suspend.html

  * igt@gem_exec_endless@dispatch@vcs0:
    - shard-dg1:          [TIMEOUT][293] ([i915#3778]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-17/igt@gem_exec_endless@dispatch@vcs0.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@gem_exec_endless@dispatch@vcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][295] ([i915#2842]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [FAIL][297] ([i915#2842]) -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-dg1:          [DMESG-WARN][299] ([i915#4391] / [i915#4423]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-17/igt@gem_lmem_evict@dontneed-evict-race.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg2:          [FAIL][301] ([i915#10378]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [INCOMPLETE][303] ([i915#5566]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][305] ([i915#9820]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          [FAIL][307] ([i915#3591]) -> [PASS][308]
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [FAIL][309] ([i915#5138]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         [FAIL][311] ([i915#3743]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@torture-bo@pipe-b:
    - shard-glk:          [DMESG-WARN][313] ([i915#10166] / [i915#1982]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-glk7/igt@kms_cursor_legacy@torture-bo@pipe-b.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk8/igt@kms_cursor_legacy@torture-bo@pipe-b.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-rkl:          [FAIL][315] -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-mtlp:         [FAIL][317] ([i915#79]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-mtlp-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-dg1:          [ABORT][319] -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-15/igt@kms_pm_dc@dc9-dpms.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][321] ([i915#9519]) -> [PASS][322] +1 other test pass
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-rkl-1/igt@kms_pm_rpm@dpms-lpsp.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [SKIP][323] ([i915#9519]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-tglu:         [FAIL][325] ([i915#9196]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@syncobj_timeline@single-wait-all-available-signaled:
    - shard-dg1:          [DMESG-WARN][327] ([i915#4423]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-17/igt@syncobj_timeline@single-wait-all-available-signaled.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@syncobj_timeline@single-wait-all-available-signaled.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-tglu:         [WARN][329] ([i915#2681]) -> [FAIL][330] ([i915#3591])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-dg1:          [SKIP][331] ([i915#4423] / [i915#9732]) -> [SKIP][332] ([i915#9732])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-17/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-13/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-pr-primary-mmap-gtt:
    - shard-dg2:          [SKIP][333] ([i915#9732]) -> [SKIP][334] ([i915#9673] / [i915#9732]) +3 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-5/igt@kms_psr@fbc-pr-primary-mmap-gtt.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@kms_psr@fbc-pr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr-primary-mmap-cpu:
    - shard-dg2:          [SKIP][335] ([i915#9673] / [i915#9732]) -> [SKIP][336] ([i915#9732]) +10 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-11/igt@kms_psr@fbc-psr-primary-mmap-cpu.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_psr@fbc-psr-primary-mmap-cpu.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [i915#10055]: https://gitlab.freedesktop.org/drm/intel/issues/10055
  [i915#10070]: https://gitlab.freedesktop.org/drm/intel/issues/10070
  [i915#10166]: https://gitlab.freedesktop.org/drm/intel/issues/10166
  [i915#10278]: https://gitlab.freedesktop.org/drm/intel/issues/10278
  [i915#10307]: https://gitlab.freedesktop.org/drm/intel/issues/10307
  [i915#10367]: https://gitlab.freedesktop.org/drm/intel/issues/10367
  [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
  [i915#10380]: https://gitlab.freedesktop.org/drm/intel/issues/10380
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
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
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/intel/issues/7862
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8717]: https://gitlab.freedesktop.org/drm/intel/issues/8717
  [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
  [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
  [i915#9100]: https://gitlab.freedesktop.org/drm/intel/issues/9100
  [i915#9196]: https://gitlab.freedesktop.org/drm/intel/issues/9196
  [i915#9227]: https://gitlab.freedesktop.org/drm/intel/issues/9227
  [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
  [i915#9412]: https://gitlab.freedesktop.org/drm/intel/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
  [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/intel/issues/9531
  [i915#9606]: https://gitlab.freedesktop.org/drm/intel/issues/9606
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9683]: https://gitlab.freedesktop.org/drm/intel/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/intel/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/intel/issues/9723
  [i915#9728]: https://gitlab.freedesktop.org/drm/intel/issues/9728
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/intel/issues/9809
  [i915#9820]: https://gitlab.freedesktop.org/drm/intel/issues/9820
  [i915#9833]: https://gitlab.freedesktop.org/drm/intel/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/intel/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/intel/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/intel/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7756 -> IGTPW_10818
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_14421: 1dfbf3ced62236dd318c701e3f21f5a33c226d0d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10818: 10818
  IGT_7756: 7756
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/index.html

--===============8440516417017806622==
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
<tr><td><b>Series:</b></td><td>Add GT IP version query support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127456/">https://patchwork.freedesktop.org/series/127456/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14421_full -&gt; IGTPW_10818_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10818_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10818_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10818_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@banned:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@gem_eio@banned.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-13/igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-6/igt@api_intel_bb@render-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10380">i915#10380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@api_intel_bb@render-ccs.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10818_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@drm_fdinfo@busy@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-snb1/igt@gem_ctx_persistence@engines-hostile-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-incremental:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9606">i915#9606</a>) +1 other test fail</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-4/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9606">i915#9606</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-zero:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@gem_exec_capture@many-4k-zero.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9606">i915#9606</a>) +1 other test fail</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@gem_exec_capture@many-4k-zero.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9606">i915#9606</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@gem_exec_fair@basic-deadline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-1/igt@gem_exec_fence@concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-5/igt@gem_exec_reloc@basic-concurrent16.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-2/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-8/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-5/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk1/igt@gem_lmem_swapping@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-2/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@gem_mmap@bad-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@gem_mmap_wc@copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc-unflushed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@gem_partial_pwrite_pread@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-5/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-7/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-4/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-1/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiling_max_stride:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@gem_tiling_max_stride.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-1/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-14/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-19/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-14/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-4/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6590">i915#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence@gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-fence@gt0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-5/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10367">i915#10367</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-18/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-19/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10367">i915#10367</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-7/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9531">i915#9531</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-9/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-snb7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-19/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-4/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10307">i915#10307</a>) +139 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-19/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10278">i915#10278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10278">i915#10278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +10 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@kms_chamelium_color@ctm-max.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-1/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8814">i915#8814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9809">i915#9809</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9227">i915#9227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9723">i915#9723</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9723">i915#9723</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-14/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-3/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-7/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4854">i915#4854</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4854">i915#4854</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-1/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-10/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-14/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_flip@flip-vs-blocking-wf-vblank@d-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +6 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10055">i915#10055</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10070">i915#10070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-9/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8806">i915#8806</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-19/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9423">i915#9423</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9728">i915#9728</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-6/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_pm_rpm@i2c.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8717">i915#8717</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-caching:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_pm_rpm@pm-caching.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4348">i915#4348</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +21 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-9/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk4/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html">SKIP</a> +393 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-2/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9688">i915#9688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6493">i915#6493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8623">i915#8623</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8623">i915#8623</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-snb1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-snb5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-14/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9412">i915#9412</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9412">i915#9412</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2436">i915#2436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7387">i915#7387</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9100">i915#9100</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-mtlp-1/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-5/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-2/igt@prime_vgem@fence-write-hang.html">SKIP</a> +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-13/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-13/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4818">i915#4818</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-4/igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-perfmon:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@job-perfmon:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-5/igt@v3d/v3d_submit_csd@job-perfmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@unused-bo-1ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-10/igt@v3d/v3d_wait_bo@unused-bo-1ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-bad-name:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@vc4/vc4_label_bo@set-bad-name.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-3/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-purgeable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@vc4/vc4_purgeable_bo@mark-purgeable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-bad-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-8/igt@vc4/vc4_tiling@set-bad-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +9 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-18/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-17/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-6/igt@gem_eio@suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@gem_eio@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-17/igt@gem_exec_endless@dispatch@vcs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3778">i915#3778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@gem_exec_endless@dispatch@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk4/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-17/igt@gem_lmem_evict@dontneed-evict-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@gem_lmem_evict@dontneed-evict-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-glk8/igt@gen9_exec_parse@allowed-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk8/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9820">i915#9820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-b:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-glk7/igt@kms_cursor_legacy@torture-bo@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10166">i915#10166</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-glk8/igt@kms_cursor_legacy@torture-bo@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-rkl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-mtlp-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-mtlp-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-15/igt@kms_pm_dc@dc9-dpms.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-15/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-rkl-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9519">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9196">i915#9196</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@single-wait-all-available-signaled:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-17/igt@syncobj_timeline@single-wait-all-available-signaled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-18/igt@syncobj_timeline@single-wait-all-available-signaled.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg1-17/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg1-13/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-5/igt@kms_psr@fbc-pr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-11/igt@kms_psr@fbc-pr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14421/shard-dg2-11/igt@kms_psr@fbc-psr-primary-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10818/shard-dg2-6/igt@kms_psr@fbc-psr-primary-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7756 -&gt; IGTPW_10818</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14421: 1dfbf3ced62236dd318c701e3f21f5a33c226d0d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10818: 10818<br />
  IGT_7756: 7756<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============8440516417017806622==--
