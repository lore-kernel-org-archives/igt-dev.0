Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02311606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 13:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C0B10E534;
	Thu, 29 Oct 2026 13:06:54 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C568510E804;
 Thu, 29 Oct 2026 13:06:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2113728525423130678=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_EDITME=3A_Update_allocat?=
 =?utf-8?q?ion_flags_for_buffers_in_submit_job?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brajesh Gupta" <brajesh.gupta@imgtec.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Oct 2026 13:06:01 -0000
Message-ID: <179327916177.88070.18393432787458395329@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029-b4-render_update-v1-0-4a92ec210d6a@imgtec.com>
In-Reply-To: <20261029-b4-render_update-v1-0-4a92ec210d6a@imgtec.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============2113728525423130678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: EDITME: Update allocation flags for buffers in submit job
URL   : https://patchwork.freedesktop.org/series/177068/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19410_full -> IGTPW_16066_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16066_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16066_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16066_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf_pmu@multi-client@bcs0:
    - shard-dg2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-8/igt@perf_pmu@multi-client@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@perf_pmu@multi-client@bcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_19410_full and IGTPW_16066_full:

### New IGT tests (6) ###

  * igt@perf_pmu@extended-pageflip-modeset-hang-oldfb:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@multi-wait-all-submitted-signaled:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@psr-1p-primscrn-indfb-plflip-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@perf_pmu@single-bo:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_16066_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#6230])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#6230])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-14/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8411])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#8411])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-glk:          NOTRUN -> [SKIP][8] ([i915#17537])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk6/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#11078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#11078])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@dmabuf@dma-buf-fence-chain:
    - shard-glk:          NOTRUN -> [SKIP][11] ([i915#17712])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@dmabuf@dma-buf-fence-chain.html

  * igt@fbdev@unaligned-write:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#2582])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@fbdev@unaligned-write.html

  * igt@gem_basic@multigpu-create-close:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#7697]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#3555] / [i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-glk:          NOTRUN -> [SKIP][15] ([i915#17499]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk9/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#13008])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-glk10:        NOTRUN -> [SKIP][20] ([i915#17499])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#9323]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#6335])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@gem_create@create-ext-cpu-access-big.html
    - shard-dg2:          [PASS][23] -> [FAIL][24] ([i915#15454])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-glk:          NOTRUN -> [SKIP][25] ([i915#17530])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][26] ([i915#13356] / [i915#16466]) +1 other test incomplete
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk9/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][27] ([i915#13356]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#17444])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#17444])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#8555])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#8555])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-glk:          NOTRUN -> [SKIP][32] ([i915#17496])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk8/igt@gem_ctx_sseu@engines.html
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#280]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#280]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#4771])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@invalid-balancer:
    - shard-snb:          NOTRUN -> [SKIP][37] ([i915#17587])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb5/igt@gem_exec_balancer@invalid-balancer.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4036])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-14/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#8555]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#4525]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-glk11:        NOTRUN -> [SKIP][41] ([i915#17547])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-glk:          NOTRUN -> [SKIP][42] ([i915#17547]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk9/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#6334]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#6334]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-glk11:        NOTRUN -> [SKIP][45] ([i915#17711])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gem_exec_capture@capture-recoverable.html
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#6344])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@gem_exec_capture@capture-recoverable.html
    - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#6344])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][48] ([i915#16904]) +2 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][49] ([i915#17571])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk1/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fence@submit3:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4812]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#3539] / [i915#4852])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3539] / [i915#4852])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#17453])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#17416])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@gem_exec_params@secure-non-master.html
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#17416])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@gem_exec_params@secure-non-master.html
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#17416]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@gem_exec_params@secure-non-master.html
    - shard-glk:          NOTRUN -> [SKIP][57] ([i915#17523])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk9/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-active:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#3281]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-active.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#3281]) +7 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@gem_exec_reloc@basic-softpin.html
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3281]) +8 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#3281]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_schedule@preempt-other-chain:
    - shard-snb:          NOTRUN -> [SKIP][62] ([i915#17590])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb4/igt@gem_exec_schedule@preempt-other-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4812]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          [PASS][64] -> [INCOMPLETE][65] ([i915#13196] / [i915#13356]) +1 other test incomplete
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-glk5/igt@gem_exec_suspend@basic-s3.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4860])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][67] ([i915#17456] / [i915#2190])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][68] ([i915#4613] / [i915#7582])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-glk:          NOTRUN -> [SKIP][69] ([i915#17503] / [i915#4613]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4613])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4613]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#4613])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@massive:
    - shard-glk11:        NOTRUN -> [SKIP][73] ([i915#17503])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#4613]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-10/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify:
    - shard-glk10:        NOTRUN -> [SKIP][75] ([i915#17503])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@gem_lmem_swapping@verify.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#3282]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_media_vme:
    - shard-glk:          NOTRUN -> [SKIP][77] ([i915#17543])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk8/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4077]) +7 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html
    - shard-glk:          NOTRUN -> [SKIP][79] ([i915#17572])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@coherency:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#17429])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4083]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@write:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4083]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@gem_mmap_wc@write.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4083]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-14/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#3282]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4270])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-glk11:        NOTRUN -> [SKIP][86] ([i915#17521])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-glk:          NOTRUN -> [SKIP][87] ([i915#17521]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4270]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3282]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@gem_readwrite@beyond-eob.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#3282]) +6 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][91] ([i915#17492]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#8428]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@gem_render_copy@y-tiled-to-vebox-linear.html
    - shard-glk11:        NOTRUN -> [SKIP][93] ([i915#17492])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#5190] / [i915#8428]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-glk10:        NOTRUN -> [SKIP][95] ([i915#17492])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4079])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-glk:          NOTRUN -> [SKIP][97] ([i915#17551])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4885])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#4885])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4077]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#15657])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-glk11:        NOTRUN -> [SKIP][102] ([i915#16871])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#3297]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3297]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#3297] / [i915#3323])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#3297])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#3282] / [i915#3297])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3297] / [i915#4880])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-glk:          NOTRUN -> [SKIP][109] ([i915#17507]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3281] / [i915#3297])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#3297] / [i915#4958])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#3297]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-glk10:        NOTRUN -> [SKIP][113] ([i915#17507])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_render_linear_blits:
    - shard-glk:          NOTRUN -> [SKIP][114] ([i915#17555])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@gen3_render_linear_blits.html

  * igt@gen3_render_tiledy_blits:
    - shard-glk11:        NOTRUN -> [SKIP][115] ([i915#17578])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-glk:          NOTRUN -> [SKIP][116] ([i915#17505]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#17455]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@gen7_exec_parse@basic-rejected.html
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#17455]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@gen7_exec_parse@basic-rejected.html
    - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#17455]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@gen7_exec_parse@basic-rejected.html
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#17455]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#17455]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#2527] / [i915#2856]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-9/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#2527]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#2527])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@gen9_exec_parse@bb-secure.html
    - shard-tglu-1:       NOTRUN -> [SKIP][125] ([i915#2527] / [i915#2856]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#2856]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_drm_fdinfo@busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#11527]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@i915_drm_fdinfo@busy-check-all.html

  * igt@i915_drm_fdinfo@most-busy-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#14073]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-14/igt@i915_drm_fdinfo@most-busy-check-all@vcs1.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#14073]) +6 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@i915_drm_fdinfo@most-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@virtual-busy:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#14118])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy.html

  * igt@i915_drm_fdinfo@virtual-busy-idle:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#14118])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@i915_drm_fdinfo@virtual-busy-idle.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#14118])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#13786])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_module_load@fault-injection:
    - shard-dg2:          NOTRUN -> [ABORT][134] ([i915#15342] / [i915#15481])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@i915_module_load@fault-injection.html
    - shard-mtlp:         NOTRUN -> [ABORT][135] ([i915#15342] / [i915#15481])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-dg2:          NOTRUN -> [ABORT][136] ([i915#15481])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@i915_module_load@fault-injection@__uc_init.html
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#15479]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@i915_module_load@fault-injection@__uc_init.html
    - shard-mtlp:         NOTRUN -> [ABORT][138] ([i915#15481])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [ABORT][139] ([i915#15342]) +1 other test abort
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-snb:          NOTRUN -> [ABORT][140] ([i915#15342]) +1 other test abort
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb4/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][141] ([i915#15342])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-dg2:          NOTRUN -> [DMESG-WARN][142] ([i915#15342])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@intel_guc_ct_init:
    - shard-snb:          NOTRUN -> [SKIP][143] ([i915#17600]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb4/igt@i915_module_load@fault-injection@intel_guc_ct_init.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][144] ([i915#8399])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][145] -> [INCOMPLETE][146] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq:
    - shard-glk:          NOTRUN -> [SKIP][147] ([i915#17699]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk8/igt@i915_pm_freq_mult@media-freq.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-glk:          NOTRUN -> [SKIP][148] ([i915#17541])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [PASS][149] -> [FAIL][150] ([i915#12964]) +1 other test fail
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][151] ([i915#13790] / [i915#2681]) +1 other test warn
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][152] ([i915#17706])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#17434] / [i915#17450])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          [PASS][154] -> [INCOMPLETE][155] ([i915#13356])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-2/igt@i915_pm_rpm@system-suspend.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#4387])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#4387])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#7984])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@i915_power@sanity.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#16109])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#16079])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-glk:          NOTRUN -> [SKIP][161] ([i915#17673])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-rkl:          [PASS][162] -> [ABORT][163] ([i915#15131])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-5/igt@i915_suspend@basic-s2idle-without-i915.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [PASS][164] -> [INCOMPLETE][165] ([i915#4817])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-8/igt@i915_suspend@debugfs-reader.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          NOTRUN -> [INCOMPLETE][166] ([i915#13356] / [i915#16182] / [i915#4817])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@forcewake:
    - shard-mtlp:         [PASS][167] -> [TIMEOUT][168] ([i915#17273])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-mtlp-2/igt@i915_suspend@forcewake.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#7707]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@intel_hwmon@hwmon-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#7707])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@intel_hwmon@hwmon-read.html
    - shard-glk:          NOTRUN -> [SKIP][171] ([i915#11680])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#4212])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#4215])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-dg1:          [PASS][174] -> [FAIL][175] ([i915#14888])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg1-15/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][176] ([i915#14888])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [PASS][177] -> [INCOMPLETE][178] ([i915#12761]) +1 other test incomplete
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-resume.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][179] ([i915#12761] / [i915#13356])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][180] ([i915#12761] / [i915#13356] / [i915#14995])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-snb:          NOTRUN -> [SKIP][181] ([i915#17562])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb4/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
    - shard-glk:          NOTRUN -> [SKIP][182] ([i915#17562])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-glk:          NOTRUN -> [SKIP][183] ([i915#17485])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#1769] / [i915#3555])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#1769] / [i915#3555])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#4538] / [i915#5286]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-glk11:        NOTRUN -> [SKIP][187] ([i915#17478]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#17432] / [i915#5286]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-glk11:        NOTRUN -> [SKIP][189] ([i915#17557])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#17432] / [i915#5286]) +7 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
    - shard-glk10:        NOTRUN -> [SKIP][191] ([i915#17478]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#4538] / [i915#5286]) +7 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][193] -> [FAIL][194] ([i915#15733] / [i915#5138])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][195] ([i915#17478]) +9 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#17431] / [i915#3638]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#3638]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#17431])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#17431]) +4 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][200] ([i915#3828]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#3828])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-glk11:        NOTRUN -> [SKIP][202] ([i915#17524])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#17431]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [PASS][204] -> [SKIP][205] ([i915#17356]) +42 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-snb:          NOTRUN -> [SKIP][206] ([i915#17500])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-glk11:        NOTRUN -> [SKIP][207] ([i915#17500])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#17432]) +7 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#4538] / [i915#5190]) +5 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-glk10:        NOTRUN -> [SKIP][210] ([i915#17500])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#17432]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#4538]) +5 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][213] ([i915#17500]) +10 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#17432]) +7 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#4538]) +8 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
    - shard-snb:          NOTRUN -> [SKIP][216] ([i915#17478]) +2 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#14098] / [i915#6095]) +39 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][218] ([i915#17491]) +121 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#6095]) +176 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][220] ([i915#17490] / [i915#17491]) +43 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#12313]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#12313])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#12313]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-snb:          NOTRUN -> [SKIP][224] ([i915#17594]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][225] ([i915#17490] / [i915#17491]) +9 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][226] ([i915#17491]) +9 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][227] ([i915#17490] / [i915#17491]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#10307] / [i915#6095]) +93 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#6095]) +39 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#6095]) +59 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#12805])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#6095]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [PASS][233] -> [FAIL][234] ([i915#17158]) +1 other test fail
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#12313]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][236] ([i915#17491]) +24 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][237] ([i915#17525])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#6095]) +119 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-glk:          NOTRUN -> [SKIP][240] ([i915#17525]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#12313] / [i915#14544])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#6095]) +69 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#12313]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#14544] / [i915#6095]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-glk:          NOTRUN -> [SKIP][246] ([i915#17550]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_cdclk@mode-transition.html
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#3742])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#13781]) +8 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-glk11:        NOTRUN -> [SKIP][249] ([i915#17483]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#11151])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#17427]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#17427]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#17427]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_chamelium_color@ctm-green-to-red.html
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#17427]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#17427]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-glk11:        NOTRUN -> [SKIP][256] ([i915#17489])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@gamma:
    - shard-glk:          NOTRUN -> [SKIP][257] ([i915#17489]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#16471] / [i915#17427]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-10/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - shard-glk:          NOTRUN -> [SKIP][259] ([i915#17497]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#17427]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-glk11:        NOTRUN -> [SKIP][261] ([i915#17497]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#16471] / [i915#17427]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html
    - shard-tglu-1:       NOTRUN -> [SKIP][263] ([i915#16471] / [i915#17427])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d.html
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#16471] / [i915#17427]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#16464] / [i915#16471] / [i915#17427])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#11151] / [i915#14544] / [i915#7828])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#11151] / [i915#7828]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#11151] / [i915#7828]) +9 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#11151] / [i915#7828]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#11151] / [i915#7828]) +5 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-glk10:        NOTRUN -> [SKIP][271] ([i915#17483]) +3 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#11151])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-glk:          NOTRUN -> [SKIP][273] ([i915#17483]) +11 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-tglu-1:       NOTRUN -> [SKIP][274] ([i915#11151] / [i915#7828]) +8 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#11151] / [i915#7828]) +10 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color@background-color@pipe-a-background-color:
    - shard-glk:          NOTRUN -> [FAIL][276] ([i915#17133]) +3 other tests fail
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_color@background-color@pipe-a-background-color.html

  * igt@kms_color@ctm-green-to-red:
    - shard-dg2:          [PASS][277] -> [SKIP][278] ([i915#12655] / [i915#17373]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-5/igt@kms_color@ctm-green-to-red.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_color@ctm-green-to-red.html

  * igt@kms_color@deep-color:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#12655] / [i915#3555])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_color@deep-color.html
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#3555] / [i915#9979])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-dg2:          [PASS][281] -> [SKIP][282] ([i915#15529]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][283] ([i915#17510]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4:
    - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#16990]) +7 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#16990]) +5 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#16990]) +15 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#16990]) +7 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5:
    - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#16990]) +47 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-glk:          NOTRUN -> [SKIP][289] ([i915#17508]) +4 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-tglu-1:       NOTRUN -> [SKIP][290] ([i915#15865])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_content_protection@atomic-hdcp14.html
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#15865]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#15330] / [i915#3299]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#15330] / [i915#3299])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#15330])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
    - shard-glk11:        NOTRUN -> [SKIP][295] ([i915#17502])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#15330] / [i915#3116] / [i915#3299])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-glk:          NOTRUN -> [SKIP][297] ([i915#17502])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#15330] / [i915#3299])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#15330])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#15865]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-glk10:        NOTRUN -> [SKIP][301] ([i915#17508])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#15865]) +3 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#15865]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_content_protection@mei-interface.html
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#15865]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][305] ([i915#17356]) +8 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-snb:          NOTRUN -> [SKIP][306] ([i915#17504])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          NOTRUN -> [FAIL][307] ([i915#13566]) +1 other test fail
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-tglu:         [PASS][308] -> [FAIL][309] ([i915#13566]) +3 other tests fail
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#13049] / [i915#3359])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#3555]) +3 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-glk11:        NOTRUN -> [SKIP][312] ([i915#17533])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][313] ([i915#8814])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-glk:          NOTRUN -> [SKIP][314] ([i915#17533])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#13049]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#13049])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-glk11:        NOTRUN -> [SKIP][317] ([i915#17504]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [FAIL][318] ([i915#13566]) +1 other test fail
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][319] ([i915#3555]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#13049])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#13049]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-glk:          NOTRUN -> [SKIP][322] ([i915#17504]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk1/igt@kms_cursor_crc@cursor-sliding-max-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][323] ([i915#3555] / [i915#8814]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][324] ([i915#12358] / [i915#13356] / [i915#14152] / [i915#7882])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][325] ([i915#12358] / [i915#13356] / [i915#14152])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][326] ([i915#12358] / [i915#14152]) +1 other test incomplete
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#13046] / [i915#17454] / [i915#5354]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#17428] / [i915#17454]) +5 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#4103])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][330] ([i915#16119] / [i915#4213]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#4103])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#4103]) +2 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-glk11:        NOTRUN -> [SKIP][333] ([i915#17457])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#17428] / [i915#17454]) +8 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#17428] / [i915#9809]) +2 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#9067])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#9067])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [SKIP][338] ([i915#17457])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#4103])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-glk:          NOTRUN -> [SKIP][340] ([i915#17515])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu-1:       NOTRUN -> [SKIP][341] ([i915#9723])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#9723])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-glk10:        NOTRUN -> [SKIP][343] ([i915#17515])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#1769] / [i915#3555] / [i915#3804])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][345] ([i915#17487])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#3804])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][347] ([i915#17486]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-glk11:        NOTRUN -> [SKIP][348] ([i915#17519])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#17291])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#17286])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#17290])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#17293])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#17285]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_dp_link_training@uhbr-mst-direct-train.html
    - shard-tglu-1:       NOTRUN -> [SKIP][354] ([i915#17285])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#17285]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][356] ([i915#17477])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-glk11:        NOTRUN -> [SKIP][357] ([i915#17477]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#17285])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#16867])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#16867])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#16870])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#16361])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-glk11:        NOTRUN -> [SKIP][363] ([i915#17458])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#16361]) +6 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-glk:          NOTRUN -> [SKIP][365] ([i915#17458]) +9 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk9/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#16361]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#16361]) +3 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#14544] / [i915#16361])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][369] ([i915#16361]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#16361]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#16680])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-glk:          NOTRUN -> [SKIP][372] ([i915#17516]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk9/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-1x:
    - shard-dg2:          [PASS][373] -> [SKIP][374] ([i915#9738])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-6/igt@kms_feature_discovery@display-1x.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_feature_discovery@display-1x.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][375] ([i915#16081])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][376] ([i915#16081])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_feature_discovery@display-3x.html
    - shard-tglu-1:       NOTRUN -> [SKIP][377] ([i915#16081])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-glk:          NOTRUN -> [SKIP][378] ([i915#17666])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_feature_discovery@display-4x.html
    - shard-mtlp:         NOTRUN -> [SKIP][379] ([i915#16081])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-glk11:        NOTRUN -> [SKIP][380] ([i915#17570])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_feature_discovery@dp-mst.html
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#16599])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][382] ([i915#16599])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-glk10:        NOTRUN -> [SKIP][383] ([i915#17539])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_feature_discovery@dsc.html
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#16600])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][385] ([i915#16600])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg1:          NOTRUN -> [SKIP][386] ([i915#658])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][387] ([i915#3637] / [i915#9934]) +10 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][388] ([i915#3637] / [i915#9934]) +7 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#9934]) +4 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#9934]) +6 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][391] ([i915#9934]) +3 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][392] ([i915#3637] / [i915#9934]) +2 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][393] ([i915#8381])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][394] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][395] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][396] ([i915#12745] / [i915#13356] / [i915#17183])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][397] ([i915#12745] / [i915#13356] / [i915#17183])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-dg2:          [PASS][398] -> [SKIP][399] ([i915#5354]) +3 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-8/igt@kms_flip@modeset-vs-vblank-race.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][400] ([i915#15643]) +4 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-glk11:        NOTRUN -> [SKIP][401] ([i915#17493])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][402] ([i915#17493]) +2 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-snb:          NOTRUN -> [SKIP][403] ([i915#17593])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][404] ([i915#15643] / [i915#5190])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][405] ([i915#15643]) +8 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][406] ([i915#15643]) +2 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][407] ([i915#15643]) +4 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][408] ([i915#15643]) +2 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-glk11:        NOTRUN -> [SKIP][409] ([i915#17484])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-dg2:          [PASS][410] -> [SKIP][411] ([i915#3555] / [i915#8813]) +2 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-glk:          NOTRUN -> [SKIP][412] ([i915#17522]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][413] ([i915#17484]) +2 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][414] ([i915#15643])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-glk:          NOTRUN -> [SKIP][415] ([i915#17465])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_force_connector_basic@force-load-detect.html
    - shard-dg2:          NOTRUN -> [SKIP][416] ([i915#17452])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_force_connector_basic@force-load-detect.html
    - shard-mtlp:         NOTRUN -> [SKIP][417] ([i915#17452])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][418] ([i915#15990] / [i915#8708]) +4 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [PASS][419] -> [SKIP][420] ([i915#16708] / [i915#5354]) +5 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][421] ([i915#17428] / [i915#1825]) +3 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][422] ([i915#17428]) +96 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][423] ([i915#16708] / [i915#5354]) +8 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][424] ([i915#10056])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][425] ([i915#10056] / [i915#13356] / [i915#16593])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-glk11:        NOTRUN -> [SKIP][426] ([i915#17559])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-rkl:          NOTRUN -> [SKIP][427] ([i915#5439])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-indfb-fliptrack-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][428] ([i915#15989]) +15 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-glk:          NOTRUN -> [SKIP][429] ([i915#17517]) +59 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][430] ([i915#15989]) +18 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][431] ([i915#15989]) +27 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][432] -> [SKIP][433] ([i915#17517]) +6 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render:
    - shard-glk11:        NOTRUN -> [SKIP][434] ([i915#17517]) +7 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          [PASS][435] -> [SKIP][436] ([i915#15989]) +8 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][437] ([i915#16708]) +7 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][438] ([i915#15991]) +15 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:
    - shard-dg1:          NOTRUN -> [SKIP][439] ([i915#15989]) +20 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][440] ([i915#17559])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][441] ([i915#15102]) +10 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-snb:          NOTRUN -> [SKIP][442] ([i915#17588]) +4 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][443] ([i915#14544] / [i915#17428]) +4 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][444] ([i915#17428]) +51 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][445] ([i915#14544] / [i915#15102]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][446] ([i915#15102]) +65 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][447] ([i915#15102]) +27 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][448] ([i915#15989]) +30 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][449] ([i915#15102]) +47 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][450] ([i915#15102]) +42 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][451] ([i915#17428]) +60 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][452] ([i915#15990]) +8 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][453] ([i915#5439])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][454] ([i915#5439])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][455] ([i915#15990]) +8 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][456] ([i915#15989]) +8 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][457] ([i915#15991] / [i915#17428]) +33 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-snb:          NOTRUN -> [SKIP][458] ([i915#17517]) +1 other test skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][459] ([i915#13356] / [i915#16056] / [i915#16593])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-glk:          NOTRUN -> [SKIP][460] ([i915#17482]) +153 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-glk11:        NOTRUN -> [SKIP][461] ([i915#17482]) +30 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][462] ([i915#15990] / [i915#8708]) +3 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][463] ([i915#15991] / [i915#5354]) +10 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][464] ([i915#15991] / [i915#17428] / [i915#1825]) +26 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-glk10:        NOTRUN -> [SKIP][465] ([i915#17482]) +13 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][466] ([i915#15990] / [i915#8708]) +18 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][467] ([i915#15990]) +20 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-14/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][468] ([i915#17428]) +102 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:
    - shard-snb:          NOTRUN -> [SKIP][469] ([i915#17482])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb1/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-dg2:          [PASS][470] -> [SKIP][471] ([i915#17357])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-6/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
    - shard-glk:          NOTRUN -> [FAIL][472] ([i915#17102])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-tglu:         NOTRUN -> [FAIL][473] ([i915#17101] / [i915#17108] / [i915#17188])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
    - shard-glk11:        NOTRUN -> [FAIL][474] ([i915#17101] / [i915#17108])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          NOTRUN -> [SKIP][475] ([i915#16518] / [i915#3555] / [i915#8228])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][476] ([i915#12713])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu-1:       NOTRUN -> [SKIP][477] ([i915#3555] / [i915#8228])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-glk:          NOTRUN -> [SKIP][478] ([i915#17498]) +2 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-glk11:        NOTRUN -> [SKIP][479] ([i915#17498])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_hdr@static-toggle-dpms.html
    - shard-rkl:          [PASS][480] -> [SKIP][481] ([i915#16644] / [i915#3555] / [i915#8228])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_hdr@static-toggle-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][482] ([i915#3555] / [i915#8228])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-dg2:          [PASS][483] -> [SKIP][484] ([i915#16746] / [i915#3555]) +1 other test skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-3/igt@kms_invalid_mode@bad-vsync-end.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][485] ([i915#17512])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][486] ([i915#13688])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][487] ([i915#15458]) +1 other test skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_joiner@basic-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][488] ([i915#15458])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][489] ([i915#15460])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-glk11:        NOTRUN -> [SKIP][490] ([i915#17567])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][491] ([i915#15458]) +1 other test skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][492] ([i915#15638] / [i915#15722])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-glk:          NOTRUN -> [SKIP][493] ([i915#17579])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-glk:          NOTRUN -> [SKIP][494] ([i915#17577])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_panel_fitting@atomic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][495] ([i915#6301])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][496] ([i915#6301])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][497] ([i915#6301])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglu:         NOTRUN -> [SKIP][498] ([i915#17455]) +4 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-7/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-glk11:        NOTRUN -> [SKIP][499] ([i915#17540])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-glk10:        NOTRUN -> [SKIP][500] ([i915#17540])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - shard-dg2:          [PASS][501] -> [SKIP][502] ([i915#11190] / [i915#17356])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-5/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-mtlp:         NOTRUN -> [ABORT][503] ([i915#17146]) +1 other test abort
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@kms_pipe_crc_basic@suspend-read-crc.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][504] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#13476] / [i915#16789])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][505] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#16789])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-tglu-1:       NOTRUN -> [SKIP][506] ([i915#14712])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-glk11:        NOTRUN -> [DMESG-WARN][507] ([i915#118])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][508] ([i915#118])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         NOTRUN -> [SKIP][509] ([i915#14712])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-glk:          NOTRUN -> [SKIP][510] ([i915#17479]) +4 other tests skip
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][511] ([i915#15709])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-glk11:        NOTRUN -> [SKIP][512] ([i915#17479]) +2 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-dg2:          [PASS][513] -> [SKIP][514] ([i915#8825]) +4 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][515] ([i915#15709]) +4 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][516] ([i915#15709]) +5 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][517] ([i915#16386]) +1 other test skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][518] ([i915#15709]) +1 other test skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][519] ([i915#17494]) +1 other test skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-4.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-mtlp:         NOTRUN -> [SKIP][520] ([i915#15709]) +2 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][521] ([i915#16386]) +1 other test skip
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][522] ([i915#15709]) +3 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-glk:          NOTRUN -> [SKIP][523] ([i915#17700])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
    - shard-tglu:         NOTRUN -> [SKIP][524] ([i915#16112])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][525] ([i915#16112])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-glk:          [PASS][526] -> [INCOMPLETE][527] ([i915#13026] / [i915#13356])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][528] ([i915#17509])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][529] ([i915#14544] / [i915#3555])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][530] ([i915#13958])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-mtlp:         NOTRUN -> [SKIP][531] ([i915#13958])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-glk:          NOTRUN -> [SKIP][532] ([i915#17586])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk9/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg1:          NOTRUN -> [SKIP][533] ([i915#13958])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_plane_multiple@2x-tiling-x.html
    - shard-tglu:         NOTRUN -> [SKIP][534] ([i915#13958])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-tglu-1:       NOTRUN -> [SKIP][535] ([i915#13958])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-glk11:        NOTRUN -> [SKIP][536] ([i915#17542])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][537] ([i915#14259])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-dg2:          [PASS][538] -> [SKIP][539] ([i915#17356] / [i915#9423])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-3/igt@kms_plane_scaling@invalid-parameters.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][540] ([i915#15329] / [i915#17356] / [i915#9423])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-dg2:          NOTRUN -> [SKIP][541] ([i915#15329]) +2 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][542] ([i915#15329] / [i915#17356])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][543] ([i915#15329]) +4 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          [PASS][544] -> [SKIP][545] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:
    - shard-dg2:          [PASS][546] -> [SKIP][547] ([i915#15329] / [i915#17356]) +3 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][548] ([i915#15329]) +3 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][549] ([i915#15329] / [i915#6953])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
    - shard-snb:          NOTRUN -> [SKIP][550] ([i915#17528]) +1 other test skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][551] ([i915#17529])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][552] ([i915#15329]) +3 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-dg2:          [PASS][553] -> [SKIP][554] ([i915#15329] / [i915#17356] / [i915#9423])
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-dg2:          [PASS][555] -> [SKIP][556] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423]) +1 other test skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - shard-dg2:          [PASS][557] -> [SKIP][558] ([i915#15329]) +11 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-glk:          NOTRUN -> [SKIP][559] ([i915#17462]) +1 other test skip
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-glk11:        NOTRUN -> [SKIP][560] ([i915#17462]) +1 other test skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][561] ([i915#12343])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu:         NOTRUN -> [SKIP][562] ([i915#12343] / [i915#9812]) +1 other test skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-9/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][563] ([i915#12343] / [i915#5354])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][564] ([i915#12343] / [i915#5354]) +1 other test skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][565] ([i915#12343] / [i915#5354])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-glk:          NOTRUN -> [SKIP][566] ([i915#17564])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_pm_dc@dc5-psr.html
    - shard-rkl:          NOTRUN -> [SKIP][567] ([i915#14544] / [i915#15948])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-glk:          NOTRUN -> [SKIP][568] ([i915#17495])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_pm_dc@dc5-psr-suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][569] ([i915#16914])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@kms_pm_dc@dc5-psr-suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][570] ([i915#16914])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-mtlp:         NOTRUN -> [SKIP][571] ([i915#3828])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-glk:          NOTRUN -> [SKIP][572] ([i915#17553])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][573] ([i915#15948])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-glk10:        NOTRUN -> [SKIP][574] ([i915#17703])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-glk10:        NOTRUN -> [SKIP][575] ([i915#17702])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg2:          [PASS][576] -> [SKIP][577] ([i915#9340])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][578] ([i915#4077]) +15 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-glk:          NOTRUN -> [SKIP][579] ([i915#15073])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][580] ([i915#15073])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][581] -> [SKIP][582] ([i915#15073]) +2 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-dg1:          [PASS][583] -> [SKIP][584] ([i915#15073]) +1 other test skip
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg1-17/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-tglu:         NOTRUN -> [SKIP][585] ([i915#15073])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-mtlp:         NOTRUN -> [SKIP][586] ([i915#15073])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-glk:          NOTRUN -> [SKIP][587] ([i915#17709])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_pm_rpm@modeset-pc8-residency-stress.html
    - shard-dg2:          NOTRUN -> [SKIP][588] ([i915#17434] / [i915#17450])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg1:          NOTRUN -> [SKIP][589] ([i915#17434] / [i915#17450])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg1:          NOTRUN -> [SKIP][590] ([i915#6524])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_properties@colorop-properties-atomic:
    - shard-glk11:        NOTRUN -> [SKIP][591] ([i915#17481])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_properties@colorop-properties-atomic.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-glk:          NOTRUN -> [SKIP][592] ([i915#17481])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-dg2:          [PASS][593] -> [SKIP][594] ([i915#11521])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-5/igt@kms_properties@crtc-properties-legacy.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-glk10:        NOTRUN -> [SKIP][595] ([i915#11520]) +1 other test skip
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][596] ([i915#11520]) +4 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
    - shard-snb:          NOTRUN -> [SKIP][597] ([i915#11520])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][598] ([i915#11520]) +7 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][599] ([i915#11520]) +7 other tests skip
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][600] ([i915#9808])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][601] ([i915#12316]) +8 other tests skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][602] ([i915#11520]) +10 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-glk11:        NOTRUN -> [SKIP][603] ([i915#11520]) +1 other test skip
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][604] ([i915#11520] / [i915#14544])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][605] ([i915#11520]) +5 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][606] ([i915#11520]) +18 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][607] ([i915#9683]) +1 other test skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-glk11:        NOTRUN -> [SKIP][608] ([i915#17546])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][609] ([i915#1072] / [i915#9732]) +15 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2:          NOTRUN -> [SKIP][610] ([i915#1072] / [i915#9732]) +9 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][611] ([i915#1072] / [i915#14544] / [i915#9732])
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][612] ([i915#9688]) +16 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][613] ([i915#9732]) +20 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-7/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-cpu:
    - shard-glk10:        NOTRUN -> [SKIP][614] ([i915#17480]) +3 other tests skip
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-glk11:        NOTRUN -> [SKIP][615] ([i915#17480]) +6 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][616] ([i915#1072] / [i915#9732]) +24 other tests skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-no-drrs:
    - shard-glk:          NOTRUN -> [SKIP][617] ([i915#17480]) +32 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_psr@psr-no-drrs.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - shard-glk11:        NOTRUN -> [SKIP][618] ([i915#17480] / [i915#9732])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][619] ([i915#9732]) +9 other tests skip
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr-suspend:
    - shard-mtlp:         [PASS][620] -> [FAIL][621] ([i915#17226]) +1 other test fail
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-mtlp-8/igt@kms_psr@psr-suspend.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_psr@psr-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-glk:          NOTRUN -> [SKIP][622] ([i915#17554])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][623] ([i915#4884])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][624] ([i915#15492] / [i915#16184])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][625] ([i915#15867]) +1 other test skip
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][626] ([i915#12755] / [i915#15867])
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-snb:          NOTRUN -> [SKIP][627] ([i915#17488])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-glk:          NOTRUN -> [SKIP][628] ([i915#17488]) +5 other tests skip
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][629] ([i915#5289])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-glk11:        NOTRUN -> [SKIP][630] ([i915#17488])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][631] ([i915#17432] / [i915#5289]) +1 other test skip
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu-1:       NOTRUN -> [SKIP][632] ([i915#17432] / [i915#5289])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][633] ([i915#17432] / [i915#5289])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][634] ([i915#17432] / [i915#5289])
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-glk:          NOTRUN -> [SKIP][635] ([i915#17501]) +1 other test skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_scaling_modes@scaling-mode-center.html
    - shard-dg2:          NOTRUN -> [SKIP][636] ([i915#3555]) +1 other test skip
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][637] ([i915#3555]) +10 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-glk10:        NOTRUN -> [SKIP][638] ([i915#17463])
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][639] ([i915#3555] / [i915#8809] / [i915#8823])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][640] ([i915#8623])
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_tiled_display@basic-test-pattern.html
    - shard-tglu:         NOTRUN -> [SKIP][641] ([i915#8623])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][642] ([i915#8623])
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-mtlp:         NOTRUN -> [SKIP][643] ([i915#17445])
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-mtlp:         [PASS][644] -> [INCOMPLETE][645] ([i915#12276]) +1 other test incomplete
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-mtlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:
    - shard-mtlp:         [PASS][646] -> [FAIL][647] ([i915#17209])
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-mtlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-glk:          NOTRUN -> [SKIP][648] ([i915#17520]) +2 other tests skip
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][649] ([i915#3555]) +5 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          NOTRUN -> [SKIP][650] ([i915#15243] / [i915#3555])
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-glk10:        NOTRUN -> [SKIP][651] ([i915#17561])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][652] ([i915#11920])
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][653] ([i915#11920])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          NOTRUN -> [SKIP][654] ([i915#9906])
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_vrr@max-min.html
    - shard-rkl:          NOTRUN -> [SKIP][655] ([i915#14544] / [i915#9906])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][656] ([i915#9906]) +1 other test skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu:         NOTRUN -> [SKIP][657] ([i915#3555] / [i915#9906])
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg1:          NOTRUN -> [SKIP][658] ([i915#9906]) +2 other tests skip
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-mtlp:         NOTRUN -> [SKIP][659] ([i915#8808] / [i915#9906]) +2 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-glk11:        NOTRUN -> [SKIP][660] ([i915#17520])
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][661] ([i915#14544] / [i915#2436])
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][662] ([i915#2434])
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@perf@mi-rpc.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-tglu:         NOTRUN -> [SKIP][663] ([i915#17416]) +2 other tests skip
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-rkl:          [PASS][664] -> [FAIL][665] ([i915#4349]) +1 other test fail
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@perf_pmu@most-busy-idle-check-all.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@multi-client:
    - shard-dg2:          [PASS][666] -> [ABORT][667] ([i915#13562])
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-8/igt@perf_pmu@multi-client.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@perf_pmu@multi-client.html

  * igt@perf_pmu@multi-client@rcs0:
    - shard-dg2:          [PASS][668] -> [DMESG-WARN][669] ([i915#13562])
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-8/igt@perf_pmu@multi-client@rcs0.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@perf_pmu@multi-client@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][670] ([i915#8516])
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_udl@share-import-addfb:
    - shard-glk:          NOTRUN -> [SKIP][671] ([i915#16420])
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@prime_udl@share-import-addfb.html
    - shard-tglu-1:       NOTRUN -> [SKIP][672] ([i915#16420])
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][673] ([i915#3708] / [i915#4077]) +1 other test skip
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][674] ([i915#17448] / [i915#3291] / [i915#3708])
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@prime_vgem@basic-write.html
    - shard-dg1:          NOTRUN -> [SKIP][675] ([i915#3708])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][676] ([i915#17429] / [i915#17448])
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@prime_vgem@coherency-gtt.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-tglu:         NOTRUN -> [SKIP][677] ([i915#17447])
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-dg2:          [SKIP][678] ([i915#2582]) -> [PASS][679]
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@fbdev@read.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@fbdev@read.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][680] ([i915#13356] / [i915#16348]) -> [PASS][681] +1 other test pass
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@gem_ccs@suspend-resume.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-mtlp:         [FAIL][682] ([i915#17176]) -> [PASS][683]
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3@vcs1.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-mtlp:         [INCOMPLETE][684] ([i915#17247]) -> [PASS][685]
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-mtlp-3/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [INCOMPLETE][686] ([i915#13356]) -> [PASS][687]
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-glk9/igt@gem_workarounds@suspend-resume-context.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk5/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [INCOMPLETE][688] ([i915#13356] / [i915#16182] / [i915#4817]) -> [PASS][689]
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-glk9/igt@i915_suspend@sysfs-reader.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@i915_suspend@sysfs-reader.html
    - shard-rkl:          [INCOMPLETE][690] ([i915#4817]) -> [PASS][691]
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@i915_suspend@sysfs-reader.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-mtlp:         [INCOMPLETE][692] ([i915#17037]) -> [PASS][693] +1 other test pass
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-mtlp-5/igt@kms_async_flips@async-flip-suspend-resume.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][694] ([i915#17150]) -> [PASS][695]
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-mtlp-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html

  * igt@kms_color@ctm-negative:
    - shard-dg2:          [SKIP][696] ([i915#12655] / [i915#17373]) -> [PASS][697]
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_color@ctm-negative.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_color@ctm-negative.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-dg2:          [SKIP][698] ([i915#15529]) -> [PASS][699] +2 other tests pass
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][700] ([i915#13566]) -> [PASS][701] +1 other test pass
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-dg2:          [SKIP][702] ([i915#5354]) -> [PASS][703] +3 other tests pass
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_flip@dpms-off-confusion-interruptible.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-snb:          [FAIL][704] ([i915#10826]) -> [PASS][705] +1 other test pass
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-snb4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-snb7/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-rkl:          [FAIL][706] ([i915#14600]) -> [PASS][707]
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2:          [SKIP][708] ([i915#3555] / [i915#8813]) -> [PASS][709] +4 other tests pass
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2:          [SKIP][710] ([i915#16708]) -> [PASS][711] +1 other test pass
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          [SKIP][712] ([i915#16708] / [i915#5354]) -> [PASS][713] +4 other tests pass
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-glk10:        [SKIP][714] ([i915#17517]) -> [PASS][715]
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][716] ([i915#15989]) -> [PASS][717] +8 other tests pass
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt:
    - shard-glk11:        [SKIP][718] ([i915#17517]) -> [PASS][719]
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt.html
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-glk:          [SKIP][720] ([i915#17517]) -> [PASS][721] +6 other tests pass
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-glk4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-dg2:          [SKIP][722] ([i915#16746] / [i915#3555]) -> [PASS][723]
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_invalid_mode@clock-too-high.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_invalid_mode@overflow-vrefresh:
    - shard-dg2:          [SKIP][724] ([i915#16746]) -> [PASS][725]
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_invalid_mode@overflow-vrefresh.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_invalid_mode@overflow-vrefresh.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-dg2:          [SKIP][726] ([i915#11190] / [i915#17356]) -> [PASS][727] +2 other tests pass
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-dg2:          [SKIP][728] ([i915#8825]) -> [PASS][729] +1 other test pass
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [SKIP][730] ([i915#6953]) -> [PASS][731]
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-dg2:          [SKIP][732] ([i915#15329] / [i915#17356] / [i915#9423]) -> [PASS][733] +1 other test pass
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:
    - shard-dg2:          [SKIP][734] ([i915#15329] / [i915#17356]) -> [PASS][735] +2 other tests pass
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2:          [SKIP][736] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423]) -> [PASS][737]
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-dg2:          [SKIP][738] ([i915#15329]) -> [PASS][739] +8 other tests pass
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [SKIP][740] ([i915#15073]) -> [PASS][741] +1 other test pass
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          [ABORT][742] ([i915#15132]) -> [PASS][743]
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-1/igt@kms_pm_rpm@system-suspend-modeset.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_vblank@wait-idle-hang:
    - shard-dg2:          [SKIP][744] ([i915#17356]) -> [PASS][745] +27 other tests pass
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_vblank@wait-idle-hang.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@kms_vblank@wait-idle-hang.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-mtlp:         [FAIL][746] ([i915#4349]) -> [PASS][747] +2 other tests pass
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-mtlp-2/igt@perf_pmu@busy-double-start@vcs1.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@perf_pmu@busy-double-start@vcs1.html

  
#### Warnings ####

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          [SKIP][748] ([i915#14544] / [i915#7697]) -> [SKIP][749] ([i915#7697])
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@gem_basic@multigpu-create-close.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-mtlp:         [FAIL][750] ([i915#17176]) -> [ABORT][751] ([i915#17146]) +1 other test abort
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          [SKIP][752] ([i915#280]) -> [SKIP][753] ([i915#14544] / [i915#280])
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-5/igt@gem_ctx_sseu@mmap-args.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          [SKIP][754] ([i915#14544] / [i915#3281]) -> [SKIP][755] ([i915#3281])
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-noreloc.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          [SKIP][756] ([i915#14544] / [i915#4613]) -> [SKIP][757] ([i915#4613])
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@gem_lmem_swapping@verify.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@gem_lmem_swapping@verify.html

  * igt@gem_pread@display:
    - shard-rkl:          [SKIP][758] ([i915#3282]) -> [SKIP][759] ([i915#14544] / [i915#3282])
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-5/igt@gem_pread@display.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@gem_pread@display.html

  * igt@gem_pread@snoop:
    - shard-rkl:          [SKIP][760] ([i915#14544] / [i915#3282]) -> [SKIP][761] ([i915#3282]) +4 other tests skip
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@gem_pread@snoop.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@gem_pread@snoop.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [SKIP][762] ([i915#13717] / [i915#14544]) -> [SKIP][763] ([i915#13717])
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          [SKIP][764] ([i915#14544] / [i915#3282] / [i915#3297]) -> [SKIP][765] ([i915#3282] / [i915#3297])
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gen3_render_tiledx_blits:
    - shard-rkl:          [SKIP][766] ([i915#14544] / [i915#17455]) -> [SKIP][767] ([i915#17455]) +1 other test skip
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@gen3_render_tiledx_blits.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@gen3_render_tiledx_blits.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          [SKIP][768] ([i915#14544] / [i915#2527]) -> [SKIP][769] ([i915#2527]) +2 other tests skip
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@gen9_exec_parse@bb-oversize.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][770] ([i915#14544] / [i915#4387]) -> [SKIP][771] ([i915#4387])
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][772] ([i915#5723]) -> [SKIP][773] ([i915#14544] / [i915#5723])
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-7/igt@i915_query@test-query-geometry-subslices.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          [SKIP][774] ([i915#14544] / [i915#7707]) -> [SKIP][775] ([i915#7707])
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@intel_hwmon@hwmon-read.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][776] ([i915#1769] / [i915#3555]) -> [SKIP][777] ([i915#14544] / [i915#1769] / [i915#3555])
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][778] ([i915#17356]) -> [SKIP][779] ([i915#17431]) +2 other tests skip
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-rkl:          [SKIP][780] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][781] ([i915#4538] / [i915#5286]) +2 other tests skip
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-rkl:          [SKIP][782] ([i915#4538] / [i915#5286]) -> [SKIP][783] ([i915#14544] / [i915#4538] / [i915#5286])
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          [SKIP][784] ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][785] ([i915#17431] / [i915#3638])
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][786] ([i915#3828]) -> [SKIP][787] ([i915#14544] / [i915#3828])
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][788] ([i915#17431]) -> [SKIP][789] ([i915#17356]) +2 other tests skip
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][790] ([i915#17356] / [i915#5190]) -> [SKIP][791] ([i915#4538] / [i915#5190]) +7 other tests skip
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          [SKIP][792] ([i915#5190]) -> [SKIP][793] ([i915#17356] / [i915#5190]) +1 other test skip
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][794] ([i915#4538]) -> [SKIP][795] ([i915#14544] / [i915#4538])
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][796] ([i915#4538] / [i915#5190]) -> [SKIP][797] ([i915#17356] / [i915#5190]) +11 other tests skip
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          [SKIP][798] ([i915#14544] / [i915#4538]) -> [SKIP][799] ([i915#4538]) +1 other test skip
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][800] ([i915#14544] / [i915#6095]) -> [SKIP][801] ([i915#6095]) +1 other test skip
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2:          [SKIP][802] ([i915#10307] / [i915#6095]) -> [SKIP][803] ([i915#17356]) +7 other tests skip
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][804] ([i915#12313]) -> [SKIP][805] ([i915#17356]) +1 other test skip
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][806] ([i915#12313]) -> [SKIP][807] ([i915#12313] / [i915#14544])
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][808] ([i915#6095]) -> [SKIP][809] ([i915#14544] / [i915#6095]) +6 other tests skip
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][810] ([i915#14098] / [i915#6095]) -> [SKIP][811] ([i915#14098] / [i915#14544] / [i915#6095]) +9 other tests skip
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][812] ([i915#6095]) -> [SKIP][813] ([i915#17356])
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][814] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][815] ([i915#14098] / [i915#6095]) +6 other tests skip
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][816] ([i915#17356]) -> [SKIP][817] ([i915#12313])
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][818] ([i915#17356]) -> [SKIP][819] ([i915#10307] / [i915#6095]) +3 other tests skip
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          [SKIP][820] ([i915#17356]) -> [SKIP][821] ([i915#16017])
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-rkl:          [SKIP][822] ([i915#17427]) -> [SKIP][823] ([i915#14544] / [i915#17427])
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-2/igt@kms_chamelium_color@ctm-green-to-red.html
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-rkl:          [SKIP][824] ([i915#11151] / [i915#7828]) -> [SKIP][825] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-7/igt@kms_chamelium_edid@vga-edid-read.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-rkl:          [SKIP][826] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][827] ([i915#11151] / [i915#7828]) +4 other tests skip
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-single.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          [SKIP][828] ([i915#15865]) -> [SKIP][829] ([i915#17356])
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-4/igt@kms_content_protection@content-type-change.html
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          [SKIP][830] ([i915#15330] / [i915#3299]) -> [SKIP][831] ([i915#17356])
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg2:          [SKIP][832] ([i915#17356]) -> [SKIP][833] ([i915#15330])
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-dg2:          [SKIP][834] ([i915#15330]) -> [SKIP][835] ([i915#17356]) +1 other test skip
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          [SKIP][836] ([i915#14544] / [i915#15865]) -> [SKIP][837] ([i915#15865]) +1 other test skip
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_content_protection@legacy.html
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          [SKIP][838] ([i915#17356]) -> [SKIP][839] ([i915#15865])
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_content_protection@mei-interface.html
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2:          [SKIP][840] ([i915#17356]) -> [SKIP][841] ([i915#3555]) +1 other test skip
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          [SKIP][842] ([i915#13049] / [i915#14544]) -> [SKIP][843] ([i915#13049])
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          [SKIP][844] ([i915#13049]) -> [SKIP][845] ([i915#17356])
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          [SKIP][846] ([i915#3555]) -> [SKIP][847] ([i915#14544] / [i915#3555])
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          [SKIP][848] ([i915#17356]) -> [SKIP][849] ([i915#13049])
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2:          [SKIP][850] ([i915#17356]) -> [SKIP][851] ([i915#13046] / [i915#17454] / [i915#5354]) +3 other tests skip
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          [SKIP][852] ([i915#13046] / [i915#17454] / [i915#5354]) -> [SKIP][853] ([i915#17356]) +4 other tests skip
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          [SKIP][854] ([i915#17356]) -> [SKIP][855] ([i915#9067])
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          [SKIP][856] ([i915#14544] / [i915#9067]) -> [SKIP][857] ([i915#9067])
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          [SKIP][858] ([i915#4103]) -> [SKIP][859] ([i915#17356])
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][860] ([i915#14544] / [i915#9723]) -> [SKIP][861] ([i915#9723])
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [SKIP][862] ([i915#3555]) -> [SKIP][863] ([i915#17356]) +1 other test skip
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-dg2:          [SKIP][864] ([i915#17356]) -> [SKIP][865] ([i915#17287])
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2:          [SKIP][866] ([i915#17288]) -> [SKIP][867] ([i915#17356])
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-5/igt@kms_dp_link_training@non-uhbr-sst.html
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-dg2:          [SKIP][868] ([i915#17286]) -> [SKIP][869] ([i915#17356])
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-dg2:          [SKIP][870] ([i915#17356]) -> [SKIP][871] ([i915#17285])
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-rkl:          [SKIP][872] ([i915#14544] / [i915#17285]) -> [SKIP][873] ([i915#17285])
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-dg2:          [SKIP][874] ([i915#17356]) -> [SKIP][875] ([i915#16867])
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-rkl:          [SKIP][876] ([i915#14544] / [i915#16867]) -> [SKIP][877] ([i915#16867])
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-dg2:          [SKIP][878] ([i915#17356]) -> [SKIP][879] ([i915#16361])
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_dsc@dsc-basic-bigjoiner.html
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_dsc@dsc-basic-bigjoiner.html
    - shard-rkl:          [SKIP][880] ([i915#14544] / [i915#16361]) -> [SKIP][881] ([i915#16361])
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_dsc@dsc-basic-bigjoiner.html
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          [SKIP][882] ([i915#16361]) -> [SKIP][883] ([i915#17356]) +1 other test skip
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp.html
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-rkl:          [SKIP][884] ([i915#16361]) -> [SKIP][885] ([i915#14544] / [i915#16361])
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][886] ([i915#14544] / [i915#16680]) -> [SKIP][887] ([i915#16680])
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_fbcon_fbt@psr.html
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          [SKIP][888] ([i915#16081]) -> [SKIP][889] ([i915#14544] / [i915#16081])
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-2/igt@kms_feature_discovery@display-3x.html
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          [SKIP][890] ([i915#14544] / [i915#16081]) -> [SKIP][891] ([i915#16081])
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_feature_discovery@display-4x.html
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          [SKIP][892] ([i915#14544] / [i915#658]) -> [SKIP][893] ([i915#658])
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_feature_discovery@psr1.html
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-rkl:          [SKIP][894] ([i915#14544] / [i915#9934]) -> [SKIP][895] ([i915#9934]) +2 other tests skip
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-rkl:          [SKIP][896] ([i915#9934]) -> [SKIP][897] ([i915#14544] / [i915#9934]) +1 other test skip
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][898] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839]) -> [INCOMPLETE][899] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113])
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-glk4/igt@kms_flip@2x-flip-vs-suspend.html
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][900] ([i915#15643]) -> [SKIP][901] ([i915#14544] / [i915#15643])
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-rkl:          [SKIP][902] ([i915#14544] / [i915#15643]) -> [SKIP][903] ([i915#15643])
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][904] ([i915#17452]) -> [SKIP][905] ([i915#14544] / [i915#17452])
   [904]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-4/igt@kms_force_connector_basic@force-load-detect.html
   [905]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][906] ([i915#16708] / [i915#5354]) -> [SKIP][907] ([i915#15990] / [i915#8708]) +8 other tests skip
   [906]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [907]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][908] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][909] ([i915#17428] / [i915#1825]) +2 other tests skip
   [908]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [909]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-dg2:          [SKIP][910] ([i915#16708]) -> [SKIP][911] ([i915#15989]) +4 other tests skip
   [910]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite.html
   [911]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][912] ([i915#15990]) -> [SKIP][913] ([i915#16708]) +11 other tests skip
   [912]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [913]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][914] ([i915#17428] / [i915#1825]) -> [SKIP][915] ([i915#14544] / [i915#17428] / [i915#1825])
   [914]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [915]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][916] ([i915#15991] / [i915#5354]) -> [SKIP][917] ([i915#16708] / [i915#5354]) +23 other tests skip
   [916]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
   [917]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
    - shard-dg2:          [SKIP][918] ([i915#15990] / [i915#8708]) -> [SKIP][919] ([i915#16708] / [i915#5354]) +11 other tests skip
   [918]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html
   [919]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:
    - shard-dg2:          [SKIP][920] ([i915#15102]) -> [SKIP][921] ([i915#16708]) +15 other tests skip
   [920]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html
   [921]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-dg2:          [SKIP][922] ([i915#10055]) -> [SKIP][923] ([i915#16708])
   [922]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [923]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][924] ([i915#16708]) -> [SKIP][925] ([i915#15990]) +12 other tests skip
   [924]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [925]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][926] ([i915#15989]) -> [SKIP][927] ([i915#16708]) +10 other tests skip
   [926]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html
   [927]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][928] ([i915#16708]) -> [SKIP][929] ([i915#15991]) +20 other tests skip
   [928]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite.html
   [929]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          [SKIP][930] ([i915#15991]) -> [SKIP][931] ([i915#16708]) +25 other tests skip
   [930]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html
   [931]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][932] ([i915#15104] / [i915#15990]) -> [SKIP][933] ([i915#16708])
   [932]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [933]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          [SKIP][934] ([i915#16708] / [i915#5354]) -> [SKIP][935] ([i915#15102]) +9 other tests skip
   [934]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [935]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][936] ([i915#15102]) -> [SKIP][937] ([i915#16708] / [i915#5354]) +8 other tests skip
   [936]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [937]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          [SKIP][938] ([i915#16708] / [i915#5354]) -> [SKIP][939] ([i915#15991] / [i915#5354]) +13 other tests skip
   [938]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [939]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-rkl:          [SKIP][940] ([i915#14544] / [i915#15102]) -> [SKIP][941] ([i915#15102]) +12 other tests skip
   [940]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
   [941]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-rkl:          [SKIP][942] ([i915#15102]) -> [SKIP][943] ([i915#14544] / [i915#15102]) +6 other tests skip
   [942]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html
   [943]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg1:          [SKIP][944] ([i915#15102] / [i915#4423]) -> [SKIP][945] ([i915#15102])
   [944]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg1-18/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-blt.html
   [945]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-14/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][946] ([i915#14544] / [i915#17428]) -> [SKIP][947] ([i915#17428]) +30 other tests skip
   [946]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
   [947]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-rkl:          [SKIP][948] ([i915#17428]) -> [SKIP][949] ([i915#14544] / [i915#17428]) +14 other tests skip
   [948]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html
   [949]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-suspend:
    - shard-dg2:          [SKIP][950] ([i915#16708]) -> [SKIP][951] ([i915#15102]) +12 other tests skip
   [950]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-suspend.html
   [951]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][952] ([i915#12713] / [i915#16518]) -> [SKIP][953] ([i915#17356])
   [952]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-6/igt@kms_hdr@brightness-with-hdr.html
   [953]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][954] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][955] ([i915#17356])
   [954]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-3/igt@kms_hdr@static-toggle-suspend.html
   [955]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][956] ([i915#14544] / [i915#15458]) -> [SKIP][957] ([i915#15458])
   [956]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [957]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-rkl:          [SKIP][958] ([i915#14544] / [i915#15709]) -> [SKIP][959] ([i915#15709])
   [958]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html
   [959]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-rkl:          [SKIP][960] ([i915#15709]) -> [SKIP][961] ([i915#14544] / [i915#15709])
   [960]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [961]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          [SKIP][962] ([i915#3555] / [i915#8821]) -> [SKIP][963] ([i915#17356])
   [962]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html
   [963]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [SKIP][964] ([i915#6953] / [i915#9423]) -> [SKIP][965] ([i915#17356] / [i915#6953] / [i915#9423])
   [964]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html
   [965]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][966] ([i915#14544] / [i915#15329]) -> [SKIP][967] ([i915#15329]) +3 other tests skip
   [966]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
   [967]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          [SKIP][968] ([i915#3828]) -> [SKIP][969] ([i915#9340])
   [968]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html
   [969]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-rkl:          [SKIP][970] ([i915#14544] / [i915#17434] / [i915#17450]) -> [SKIP][971] ([i915#17434] / [i915#17450])
   [970]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_pm_rpm@pc8-residency.html
   [971]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [INCOMPLETE][972] ([i915#14419]) -> [SKIP][973] ([i915#9519])
   [972]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-6/igt@kms_pm_rpm@system-suspend-idle.html
   [973]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][974] ([i915#11520] / [i915#14544]) -> [SKIP][975] ([i915#11520]) +2 other tests skip
   [974]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [975]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-rkl:          [SKIP][976] ([i915#11520]) -> [SKIP][977] ([i915#11520] / [i915#14544])
   [976]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [977]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          [SKIP][978] ([i915#11520] / [i915#4423]) -> [SKIP][979] ([i915#11520])
   [978]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg1-17/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
   [979]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          [SKIP][980] ([i915#14544] / [i915#9683]) -> [SKIP][981] ([i915#9683])
   [980]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [981]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-rkl:          [SKIP][982] ([i915#1072] / [i915#9732]) -> [SKIP][983] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [982]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-2/igt@kms_psr@fbc-psr-primary-page-flip.html
   [983]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@pr-primary-mmap-cpu:
    - shard-rkl:          [SKIP][984] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][985] ([i915#1072] / [i915#9732]) +6 other tests skip
   [984]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_psr@pr-primary-mmap-cpu.html
   [985]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_psr@pr-primary-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-rkl:          [SKIP][986] ([i915#14544] / [i915#15949]) -> [SKIP][987] ([i915#15949])
   [986]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [987]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          [SKIP][988] ([i915#4235]) -> [SKIP][989] ([i915#17356])
   [988]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-8/igt@kms_rotation_crc@exhaust-fences.html
   [989]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          [SKIP][990] ([i915#17356] / [i915#5190]) -> [SKIP][991] ([i915#12755] / [i915#15867] / [i915#5190])
   [990]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [991]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          [SKIP][992] ([i915#12755] / [i915#15867]) -> [SKIP][993] ([i915#17356])
   [992]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90.html
   [993]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          [SKIP][994] ([i915#17356]) -> [SKIP][995] ([i915#8623])
   [994]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern.html
   [995]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          [SKIP][996] ([i915#14544] / [i915#9906]) -> [SKIP][997] ([i915#9906]) +1 other test skip
   [996]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html
   [997]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          [SKIP][998] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][999] ([i915#15243] / [i915#3555])
   [998]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@kms_vrr@flip-suspend.html
   [999]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [SKIP][1000] ([i915#17356]) -> [SKIP][1001] ([i915#3555] / [i915#9906])
   [1000]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_vrr@negative-basic.html
   [1001]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg2:          [SKIP][1002] ([i915#17356]) -> [SKIP][1003] ([i915#9906])
   [1002]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-drrs.html
   [1003]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          [SKIP][1004] ([i915#14544] / [i915#17447]) -> [SKIP][1005] ([i915#17447])
   [1004]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19410/shard-rkl-6/igt@tools_test@sysfs_l3_parity.html
   [1005]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#14995]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15454
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16789]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16870]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870
  [i915#16871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17037]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17037
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17133
  [i915#17146]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
  [i915#17209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17209
  [i915#17226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17226
  [i915#17247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17247
  [i915#17273]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17273
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17288]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291
  [i915#17293]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17293
  [i915#17356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
  [i915#17357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357
  [i915#17373]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17429]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17444]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444
  [i915#17445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
  [i915#17447]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17447
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
  [i915#17452]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452
  [i915#17453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17456]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463
  [i915#17465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17465
  [i915#17477]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477
  [i915#17478]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
  [i915#17479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
  [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
  [i915#17481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17481
  [i915#17482]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482
  [i915#17483]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483
  [i915#17484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484
  [i915#17485]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17485
  [i915#17486]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17486
  [i915#17487]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17487
  [i915#17488]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488
  [i915#17489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489
  [i915#17490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490
  [i915#17491]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491
  [i915#17492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492
  [i915#17493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493
  [i915#17494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17494
  [i915#17495]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17495
  [i915#17496]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496
  [i915#17497]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497
  [i915#17498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498
  [i915#17499]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499
  [i915#17500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500
  [i915#17501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17501
  [i915#17502]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502
  [i915#17503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
  [i915#17504]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504
  [i915#17505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17509]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17512]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512
  [i915#17515]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17515
  [i915#17516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17519
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17523]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529
  [i915#17530]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17530
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537
  [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17541]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17541
  [i915#17542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17542
  [i915#17543]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
  [i915#17553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17553
  [i915#17554]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554
  [i915#17555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555
  [i915#17557]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17557
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561
  [i915#17562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
  [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17570]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17570
  [i915#17571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17571
  [i915#17572]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17572
  [i915#17577]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17577
  [i915#17578]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17578
  [i915#17579]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17579
  [i915#17586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586
  [i915#17587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17587
  [i915#17588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588
  [i915#17590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17590
  [i915#17593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17593
  [i915#17594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17594
  [i915#17600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17600
  [i915#17666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17666
  [i915#17673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17673
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17699]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17699
  [i915#17700]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17700
  [i915#17702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17702
  [i915#17703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703
  [i915#17706]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17706
  [i915#17709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17709
  [i915#17711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17711
  [i915#17712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17712
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9170 -> IGTPW_16066
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_19410: 114156ff58b8db80a36355fd6a28725dc7e20584 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16066: 16066
  IGT_9170: 9170
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/index.html

--===============2113728525423130678==
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
<tr><td><b>Series:</b></td><td>EDITME: Update allocation flags for buffers =
in submit job</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/177068/">https://patchwork.freedesktop.org/series/177068/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16066/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16066/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19410_full -&gt; IGTPW_16066_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16066_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_16066_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/index=
.html</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1606=
6_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@perf_pmu@multi-client@bcs0:<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-8/igt@perf_pmu@multi-client@bcs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg=
2-4/igt@perf_pmu@multi-client@bcs0.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19410_full and IGTPW_16066=
_full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@perf_pmu@extended-pageflip-modeset-hang-oldfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@multi-wait-all-submitted-signaled:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@single-bo:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16066_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@api_intel_bb@crc32.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">=
i915#6230</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-14/igt@api_intel_bb@crc32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230"=
>i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@api_intel_bb@object-reloc-keep-ca=
che.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-ca=
che.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@api_intel_bb@object-reloc-keep-c=
ache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk6/igt@device_reset@cold-reset-bound.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17537">i915#17537</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11078">i915#11078</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@dma-buf-fence-chain:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@dmabuf@dma-buf-fence-chain.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17712">i915#17712</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@fbdev@unaligned-write.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/258=
2">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@gem_ccs@block-multicopy-inplace.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk9/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
99">i915#17499</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gem_ccs@large-ctrl-surf-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13008">i915#13008</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@gem_ccs@large-ctrl-surf-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@gem_ccs@suspend-resume.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@gem_create@create-ext-cpu-access=
-big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6335">i915#6335</a>)</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1606=
6/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15454">i915#=
15454</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@gem_create@create-ext-set-pat.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17530">i915#17530</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk9/igt@gem_ctx_isolation@preservation-s3@=
rcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>) +1 other test inc=
omplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3=
@vcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gem_ctx_param@set-priority-not-s=
upported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17444">i915#17444</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@gem_ctx_param@set-priority-not-s=
upported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17444">i915#17444</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-hos=
tile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk8/igt@gem_ctx_sseu@engines.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496=
">i915#17496</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@gem_ctx_sseu@engines.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280"=
>i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
80">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-balancer:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb5/igt@gem_exec_balancer@invalid-balancer=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17587">i915#17587</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-14/igt@gem_exec_balancer@invalid-bonds.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@gem_exec_balancer@noheartbeat.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@gem_exec_balancer@parallel.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gem_exec_balancer@parallel-bb-fir=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk9/igt@gem_exec_balancer@parallel-orderin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17547">i915#17547</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@gem_exec_capture@capture-invisibl=
e@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@gem_exec_capture@capture-invisib=
le@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gem_exec_capture@capture-recovera=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17711">i915#17711</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@gem_exec_capture@capture-recovera=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6344">i915#6344</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@gem_exec_capture@capture-recover=
able.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@gem_exec_capture@capture@vecs0-l=
mem0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16904">i915#16904</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk1/igt@gem_exec_endless@dispatch@bcs0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17571">i915#17571</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@gem_exec_fence@submit3.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@gem_exec_flush@basic-uc-ro-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@gem_exec_flush@basic-wb-prw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@gem_exec_params@rsvd2-dirt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17453">i915#17453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@gem_exec_params@secure-non-master=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17416">i915#17416</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@gem_exec_params@secure-non-master=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17416">i915#17416</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@gem_exec_params@secure-non-maste=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17416">i915#17416</a>) +2 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk9/igt@gem_exec_params@secure-non-master.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17523">i915#17523</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-active.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@gem_exec_reloc@basic-softpin.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gem_exec_reloc@basic-softpin.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@gem_exec_reloc@basic-wc-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-other-chain:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb4/igt@gem_exec_schedule@preempt-other-ch=
ain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17590">i915#17590</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@gem_exec_schedule@semaphore-powe=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4812">i915#4812</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-glk5/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk1=
/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13196">i915#13196</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13=
356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@gem_fence_thrash@bo-write-verify=
-threaded-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@gem_huc_copy@huc-copy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1745=
6">i915#17456</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@gem_lmem_swapping@heavy-random.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17503">i915#17503</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@gem_lmem_swapping@heavy-verify-mu=
lti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-m=
ulti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gem_lmem_swapping@massive.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-10/igt@gem_lmem_swapping@random-engine=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@gem_lmem_swapping@verify.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@gem_madvise@dontneed-before-pwrit=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk8/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543">i915#=
17543</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-cpu-read-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@gem_mmap_gtt@basic-write-cpu-rea=
d-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4077">i915#4077</a>) +7 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@gem_mmap_gtt@basic-write-cpu-read-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17572">i915#17572</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@gem_mmap_gtt@coherency.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
429">i915#17429</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@gem_mmap_wc@bad-object.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
83">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@gem_mmap_wc@write.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">=
i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-14/igt@gem_mmap_wc@write-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@gem_partial_pwrite_pread@writes-=
after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@gem_pxp@create-protected-buffer.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gem_pxp@protected-raw-src-copy-no=
t-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17521">i915#17521</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@gem_pxp@reject-modify-context-prot=
ection-off-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17521">i915#17521</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@gem_pxp@verify-pxp-stale-ctx-exe=
cution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@gem_readwrite@beyond-eob.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@gem_readwrite@new-obj.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-t=
iled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17492">i915#17492</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@gem_render_copy@y-tiled-to-vebox=
-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gem_render_copy@y-tiled-to-vebox-=
linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@gem_render_copy@yf-tiled-ccs-to-x=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@gem_render_copy@yf-tiled-to-vebox=
-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@gem_set_tiling_vs_gtt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
79">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@gem_softpin@evict-snoop.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
551">i915#17551</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@gem_softpin@evict-snoop-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4885">i915#4885</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@gem_softpin@evict-snoop-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@gem_tiled_blits@basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/407=
7">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@gem_tiled_pread_basic@basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gem_userptr_blits@coherency-sync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16871">i915#16871</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@gem_userptr_blits@coherency-unsy=
nc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@gem_userptr_blits@create-destroy-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@gem_userptr_blits@dmabuf-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@gem_userptr_blits@forbidden-oper=
ations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@gem_userptr_blits@map-fixed-inva=
lidate-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk6/igt@gem_userptr_blits@readonly-pwrite-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17507">i915#17507</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gem_userptr_blits@relocations.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gem_userptr_blits@sd-probe.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@gem_userptr_blits@unsync-unmap-a=
fter-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@gem_userptr_blits@unsync-unmap-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@gen3_render_linear_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7555">i915#17555</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@gen3_render_tiledy_blits.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17578">i915#17578</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@gen7_exec_parse@basic-allocation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17505">i915#17505</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@gen7_exec_parse@basic-rejected.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17455">i915#17455</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@gen7_exec_parse@basic-rejected.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17455">i915#17455</a>) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@gen7_exec_parse@basic-rejected.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17455">i915#17455</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@gen7_exec_parse@basic-rejected.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17455">i915#17455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@gen7_exec_parse@cmd-crossing-pag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-9/igt@gen9_exec_parse@bb-large.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@gen9_exec_parse@bb-oversize.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@gen9_exec_parse@bb-secure.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2527">i915#2527</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@gen9_exec_parse@bb-secure.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@gen9_exec_parse@bb-start-far.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@i915_drm_fdinfo@busy-check-all.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11527">i915#11527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-14/igt@i915_drm_fdinfo@most-busy-check-=
all@vcs1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@i915_drm_fdinfo@most-busy-idle-c=
heck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@i915_drm_fdinfo@virtual-busy-idl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@i915_drm_fdinfo@virtual-busy-idl=
e-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@i915_fb_tiling@basic-x-tiling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@i915_module_load@fault-injection.=
html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15342">i915#15342</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@i915_module_load@fault-injection=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15342">i915#15342</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@i915_module_load@fault-injection@=
__uc_init.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15481">i915#15481</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@i915_module_load@fault-injection@=
__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@i915_module_load@fault-injection=
@__uc_init.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@i915_module_load@fault-injection@=
intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abor=
t</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb4/igt@i915_module_load@fault-injection@i=
ntel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort=
</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@i915_module_load@fault-injection=
@intel_connector_register.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@i915_module_load@fault-injection@=
intel_connector_register.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_guc_ct_init:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb4/igt@i915_module_load@fault-injection@i=
ntel_guc_ct_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17600">i915#17600</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/s=
hard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk8/igt@i915_pm_freq_mult@media-freq.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17699">i915#17699</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17541">i915#17541</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/=
shard-dg2-8/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#129=
64</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence=
.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13790">i915#13790</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17706">i915#17706</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@i915_pm_rpm@gem-execbuf-stress-p=
c8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-2/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rk=
l-6/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@i915_pm_sseu@full-enable.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4387">i915#4387</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@i915_pm_sseu@full-enable.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@i915_power@sanity.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i=
915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@i915_query@query-topology-known-=
pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@i915_query@query-topology-unsupp=
orted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@i915_query@test-query-geometry-sub=
slices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17673">i915#17673</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-5/igt@i915_suspend@basic-s2idle-without-i915.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
066/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">=
i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-8/igt@i915_suspend@debugfs-reader.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-r=
kl-6/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@i915_suspend@fence-restore-tiled2u=
ntiled.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</=
li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-mtlp-2/igt@i915_suspend@forcewake.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-=
6/igt@i915_suspend@forcewake.html">TIMEOUT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17273">i915#17273</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@intel_hwmon@hwmon-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/116=
80">i915#11680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_addfb_basic@addfb25-x-tiled-=
legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_addfb_basic@basic-y-tiled-le=
gacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg1-15/igt@kms_async_flips@alternate-sync-async-flip-at=
omic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16066/shard-dg1-12/igt@kms_async_flips@alternate-sync-async-flip-a=
tomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_async_flips@alternate-sync-a=
sync-flip-atomic@pipe-c-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16066/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-resume.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12761">i915#12761</a>) +1 other test incomplete</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_async_flips@async-flip-suspend=
-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12761">i915#12761</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_async_flips@async-flip-suspend=
-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995=
">i915#14995</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb4/igt@kms_async_flips@async-flip-with-pa=
ge-flip-events-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_async_flips@async-flip-with-pa=
ge-flip-events-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_atomic@plane-primary-overlay-m=
utable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17485">i915#17485</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_big_fb@4-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17478">i915#17478</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_big_fb@4-tiled-addfb-size-off=
set-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17557">i915#17557</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-strid=
e-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +7=
 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +7 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-0-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16066/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp=
-rotate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17478">i915#17478</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_big_fb@linear-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_big_fb@linear-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_big_fb@linear-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_big_fb@linear-max-hw-stride-6=
4bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_big_fb@linear-max-hw-stride-6=
4bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_big_fb@x-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066=
/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17=
356</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb7/igt@kms_big_fb@x-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_big_fb@y-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17500">i915#17500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17500">i915#17500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17432">i915#17432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4538">i915#4538</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +7 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4538">i915#4538</a>) +8 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb1/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17478">i915#17478</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_ccs@bad-pixel-format-y-tiled-g=
en12-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +121 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +176 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_ccs@ccs-on-another-bo-4-tiled-=
mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +=
43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled=
-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled=
-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb6/igt@kms_ccs@crc-primary-basic-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17594">i915#17594</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_ccs@crc-primary-basic-4-tiled=
-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_ccs@crc-primary-basic-y-tiled=
-gen12-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_ccs@crc-primary-basic-y-tiled=
-gen12-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>=
) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_ccs@crc-primary-basic-y-tiled=
-gen12-rc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+93 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-til=
ed-dg2-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +59 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-til=
ed-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-c=
cs@pipe-d-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs@pipe-d-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) +1 other test fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +24 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-=
1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +119 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-=
1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10=
434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_ccs@random-ccs-data-4-tiled-bm=
g-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17525">i915#17525</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-mc-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +69 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_cdclk@mode-transition.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17550">i915#17550</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_cdclk@mode-transition.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-=
hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13781">i915#13781</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_chamelium_audio@hdmi-audio.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17483">i915#17483</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_chamelium_audio@hdmi-audio-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_chamelium_color@ctm-0-50.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_chamelium_color@ctm-0-75.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_chamelium_color@ctm-green-to-=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_chamelium_color@ctm-green-to=
-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_chamelium_color@ctm-limited-=
range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_chamelium_color@ctm-max.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_chamelium_color@gamma.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17489">i915#17489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-10/igt@kms_chamelium_color_pipeline@pl=
ane-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</=
p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lu=
t1d:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_chamelium_color_pipeline@plan=
e-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</=
li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16464">i915#16464</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17=
427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_chamelium_edid@dp-mode-timing=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_chamelium_frames@hdmi-aspect=
-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_chamelium_frames@hdmi-crc-fa=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_chamelium_frames@hdmi-crc-non=
planar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-storm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_chamelium_hpd@dp-hpd-with-ena=
bled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17483">i915#17483</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-after=
-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_chamelium_hpd@hdmi-hpd-with-en=
abled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17483">i915#17483</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-for-ea=
ch-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-withou=
t-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-a-background-color:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_color@background-color@pipe-a-=
background-color.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17133">i915#17133</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-5/igt@kms_color@ctm-green-to-red.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg=
2-7/igt@kms_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#173=
73</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/126=
55">i915#12655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb=
-bt2020-lim-lut1d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-=
matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15529">i915#15529</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_color_pipeline@plane-lut1d-ctm=
3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17510">i915#17510</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_color_pipeline@plane-lut1d-c=
tm3x4@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_color_pipeline@plane-lut1d-lu=
t1d@pipe-a-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16990">i915#16990</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_color_pipeline@plane-lut1d-l=
ut1d@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@kms_color_pipeline@plane-lut1d-po=
st-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-p=
ost-ctm3x4@pipe-d-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +47 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_content_protection@atomic-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17508">i915#17508</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_content_protection@atomic-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@kms_content_protection@atomic-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</l=
i>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_content_protection@dp-mst-lic=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17502">i915#17502</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_content_protection@dp-mst-ty=
pe-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_content_protection@legacy-hdc=
p14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_content_protection@lic-type-0=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_content_protection@mei-interf=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_content_protection@type1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17356">i915#17356</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb5/igt@kms_cursor_crc@cursor-offscreen-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-12=
8x42.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
066/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i=
915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_cursor_crc@cursor-random-32x3=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_cursor_crc@cursor-random-512x=
170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-move=
ment-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17533">i915#17533</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_cursor_crc@cursor-rapid-movem=
ent-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17504">i915#17504</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-12=
8x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk1/igt@kms_cursor_crc@cursor-sliding-max-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17504">i915#17504</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_cursor_crc@cursor-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_cursor_crc@cursor-suspend@pipe=
-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#141=
52</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend@pip=
e-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>) +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@kms_cursor_legacy@2x-flip-vs-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 othe=
r test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +2 other tests sk=
ip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_cursor_legacy@cursora-vs-fli=
pb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17515">i915#17515</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17515">i915#17515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17487">i915#17487</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17486">i915#17486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_dp_link_training@non-uhbr-mst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17519">i915#17519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_dp_link_training@non-uhbr-ms=
t-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17291">i915#17291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-ss=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst=
-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17293">i915#17293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_dp_link_training@uhbr-mst-dir=
ect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst-di=
rect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@kms_dp_link_training@uhbr-mst-tb=
talt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_dp_link_training@uhbr-sst-dire=
ct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_dp_link_training@uhbr-sst-tbt=
alt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17477">i915#17477</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_dp_link_training@uhbr-sst-tb=
talt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16867">i915#16867</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16870">i915#16870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_dsc@dsc-basic-ultrajoiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16361">i915#16361</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_dsc@dsc-basic-ultrajoiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16361">i915#16361</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk9/igt@kms_dsc@dsc-fractional-bpp-ultrajo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17458">i915#17458</a>) +9 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_dsc@dsc-fractional-bpp-ultraj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_dsc@dsc-with-bpc-bigjoiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16361">i915#16361</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-bigjoiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-ultrajoiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-u=
ltrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16680">i915#16680</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk9/igt@kms_fbcon_fbt@psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17516">i915#17516</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-6/igt@kms_feature_discovery@display-1x.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/sh=
ard-dg2-7/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738">i915#9738</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_feature_discovery@display-2x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_feature_discovery@display-3x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16081">i915#16081</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_feature_discovery@display-4x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17666">i915#17666</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_feature_discovery@display-4x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_feature_discovery@dp-mst.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17570">i915#17570</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16599">i915#16599</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_feature_discovery@dsc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17539">i915#17539</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_feature_discovery@dsc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_feature_discovery@hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_flip@2x-flip-vs-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_flip@2x-modeset-vs-vblank-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_flip@2x-plain-flip.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/99=
34">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_flip@flip-vs-fences-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_flip@flip-vs-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_flip@flip-vs-suspend-interrup=
tible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i=
915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_flip@flip-vs-suspend-interrup=
tible@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#1=
7183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_flip@flip-vs-suspend@a-hdmi-a=
1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-8/igt@kms_flip@modeset-vs-vblank-race.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/sha=
rd-dg2-7/igt@kms_flip@modeset-vs-vblank-race.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb1/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17593">i915#17593</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests=
 skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 othe=
r tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bp=
p-linear-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64b=
pp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_force_connector_basic@force-lo=
ad-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17465">i915#17465</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_force_connector_basic@force-l=
oad-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17452">i915#17452</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@kms_force_connector_basic@force-=
load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-=
indfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-pr=
imscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +96 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb5=
65-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-susp=
end.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/10056">i915#10056</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_frontbuffer_tracking@fbc-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10056">i915#10056</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_frontbuffer_tracking@fbc-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17559">i915#17559</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-=
1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-1p=
-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +59 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +18 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_frontbuffer_tracking@fbchdr-=
1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +27 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pr=
i-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_frontbuffer_tracking@fbch=
dr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-s=
hrfb-plflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-2=
p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +15 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-=
indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15989">i915#15989</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-ti=
ling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17559">i915#17559</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +10 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17588">i915#17588</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +51 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb565-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +65 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +27 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +30 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +47 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +42 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +60 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_frontbuffer_tracking@hdr-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_frontbuffer_tracking@hdr-2p-=
scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a=
>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb5/igt@kms_frontbuffer_tracking@hdr-2p-sc=
ndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_frontbuffer_tracking@hdr-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16056">i915#16056</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_frontbuffer_tracking@psr-1p-pr=
i-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17482">i915#17482</a>) +153 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +30 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>=
) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +10 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825=
">i915#1825</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_frontbuffer_tracking@psr-rgb5=
65-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17482">i915#17482</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +18 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-14/igt@kms_frontbuffer_tracking@psrhdr-=
1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +20 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-=
2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +102 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb1/igt@kms_frontbuffer_tracking@psrhdr-2p=
-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-6/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1606=
6/shard-dg2-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357">i915#=
17357</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_hdmi_audio_bw@audio-bw-hblank1=
60.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17102">i915#17102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-4/igt@kms_hdmi_audio_bw@suspend-disk-a=
udio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17101">i915#17101</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188">i915#17188</a>=
)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_hdmi_audio_bw@suspend-disk-au=
dio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17101">i915#17101</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_hdr@bpc-switch.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518"=
>i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_hdr@static-swap.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498"=
>i915#17498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17498">i915#17498</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rk=
l-8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-3/igt@kms_invalid_mode@bad-vsync-end.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shar=
d-dg2-7/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i9=
15#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_joiner@basic-big-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17512">i915#17512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15458">i915#15458</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_joiner@invalid-modeset-force-=
ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17567">i915#17567</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15458">i915#15458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_mst@mst-suspend-read-crc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17579">i915#17579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_panel_fitting@atomic-fastset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17577">i915#17577</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6301">i915#6301</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_panel_fitting@legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-7/igt@kms_pipe_b_c_ivb@enable-pipe-c-w=
hile-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17455">i915#17455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_pipe_b_c_ivb@pipe-b-double-mo=
deset-then-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-=
modeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-5/igt@kms_pipe_crc_basic@read-crc-frame-sequence.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16066/shard-dg2-7/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@kms_pipe_crc_basic@suspend-read-=
crc.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17146">i915#17146</a>) +1 other test abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-cr=
c.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915=
#13476</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16789">i915#16789</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-cr=
c@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915=
#13409</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16789">i915#16789</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-=
4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_pipe_stress@stress-xrgb8888-u=
ntiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_pipe_stress@stress-xrgb8888-xt=
iled.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-7/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk1/igt@kms_plane@pixel-format-4-tiled-bmg=
-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17479">i915#17479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-d=
g2-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_plane@pixel-format-4-tiled-dg=
2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-=
modifier-source-clamping.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane@pixel-format-4=
-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) =
+4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mt=
l-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_plane@pixel-format-x-tiled-mo=
difier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane@pixel-format-y-tiled-cc=
s-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_plane@pixel-format-y-tiled-ccs=
-modifier@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_plane@pixel-format-y-tiled-m=
odifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_plane@pixel-format-y-tiled-m=
odifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_plane@pixel-format-yf-tiled-=
modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_plane@planar-pixel-format-sett=
ings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17700">i915#17700</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_plane@planar-pixel-format-se=
ttings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-6/igt@kms_plane@planar-pixel-format-se=
ttings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16066/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend=
@pipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13026">i915#13026</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_plane_lowres@tiling-4.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17509">i915#17509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@kms_plane_multiple@2x-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk9/igt@kms_plane_multiple@2x-tiling-4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17586">i915#17586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_plane_multiple@2x-tiling-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_plane_multiple@tiling-4.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17542">i915#17542</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-3/igt@kms_plane_scaling@invalid-parameters.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1606=
6/shard-dg2-7/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#=
17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@plane-downscale=
-factor-0-5-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i91=
5#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@plane-downscale=
-factor-0-5-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@plane-downscale=
-factor-0-5-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_plane_scaling@plane-scaler-u=
nity-scaling-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@plane-sc=
aler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i9=
15#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-d.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@p=
lane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915=
#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-2=
0x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb7/igt@kms_plane_scaling@planes-downscale=
-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pi=
pe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb7/igt@kms_plane_scaling@planes-downscale=
-factor-0-5-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pi=
pe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-7=
5-upscale-20x20.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@planes-downscal=
e-factor-0-75-upscale-20x20.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i=
915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#1=
7356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9423">i915#9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@pla=
nes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#153=
29</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_pm_backlight@basic-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17462">i915#17462</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17462">i915#17462</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-9/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9812">i915#9812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">i=
915#17564</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk6/igt@kms_pm_dc@dc5-psr-suspend-resume.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17495">i915#17495</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@kms_pm_dc@dc5-psr-suspend-resume.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16914">i915#16914</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_pm_dc@dc5-psr-suspend-resume=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3828">i915#3828</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_pm_dc@dc5-retention-flops.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17553">i915#17553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_pm_dc@dc9-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703"=
>i915#17703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1770=
2">i915#17702</a>)</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-5/ig=
t@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_pm_rpm@fences.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">=
i915#4077</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/=
shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) +2 other tests skip</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg1-17/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066=
/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15=
073</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15073">i915#15073</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_pm_rpm@modeset-pc8-residency-s=
tress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17709">i915#17709</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_pm_rpm@modeset-pc8-residency-=
stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@kms_pm_rpm@pc8-residency.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_prime@basic-crc-vgem.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_properties@colorop-properties=
-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_properties@colorop-properties-=
legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-5/igt@kms_properties@crtc-properties-legacy.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
66/shard-dg2-7/igt@kms_properties@crtc-properties-legacy.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521">i91=
5#11521</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb6/igt@kms_psr2_sf@fbc-pr-overlay-plane-u=
pdate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-primary-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@kms_psr2_sf@pr-cursor-plane-move=
-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_psr2_sf@psr2-cursor-plane-mov=
e-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-mo=
ve-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-u=
pdate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk3/igt@kms_psr2_sf@psr2-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_psr2_su@page_flip-p010.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-7/igt@kms_psr@fbc-pr-sprite-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_psr@fbc-psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_psr@fbc-psr-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_psr@fbc-psr2-primary-mmap-cp=
u.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9688">i915#9688</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-7/igt@kms_psr@fbc-psr2-primary-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_psr@fbc-psr2-sprite-mmap-cpu.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17480">i915#17480</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_psr@pr-sprite-mmap-gtt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17480">i915#17480</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_psr@psr-cursor-plane-onoff.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_psr@psr-no-drrs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480"=
>i915#17480</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_psr@psr-primary-mmap-gtt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17480">i915#17480</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-mtlp-8/igt@kms_psr@psr-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/i=
gt@kms_psr@psr-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17226">i915#17226</a>) +1 other test fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk5/igt@kms_psr_stress_test@invalidate-pri=
mary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_rotation_crc@multiplane-rotat=
ion.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15492">i915#15492</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-3/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_rotation_crc@primary-rotation=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-snb1/igt@kms_rotation_crc@primary-x-tiled-r=
eflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk9/igt@kms_rotation_crc@primary-y-tiled-r=
eflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17488">i915#17488</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test s=
kip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_scaling_modes@scaling-mode-cen=
ter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17501">i915#17501</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_scaling_modes@scaling-mode-ce=
nter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_setmode@invalid-clone-exclusi=
ve-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17463">i915#17463</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-5/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8809">i915#8809</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/8823">i915#8823</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_tiled_display@basic-test-patt=
ern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-mtlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16066/shard-mtlp-7/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-mtlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe=
-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16066/shard-mtlp-7/igt@kms_vblank@ts-continuation-dpms-suspend=
@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17209">i915#17209</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@kms_vrr@flip-basic-fastset.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17520">i915#17520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@kms_vrr@flip-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_vrr@flipline.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i=
915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_vrr@lobf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561">i915#=
17561</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_vrr@lobf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#=
11920</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-19/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_vrr@max-min.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i91=
5#9906</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_vrr@max-min.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9906">i915#9906</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-5/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i9=
15#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8808">i915#8808</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_vrr@seamless-rr-switch-vrr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17520">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx=
-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@perf@mi-rpc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2=
434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-3/igt@perf_pmu@event-wait@rcs0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17416">i915#17416</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@perf_pmu@most-busy-idle-check-all.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/s=
hard-rkl-3/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@multi-client:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-8/igt@perf_pmu@multi-client.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/i=
gt@perf_pmu@multi-client.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@multi-client@rcs0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-8/igt@perf_pmu@multi-client@rcs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg=
2-4/igt@perf_pmu@multi-client@rcs0.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-12/igt@perf_pmu@rc6-all-gts.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/851=
6">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-glk2/igt@prime_udl@share-import-addfb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16420">i915#16420</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@prime_udl@share-import-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-16/igt@prime_vgem@basic-gtt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/370=
8">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@prime_vgem@basic-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg1-18/igt@prime_vgem@basic-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-1/igt@prime_vgem@coherency-gtt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17429">i915#17429</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17448">i915#17448</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-tglu-8/igt@tools_test@sysfs_l3_parity.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17447">i915#17447</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@fbdev@read.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-=
3/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i=
915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16348">i915#16348</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@gem_ccs@suspend-resume.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3@vcs1.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17176">i915#17176</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16066/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3@vcs=
1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-mtlp-3/igt@gem_pxp@verify-pxp-execution-after-suspend-r=
esume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17247">i915#17247</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-4/igt@gem_pxp@verify-pxp-e=
xecution-after-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-glk9/igt@gem_workarounds@suspend-resume-context.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16066/shard-glk5/igt@gem_workarounds@suspend-resume-cont=
ext.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-glk9/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356"=
>i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk2/igt@i915_suspend@sysfs=
-reader.html">PASS</a></li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817"=
>i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16066/shard-rkl-4/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-mtlp-5/igt@kms_async_flips@async-flip-suspend-resume.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17037">i915#17037</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_async_flips@async-flip-s=
uspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-mtlp-5/igt@kms_async_flips@async-flip-suspend-resume@pi=
pe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17150">i915#17150</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16066/shard-mtlp-2/igt@kms_async_flips@async=
-flip-suspend-resume@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_color@ctm-negative.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12=
655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17373">i915#17373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_color@ctm-negative.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb=
-bt2020-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15529">i915#15529</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html">PASS</a> +2 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-=
hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16066/shard-tglu-2/igt@kms_cursor_crc@cursor-r=
andom-128x42@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_flip@dpms-off-confusion-interruptible.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_flip@dpms-off-confusion-interrupti=
ble.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-snb4/igt@kms_flip@plain-flip-ts-check-interruptible.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/10826">i915#10826</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16066/shard-snb7/igt@kms_flip@plain-flip-ts-check-interrup=
tible.html">PASS</a> +1 other test pass</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-2/igt@kms_flip@plain-flip-ts-check-interruptible.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14600">i915#14600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16066/shard-rkl-1/igt@kms_flip@plain-flip-ts-check-interr=
uptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bp=
p-linear-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@km=
s_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a=
> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_frontbuffe=
r_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-=
shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@k=
ms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a=
> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-glk10:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-c=
ur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk10/igt@kms_frontbuffer_tr=
acking@fbchdr-1p-primscrn-cur-indfb-onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-1/igt@kms_frontbu=
ffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> +8 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-glk11:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-flip=
track-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk11/igt@kms_frontbuffer_tr=
acking@fbchdr-1p-shrfb-fliptrack-mmap-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-glk4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk8/igt@kms_frontbuffer_t=
racking@hdr-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a> +6 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_invalid_mode@clock-too-high.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746=
">i915#16746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16066/shard-dg2-3/igt@kms_invalid_mode@clock-too-high.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@overflow-vrefresh:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_invalid_mode@overflow-vrefresh.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
746">i915#16746</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16066/shard-dg2-6/igt@kms_invalid_mode@overflow-vrefresh.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequ=
ence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_pipe_crc=
_basic@nonblocking-crc-frame-sequence.html">PASS</a> +2 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-mod=
ifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_plane@pix=
el-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">PASS</a> +1 oth=
er test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6953">i915#6953</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16066/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-mo=
difiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4=
/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a> +1=
 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-mo=
difiers@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@km=
s_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html">PASS</a> +2=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">=
i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16066/shard-dg2-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-=
factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_plane_s=
caling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">PASS</a> +8 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16066/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-1/igt@kms_pm_rpm@system-suspend-modeset.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
132">i915#15132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16066/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_vblank@wait-idle-hang.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915=
#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16066/shard-dg2-3/igt@kms_vblank@wait-idle-hang.html">PASS</a> +27 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-mtlp-2/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349=
">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16066/shard-mtlp-4/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@gem_basic@multigpu-create-close.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/7697">i915#7697</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
176">i915#17176</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16066/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17146">i915#17146</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-5/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/=
shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#28=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-noreloc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@gem_exec_reloc@basic-wc-rea=
d-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16066/shard-rkl-3/igt@gem_lmem_swapping@verify.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">=
i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-5/igt@gem_pread@display.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/sha=
rd-rkl-6/igt@gem_pread@display.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)=
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@gem_pread@snoop.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"=
>i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16066/shard-rkl-3/igt@gem_pread@snoop.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">=
i915#13717</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@gem_userptr=
_blits@forbidden-operations.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17455">i915#17455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16066/shard-rkl-7/igt@gen3_render_tiledx_blits.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1745=
5">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16066/shard-rkl-8/igt@gen9_exec_parse@bb-oversize.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4387">i915#4387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16066/shard-rkl-4/igt@i915_pm_sseu@full-enable.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">=
i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-7/igt@i915_query@test-query-geometry-subslices.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5723">i915#5723</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16066/shard-rkl-6/igt@i915_query@test-query-geometry-subslice=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/7707">i915#7707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16066/shard-rkl-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915=
#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-r=
kl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-interna=
l-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
56">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16066/shard-dg2-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
431">i915#17431</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@km=
s_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i=
915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_big_fb@4-til=
ed-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5=
286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_big_fb@lin=
ear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_big_fb@linear-max-hw-=
stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
431">i915#17431</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16066/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
56">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5190">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offs=
et-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16066/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_big_fb@yf-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_big_fb@yf-tiled-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc=
@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@km=
s_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i=
915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_ccs@ccs-on-an=
other-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-ln=
l-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-=
rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_ccs@crc-=
primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-=
rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/=
igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-cc=
s-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-=
tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_ccs=
@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-r=
c-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@kms_ccs@crc-sprite-plane=
s-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16066/shard-dg2-6/igt@kms_cdclk@mode-transition-all-outputs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16017">i915#16017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-2/igt@kms_chamelium_color@ctm-green-to-red.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17427">i915#17427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16066/shard-rkl-6/igt@kms_chamelium_color@ctm-green-to-red.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-7/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1115=
1">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_chamelium_edid@vga-edid-rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-single.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_chameli=
um_frames@hdmi-crc-single.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-4/igt@kms_content_protection@content-type-change.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_content_protection@content-type=
-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3299">i915#3299</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_content_protection@=
dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_content_protection@dp-mst-type=
-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0-suspend-=
resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_content_protection@dp-=
mst-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_content_protection@legacy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16066/shard-dg2-3/igt@kms_content_protection@mei-interface.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16066/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-32x10.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_cursor_crc@cursor-=
offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x512.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-=
32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x170.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16066/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-512x170.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tra=
nsitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_cursor_=
legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915=
#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17454">i915#17454</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotsp=
ot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_cursor_legacy@modeset-atom=
ic-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotsp=
ot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9067">i915#9067</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_cursor_legac=
y@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_cursor_legacy@short-b=
usy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9723">i915#9723</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16066/shard-dg2-7/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst-direct-trai=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-m=
st-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-5/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/172=
88">i915#17288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16066/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-sst-direct-trai=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17286">i915#17286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-s=
st-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_dp_link_training@uhbr-mst-tbtal=
t-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17285">i915#17285</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_dp_link_trainin=
g@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallbac=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_dp_linktrain_fallback@uhbr-=
to-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallbac=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16867">i915#16867</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_dp_linktrai=
n_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i9=
15#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16066/shard-dg2-1/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16=
361</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_dsc@dsc-basic-bigjoiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i91=
5#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16066/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16066/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/166=
80">i915#16680</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16066/shard-rkl-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-2/igt@kms_feature_discovery@display-3x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1608=
1">i915#16081</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16066/shard-rkl-6/igt@kms_feature_discovery@display-3x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_feature_discovery@display-4x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16081">i915#16081</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_feature_discovery@psr1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658"=
>i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16066/shard-rkl-4/igt@kms_flip@2x-blocking-wf_vblank.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"=
>i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16066/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-glk4/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1274=
5">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-glk1/igt@=
kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17183">i915#17183</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4839">i915#4839</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp=
-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_flip_scaled_=
crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643=
">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp=
-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-4/ig=
t@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-4/igt@kms_force_connector_basic@force-load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17452">i915#17452</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_force_connector_basic@force-lo=
ad-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-4/igt@=
kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/159=
90">i915#15990</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8708">i915#8708</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066=
/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mm=
ap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-=
pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_frontbu=
ffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915=
#15989</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-s=
pr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbu=
ffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915=
#16708</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-p=
ri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-c=
ur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#1=
6708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/5354">i915#5354</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-=
mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontb=
uffer_tracking@fbcpsr-farfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i=
915#5354</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-=
draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tra=
cking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +15 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/10055">i915#10055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@kms_frontbuffe=
r_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-=
indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer=
_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</=
a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-=
indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-8/igt@kms_frontbuffer=
_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</=
a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_=
tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>=
) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri=
-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/=
igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-6/igt@k=
ms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102=
">i915#15102</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_frontbuffer_tracki=
ng@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-1/igt@k=
ms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991=
">i915#15991</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5354">i915#5354</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_frontbuffe=
r_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +12 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-=
pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_frontbu=
ffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15102">i915#15102</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg1-18/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-=
cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-14/igt=
@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/151=
02">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-c=
ur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@km=
s_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i91=
5#17428</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_frontbuffer=
_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
28">i915#17428</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16066/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15102">i915#15102</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i9=
15#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16518">i915#16518</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-3/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">=
i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_hdr@static-toggl=
e-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_joiner@invalid-mod=
eset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_plane@pixel-format=
-4-tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs=
-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8821">i915#8821</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-size.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9423">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-=
with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-1/=
igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066=
/shard-dg1-19/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17450">i915#17450</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_pm_rpm@pc8-reside=
ncy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-6/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14419">i915#14419</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16066/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/95=
19">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-con=
tinuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_ps=
r2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#115=
20</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg1-17/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-a=
rea-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg1-17/igt@kms_psr=
2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9683">i915#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_psr2_su@frontbuffer-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-2/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/107=
2">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16066/shard-rkl-6/igt@kms_psr@fbc-psr-primary-page-fli=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_psr@pr-primary-mmap-cpu.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i91=
5#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-8/igt@kms_psr@pr-primary-mma=
p-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-2/igt@kms_psr_st=
ress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-8/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235"=
>i915#4235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16066/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i=
915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-5/igt@kms_rotation_crc=
@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/519=
0">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15867">i915#15867</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16066/shard-dg2-7/igt@kms_rotation_crc@sprite-ro=
tation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16066/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16066/shard-rkl-3/igt@kms_vrr@flip-basic-fastset.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/99=
06">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16066/shard-rkl-5/igt@kms_vrr@flip-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_vrr@negative-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17=
356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
066/shard-dg2-4/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915=
#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356=
">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16066/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">=
i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19410/shard-rkl-6/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17447">i915#17447</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16066/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17447">i915#17447</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9170 -&gt; IGTPW_16066</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19410: 114156ff58b8db80a36355fd6a28725dc7e20584 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_16066: 16066<br />
  IGT_9170: 9170<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2113728525423130678==--
