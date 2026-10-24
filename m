Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079BB606A31A
	for <igt-dev@archiver.kernel.org>; Sat, 24 Oct 2026 08:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9817310E7AA;
	Sat, 24 Oct 2026 08:28:46 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089C410E7AA;
 Sat, 24 Oct 2026 08:27:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8703642399000303564=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Ignore_AER_error_and_rec?=
 =?utf-8?q?overy_messages_in_dmesg_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 24 Oct 2026 08:27:57 -0000
Message-ID: <179283047700.64852.12201491572192428409@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261023171326.982997-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20261023171326.982997-1-ravi.kishore.koppuravuri@intel.com>
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

--===============8703642399000303564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Ignore AER error and recovery messages in dmesg (rev2)
URL   : https://patchwork.freedesktop.org/series/176295/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9162_full -> IGTPW_16043_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16043_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16043_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16043_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-128:
    - shard-rkl:          [PASS][1] -> [FAIL][2] +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-128.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-128.html

  
Known issues
------------

  Here are the changes found in IGTPW_16043_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8411])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][4] ([i915#11814])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@pan:
    - shard-dg2:          [PASS][5] -> [SKIP][6] ([i915#2582]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@fbdev@pan.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@fbdev@pan.html

  * igt@gem_busy@semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#3936])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@gem_ccs@block-copy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#14544] / [i915#3555] / [i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][12] ([i915#13008])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu-1:       NOTRUN -> [SKIP][13] ([i915#7697])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#7697])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#6335]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-mtlp:         [PASS][16] -> [FAIL][17] ([i915#17176])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3@vcs1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#8555]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@gem_ctx_persistence@hang.html
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8555])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@gem_ctx_persistence@hang.html
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8555])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][21] ([i915#1099]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#5882]) +6 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html

  * igt@gem_ctx_sseu@engines:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [PASS][24] -> [ABORT][25] ([i915#15131])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@gem_eio@in-flight-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-1/igt@gem_eio@in-flight-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][26] ([i915#13356] / [i915#13390])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][27] ([i915#13363])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@gem_eio@kms.html
    - shard-tglu:         [PASS][28] -> [DMESG-WARN][29] ([i915#13363])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-tglu-3/igt@gem_eio@kms.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress@blt:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#15314])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@gem_eio@unwedge-stress@blt.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4771])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4812]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4771])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][34] ([i915#4525])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#4525]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_big@single:
    - shard-rkl:          [PASS][36] -> [FAIL][37] ([i915#16604])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@gem_exec_big@single.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture:
    - shard-mtlp:         NOTRUN -> [FAIL][38] ([i915#16904]) +1 other test fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][39] ([i915#16904]) +4 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@gem_exec_capture@capture@vecs0-lmem0.html
    - shard-dg1:          NOTRUN -> [FAIL][40] ([i915#16904]) +2 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#3539])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#17416])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#14544] / [i915#3281])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_exec_reloc@basic-cpu.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#3281]) +9 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#3281]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@gem_exec_reloc@basic-range-active:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3281]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@gem_exec_reloc@basic-range-active.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3281]) +8 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4537] / [i915#4812]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4860])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4860])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-glk:          NOTRUN -> [SKIP][54] ([i915#4613]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk8/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#4613] / [i915#7582])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#4613] / [i915#7582])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4613]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#4613]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#14544] / [i915#4613])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html
    - shard-tglu-1:       NOTRUN -> [SKIP][60] ([i915#4613])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#4613]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#14544] / [i915#3282]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_mmap@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4083]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [PASS][64] -> [INCOMPLETE][65] ([i915#16108] / [i915#16202]) +1 other test incomplete
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_mmap_offset@clear-via-pagefault@lmem0:
    - shard-dg2:          [PASS][66] -> [FAIL][67] ([i915#17374]) +2 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@gem_mmap_offset@clear-via-pagefault@lmem0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@gem_mmap_offset@clear-via-pagefault@lmem0.html

  * igt@gem_mmap_wc@invalid-flags:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4083]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@gem_mmap_wc@invalid-flags.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4083]) +8 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3282]) +6 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#3282]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3282]) +9 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-random:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3282]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4270]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4270]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#8428]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#5190] / [i915#8428]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@gem_render_copy@yf-tiled-ccs-to-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#8411])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4079]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#4885])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#15657])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_tiled_pread_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4079])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4077]) +13 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu-1:       NOTRUN -> [SKIP][84] ([i915#17433] / [i915#3297])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#3297] / [i915#3323])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][86] ([i915#3323])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#14544] / [i915#3297] / [i915#3323])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#3297]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3281] / [i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3297] / [i915#4958])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#3297]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          [PASS][93] -> [INCOMPLETE][94] ([i915#13356])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@gem_workarounds@suspend-resume.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][95] ([i915#13356])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][96] ([i915#13356] / [i915#14586])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk11/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen3_render_mixed_blits:
    - shard-tglu-1:       NOTRUN -> [SKIP][97]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gen3_render_mixed_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-dg2:          NOTRUN -> [SKIP][98] +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@gen7_exec_parse@basic-offset.html
    - shard-dg1:          NOTRUN -> [SKIP][99] +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#14544]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#2856]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@gen9_exec_parse@batch-without-end.html
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#2527]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#2527]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#2527] / [i915#2856]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-5/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#2856]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@gen9_exec_parse@unaligned-jump.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglu-1:       NOTRUN -> [SKIP][106] ([i915#2527] / [i915#2856]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#15678])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@gpu_buddy@gpu_buddy.html
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#15678])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#14123])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@i915_drm_fdinfo@all-busy-check-all.html
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#14123])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@busy-idle@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][111] ([i915#14073]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@i915_drm_fdinfo@busy-idle@rcs0.html

  * igt@i915_drm_fdinfo@isolation@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#14073]) +7 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@i915_drm_fdinfo@isolation@rcs0.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#14073]) +11 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@i915_drm_fdinfo@virtual-busy:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#14118]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@i915_drm_fdinfo@virtual-busy.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-glk:          NOTRUN -> [ABORT][115] ([i915#15342]) +1 other test abort
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk6/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#6412])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#8399])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#16080] / [i915#16166])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rps@basic-api:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#11681] / [i915#6621])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@i915_pm_rps@basic-api.html
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#11681] / [i915#6621])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#11681] / [i915#6621])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#11681])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#11681]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@i915_pm_rps@thresholds-park.html
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#11681])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#16109])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#16079])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#5723])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk:          NOTRUN -> [INCOMPLETE][128] ([i915#13356] / [i915#16182] / [i915#4817])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          [PASS][129] -> [INCOMPLETE][130] ([i915#13356] / [i915#16182] / [i915#4817])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk9/igt@i915_suspend@fence-restore-untiled.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk4/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4212]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#4212])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#4212]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#12454] / [i915#12712] / [i915#14544])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#12454] / [i915#12712])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#1769] / [i915#3555])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][137] ([i915#1769])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#17432] / [i915#5286]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#5286]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5286]) +7 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#17432] / [i915#5286]) +5 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4538] / [i915#5286]) +6 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][143] -> [FAIL][144] ([i915#15733] / [i915#5138])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#17431]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#14544] / [i915#17431] / [i915#3638]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#3638]) +5 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#3828]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#3828]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#17431])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#17431]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#17431] / [i915#3638]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#17431]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#17432]) +6 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#4538]) +7 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#4538] / [i915#5190]) +6 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#14544] / [i915#4538])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#17432])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#5190])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#17432]) +7 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#4538]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][162] ([i915#17432])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#17356] / [i915#5190]) +4 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#10307] / [i915#6095]) +81 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#6095]) +49 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#6095]) +183 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#6095]) +29 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#12313]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#17356]) +14 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#14544] / [i915#6095]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][171] +466 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#12805])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#12805])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#6095]) +74 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#14098] / [i915#14544] / [i915#6095]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         [PASS][177] -> [FAIL][178] ([i915#17158])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#6095]) +3 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][180] -> [INCOMPLETE][181] ([i915#13356] / [i915#14694] / [i915#15582])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][182] -> [INCOMPLETE][183] ([i915#15582])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][184] -> [INCOMPLETE][185] ([i915#13356] / [i915#15582])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#12313])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#14098] / [i915#6095]) +54 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#12313])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#12313])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#6095]) +78 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][191] +57 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#17099])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3742])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#3742])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#13781]) +8 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#11151] / [i915#7828]) +6 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#17427]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#17427]) +5 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#14544] / [i915#17427])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#17427]) +4 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_chamelium_color@degamma.html
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#17427]) +5 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#17427]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#17427]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#16471] / [i915#17427])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#16471] / [i915#17427]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#16471] / [i915#17427])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#16464] / [i915#16471] / [i915#17427])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#16471] / [i915#17427])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#11151] / [i915#7828]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#11151] / [i915#7828]) +11 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#11151] / [i915#7828]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#11151] / [i915#14544] / [i915#7828])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#11151])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#11151]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#11151])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#11151] / [i915#7828]) +6 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#11151] / [i915#7828]) +9 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color@background-color:
    - shard-dg2:          [PASS][218] -> [SKIP][219] ([i915#17373])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_color@background-color.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_color@background-color.html

  * igt@kms_color@ctm-negative:
    - shard-dg2:          [PASS][220] -> [SKIP][221] ([i915#12655] / [i915#17373]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_color@ctm-negative.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_color@ctm-negative.html

  * igt@kms_color@gamma:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#12655] / [i915#17373])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_color@gamma.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4:
    - shard-dg2:          [PASS][223] -> [SKIP][224] ([i915#15529]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#16990]) +7 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#16990]) +31 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#16990]) +15 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#16990]) +15 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#16990]) +11 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#15865]) +6 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#15865]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#15330])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#15330] / [i915#3299])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_content_protection@dp-mst-type-0.html
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#15330] / [i915#3116] / [i915#3299])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-tglu-1:       NOTRUN -> [SKIP][235] ([i915#15330])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#15330])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#15865])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#15865]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#15865]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_content_protection@mei-interface.html
    - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#8063] / [i915#9433])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#15865]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#13049]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#13049]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#13049]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#13049]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#3555]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#3555]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#3555])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#13049]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#8814]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][251] ([i915#12358] / [i915#13356] / [i915#14152] / [i915#7882])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][252] ([i915#12358] / [i915#13356] / [i915#14152])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#4103]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#4103])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#16119] / [i915#4213])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - shard-dg2:          [PASS][256] -> [SKIP][257] ([i915#11190] / [i915#17356]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#17428]) +96 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#13046] / [i915#5354]) +4 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#17428] / [i915#9809]) +3 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#4103])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#4103])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#9723])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#1769] / [i915#3555] / [i915#3804])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#3804])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#3804])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#17289])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#17287])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#17291])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#17288])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#17288])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#17288])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#17286])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#17286])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#17286])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#17286])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#17290])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
    - shard-tglu-1:       NOTRUN -> [SKIP][278] ([i915#17290])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#17290])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#13748])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-dg2:          NOTRUN -> [SKIP][281] ([i915#17285])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#17285]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#17285])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-5/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-tglu-1:       NOTRUN -> [SKIP][284] ([i915#17285])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#16867])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#16867])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#13707])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#13707])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#16361]) +6 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#16361]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#16361])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#16361]) +7 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_dsc@dsc-with-formats.html
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#16361]) +5 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#14544] / [i915#16361])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#16361]) +6 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][296] ([i915#13356] / [i915#9878])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk11/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#16680])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#16680])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][299] ([i915#16680])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#16680])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-1x:
    - shard-dg2:          [PASS][301] -> [SKIP][302] ([i915#9738])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_feature_discovery@display-1x.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_feature_discovery@display-1x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#16081])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_feature_discovery@display-3x.html
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#16081])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#16599])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@hdr:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#16600])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_feature_discovery@hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#16600])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_feature_discovery@hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#16600])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#658])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#14544] / [i915#658])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#14544] / [i915#9934]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#3637] / [i915#9934]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][313] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][314] ([i915#12745] / [i915#13356] / [i915#17183])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#9934]) +7 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#3637] / [i915#9934]) +10 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][317] ([i915#3637] / [i915#9934]) +5 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#9934]) +8 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#9934]) +4 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#8381]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_flip@flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#8381])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#8381]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@plain-flip-interruptible:
    - shard-dg2:          [PASS][323] -> [SKIP][324] ([i915#5354]) +7 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_flip@plain-flip-interruptible.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#5354])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#3555] / [i915#8813])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#15643]) +6 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#15643]) +4 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#15643] / [i915#5190]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#14544] / [i915#15643])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#15643]) +4 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-dg2:          [PASS][332] -> [SKIP][333] ([i915#3555] / [i915#8813]) +6 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#15643]) +3 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][336] ([i915#15643]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#15643]) +5 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-dg2:          [PASS][338] -> [SKIP][339] ([i915#8813])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2:          [PASS][340] -> [SKIP][341] ([i915#16708]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#16708] / [i915#5354]) +15 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#15991] / [i915#17428] / [i915#1825]) +22 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#15990] / [i915#8708]) +10 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#17428] / [i915#1825]) +7 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][346] ([i915#15990] / [i915#8708]) +6 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#14544] / [i915#17428] / [i915#1825]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2:          [PASS][348] -> [SKIP][349] ([i915#16708] / [i915#5354]) +8 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#10055])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#15989]) +25 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#15989]) +7 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#15989]) +15 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#15990]) +33 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][355] ([i915#15990]) +7 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-move:
    - shard-glk:          [PASS][356] -> [SKIP][357] +4 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-move.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][358] ([i915#15991] / [i915#17428]) +19 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#15990]) +12 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#10055]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#15104] / [i915#15990]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#15104] / [i915#15990])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#15104] / [i915#15990])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#15990] / [i915#8708]) +24 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#14544] / [i915#17428]) +12 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
    - shard-tglu-1:       NOTRUN -> [SKIP][366] ([i915#17428]) +37 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#5439])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][368] ([i915#15102]) +48 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][369] ([i915#15102]) +21 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][370] ([i915#15989]) +26 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#14544] / [i915#15102]) +4 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#15102]) +48 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#16708]) +19 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][374] ([i915#15989]) +11 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-pgflip-blt:
    - shard-glk10:        [PASS][375] -> [SKIP][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-pgflip-blt.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          [PASS][377] -> [SKIP][378] ([i915#15989]) +11 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][379] ([i915#17428]) +106 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][380] ([i915#17428] / [i915#4423])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][381] ([i915#15991]) +18 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:
    - shard-dg1:          NOTRUN -> [SKIP][382] ([i915#15989]) +21 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#9766])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][384] ([i915#9766])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][385] ([i915#9766])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#9766])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][387] ([i915#15102]) +51 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][388] ([i915#15102]) +24 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-glk11:        NOTRUN -> [SKIP][389] +184 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#15991] / [i915#5354]) +18 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][391] ([i915#17428]) +98 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-glk10:        NOTRUN -> [FAIL][392] ([i915#17102])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-dg2:          [PASS][393] -> [SKIP][394] ([i915#17357])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-tglu-1:       NOTRUN -> [FAIL][395] ([i915#17101] / [i915#17108] / [i915#17188])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-rkl:          [PASS][396] -> [INCOMPLETE][397] ([i915#17110])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          [PASS][398] -> [SKIP][399] ([i915#16644] / [i915#3555] / [i915#8228]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-1/igt@kms_hdr@bpc-switch.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][400] ([i915#12713])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][401] ([i915#3555] / [i915#8228]) +2 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][402] ([i915#16518] / [i915#3555] / [i915#8228]) +2 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][403] ([i915#16644] / [i915#3555] / [i915#8228]) +2 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][404] ([i915#3555] / [i915#8228]) +3 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_hdr@static-toggle-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][405] ([i915#12713] / [i915#16490] / [i915#3555] / [i915#8228]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-htotal:
    - shard-dg2:          NOTRUN -> [SKIP][406] ([i915#16746] / [i915#3555])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_invalid_mode@bad-htotal.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-dg2:          [PASS][407] -> [SKIP][408] ([i915#16746] / [i915#3555]) +2 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_invalid_mode@zero-hdisplay.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][409] ([i915#15460])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][410] ([i915#14544] / [i915#15460])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][411] ([i915#15458]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][412] ([i915#15458])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][413] ([i915#14544] / [i915#15458])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][414] ([i915#15458])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-tglu-1:       NOTRUN -> [SKIP][415] ([i915#16451])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_mst@mst-suspend-read-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][416] ([i915#16451])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][417] ([i915#15815])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][418] ([i915#6301])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglu:         NOTRUN -> [SKIP][419] +3 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][420] +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2:          [PASS][421] -> [SKIP][422] ([i915#17356]) +54 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-rkl:          NOTRUN -> [SKIP][423] ([i915#14712])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
    - shard-tglu:         NOTRUN -> [SKIP][424] ([i915#14712])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][425] ([i915#15709]) +5 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-dg2:          [PASS][426] -> [SKIP][427] ([i915#8825]) +2 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][428] ([i915#8825])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][429] ([i915#16386]) +7 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][430] ([i915#15709]) +6 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:
    - shard-mtlp:         NOTRUN -> [SKIP][431] ([i915#16386]) +3 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][432] ([i915#15709]) +5 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][433] ([i915#15709]) +4 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][434] ([i915#16386]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][435] ([i915#15709]) +3 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][436] ([i915#16386]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][437] ([i915#15709])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [PASS][438] -> [INCOMPLETE][439] ([i915#14412]) +1 other test incomplete
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-glk:          NOTRUN -> [INCOMPLETE][440] ([i915#13026] / [i915#13356]) +1 other test incomplete
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][441] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][442] ([i915#11614] / [i915#3582]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][443] ([i915#3555]) +9 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-tglu-1:       NOTRUN -> [SKIP][444] ([i915#13958])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][445] ([i915#13958])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-rkl:          NOTRUN -> [SKIP][446] ([i915#13958])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg1:          NOTRUN -> [SKIP][447] ([i915#13958]) +1 other test skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][448] ([i915#15329]) +4 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-dg2:          [PASS][449] -> [SKIP][450] ([i915#15329] / [i915#17356] / [i915#9423]) +3 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d:
    - shard-dg2:          [PASS][451] -> [SKIP][452] ([i915#15329] / [i915#17356]) +4 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][453] ([i915#15329]) +4 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][454] ([i915#15329]) +9 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-dg2:          [PASS][455] -> [SKIP][456] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][457] ([i915#15329] / [i915#17356] / [i915#9423]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-dg2:          [PASS][458] -> [SKIP][459] ([i915#15329]) +14 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-dg2:          NOTRUN -> [SKIP][460] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][461] ([i915#15329]) +8 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][462] ([i915#15329] / [i915#17356]) +2 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][463] ([i915#12343] / [i915#9812])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][464] ([i915#12343] / [i915#14544] / [i915#5354])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][465] ([i915#12343])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-mtlp:         [PASS][466] -> [INCOMPLETE][467] ([i915#17032])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@kms_pm_backlight@fade-with-suspend.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-dg2:          [PASS][468] -> [SKIP][469] ([i915#13441])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_pm_dc@dc5-dpms-negative.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu:         NOTRUN -> [SKIP][470] ([i915#15948])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [FAIL][471] ([i915#16479])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-mtlp:         NOTRUN -> [SKIP][472] ([i915#8430])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg1:          NOTRUN -> [SKIP][473] ([i915#4077]) +19 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][474] ([i915#15073])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][475] ([i915#15073]) +2 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg1:          [PASS][476] -> [SKIP][477] ([i915#15073])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-12/igt@kms_pm_rpm@dpms-non-lpsp.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-mtlp:         NOTRUN -> [SKIP][478] ([i915#4077]) +6 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][479] -> [SKIP][480] ([i915#15073]) +1 other test skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][481] -> [SKIP][482] ([i915#14544] / [i915#15073])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][483] ([i915#15073])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-rkl:          NOTRUN -> [SKIP][484] ([i915#15073])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][485] ([i915#15073])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-mtlp:         NOTRUN -> [SKIP][486] ([i915#15073])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][487] -> [SKIP][488] ([i915#15073])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglu:         NOTRUN -> [SKIP][489] ([i915#17434])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@package-g7:
    - shard-dg1:          NOTRUN -> [SKIP][490] ([i915#15403])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [PASS][491] -> [INCOMPLETE][492] ([i915#14419])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_pm_rpm@system-suspend-idle.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          [PASS][493] -> [INCOMPLETE][494] ([i915#10553] / [i915#13356])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk4/igt@kms_pm_rpm@system-suspend-modeset.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk5/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-dg2:          [PASS][495] -> [SKIP][496] ([i915#11521])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_properties@crtc-properties-atomic.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][497] ([i915#11520]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][498] ([i915#11520]) +7 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-glk:          NOTRUN -> [SKIP][499] ([i915#11520]) +11 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][500] ([i915#11520] / [i915#14544])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][501] ([i915#11520]) +7 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][502] ([i915#11520]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-snb5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][503] ([i915#12316]) +1 other test skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][504] ([i915#11520]) +2 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk11/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][505] ([i915#11520]) +9 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][506] ([i915#11520]) +6 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][507] ([i915#9683]) +1 other test skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-mtlp:         NOTRUN -> [SKIP][508] ([i915#4348])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][509] ([i915#9683]) +1 other test skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][510] ([i915#9683]) +1 other test skip
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][511] ([i915#9683]) +2 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg1:          NOTRUN -> [SKIP][512] ([i915#1072] / [i915#9732]) +33 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][513] ([i915#1072] / [i915#9732]) +22 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-cursor-plane-move@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][514] ([i915#9688]) +9 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_psr@fbc-psr-cursor-plane-move@edp-1.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][515] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][516] ([i915#9732]) +10 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@pr-sprite-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][517] ([i915#9732]) +25 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_psr@pr-sprite-mmap-cpu.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-snb:          NOTRUN -> [SKIP][518] +144 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-snb7/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][519] ([i915#1072] / [i915#9732]) +25 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr-suspend:
    - shard-mtlp:         [PASS][520] -> [FAIL][521] ([i915#17226]) +1 other test fail
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@kms_psr@psr-suspend.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_psr@psr-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][522] ([i915#15949]) +1 other test skip
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-tglu:         NOTRUN -> [SKIP][523] ([i915#15949])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][524] ([i915#12755] / [i915#15867] / [i915#5190])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][525] ([i915#17432] / [i915#5289])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][526] ([i915#17432] / [i915#5289])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][527] ([i915#12755] / [i915#15867])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][528] ([i915#12755] / [i915#15867])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk11:        NOTRUN -> [ABORT][529] ([i915#13179]) +1 other test abort
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk11/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][530] ([i915#15106]) +6 other tests fail
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-snb6/igt@kms_setmode@basic.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][531] ([i915#8623])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][532] ([i915#12276] / [i915#13356])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk2/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][533] ([i915#9906])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][534] ([i915#9906])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][535] ([i915#15243] / [i915#3555])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_vrr@flip-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][536] ([i915#15243] / [i915#3555])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_vrr@flip-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][537] ([i915#3555] / [i915#8808])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][538] ([i915#3555]) +5 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-tglu-1:       NOTRUN -> [SKIP][539] ([i915#11920])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][540] ([i915#3555] / [i915#9906])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][541] ([i915#9906])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-tglu:         NOTRUN -> [SKIP][542] ([i915#9906])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-mtlp:         NOTRUN -> [SKIP][543] ([i915#8808] / [i915#9906])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-4/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][544] ([i915#14544] / [i915#9906])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][545] ([i915#9100]) +1 other test fail
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][546] ([i915#14544] / [i915#2435])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][547] ([i915#2433])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html
    - shard-mtlp:         NOTRUN -> [SKIP][548] +1 other test skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][549] ([i915#2433])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [PASS][550] -> [FAIL][551] ([i915#4349])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-3/igt@perf_pmu@busy-double-start@ccs0.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-4/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][552] ([i915#8516])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-mtlp:         NOTRUN -> [SKIP][553] ([i915#14121]) +1 other test skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_udl@share-import-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][554] ([i915#16420]) +1 other test skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@prime_udl@share-import-addfb.html
    - shard-dg2:          NOTRUN -> [SKIP][555] ([i915#16420])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@prime_udl@share-import-addfb.html
    - shard-rkl:          NOTRUN -> [SKIP][556] ([i915#16420])
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@prime_udl@share-import-addfb.html
    - shard-dg1:          NOTRUN -> [SKIP][557] ([i915#16420])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@prime_udl@share-import-addfb.html
    - shard-tglu:         NOTRUN -> [SKIP][558] ([i915#16420])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][559] ([i915#3291] / [i915#3708])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][560] ([i915#3708] / [i915#4077]) +2 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][561] ([i915#17429] / [i915#3708])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@prime_vgem@coherency-gtt.html
    - shard-tglu-1:       NOTRUN -> [SKIP][562] ([i915#17429])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][563] ([i915#3708] / [i915#4077]) +2 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@prime_vgem@coherency-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][564] ([i915#3708] / [i915#4077])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@prime_vgem@coherency-gtt.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - shard-dg2:          [SKIP][565] ([i915#1849] / [i915#2582]) -> [PASS][566]
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@fbdev@info.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@fbdev@info.html

  * igt@gem_eio@hibernate:
    - shard-mtlp:         [INCOMPLETE][567] ([i915#17190] / [i915#7975]) -> [PASS][568]
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-5/igt@gem_eio@hibernate.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@gem_eio@hibernate.html

  * igt@gem_exec_capture@pi:
    - shard-dg2:          [FAIL][569] ([i915#17375]) -> [PASS][570]
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@gem_exec_capture@pi.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@gem_exec_capture@pi.html

  * igt@gem_exec_capture@pi@ccs0:
    - shard-dg2:          [FAIL][571] -> [PASS][572]
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@gem_exec_capture@pi@ccs0.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@gem_exec_capture@pi@ccs0.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [INCOMPLETE][573] ([i915#13356]) -> [PASS][574] +1 other test pass
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-mtlp:         [INCOMPLETE][575] ([i915#13356] / [i915#7975]) -> [PASS][576] +1 other test pass
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-3/igt@gem_exec_suspend@basic-s4-devices.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-rkl:          [INCOMPLETE][577] ([i915#16108]) -> [PASS][578] +1 other test pass
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@gem_mmap_offset@clear-via-pagefault.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [INCOMPLETE][579] ([i915#13356] / [i915#13809] / [i915#16193]) -> [PASS][580]
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk8/igt@gem_softpin@noreloc-s3.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk5/igt@gem_softpin@noreloc-s3.html
    - shard-rkl:          [INCOMPLETE][581] ([i915#13809] / [i915#16226]) -> [PASS][582]
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gem_softpin@noreloc-s3.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@gem_softpin@noreloc-s3.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg1:          [DMESG-WARN][583] ([i915#13029] / [i915#14545]) -> [PASS][584]
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-18/igt@i915_module_load@reload-no-display.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [FAIL][585] ([i915#12964]) -> [PASS][586] +1 other test pass
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-rkl:          [INCOMPLETE][587] ([i915#13356]) -> [PASS][588]
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_async_flips@async-flip-hang:
    - shard-dg2:          [SKIP][589] ([i915#17356]) -> [PASS][590] +29 other tests pass
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_async_flips@async-flip-hang.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_async_flips@async-flip-hang.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][591] ([i915#17150]) -> [PASS][592] +1 other test pass
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-mtlp:         [DMESG-WARN][593] ([i915#16685]) -> [PASS][594]
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_color@deep-color:
    - shard-rkl:          [SKIP][595] ([i915#12655] / [i915#3555]) -> [PASS][596]
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_color@deep-color.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-dg2:          [SKIP][597] ([i915#15529]) -> [PASS][598] +2 other tests pass
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [FAIL][599] ([i915#13566]) -> [PASS][600] +4 other tests pass
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-tglu:         [FAIL][601] ([i915#13566]) -> [PASS][602] +3 other tests pass
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-dg2:          [SKIP][603] ([i915#11190] / [i915#17356]) -> [PASS][604]
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-dg2:          [SKIP][605] ([i915#17358]) -> [PASS][606]
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_flip@flip-vs-dpms-on-nop.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-panning:
    - shard-dg2:          [SKIP][607] ([i915#5354]) -> [PASS][608] +3 other tests pass
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_flip@flip-vs-panning.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-dg2:          [SKIP][609] ([i915#3555] / [i915#8813]) -> [PASS][610] +1 other test pass
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2:          [SKIP][611] ([i915#16708]) -> [PASS][612] +1 other test pass
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [SKIP][613] ([i915#16708] / [i915#5354]) -> [PASS][614] +2 other tests pass
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-mtlp:         [FAIL][615] ([i915#17276]) -> [PASS][616]
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-rkl:          [SKIP][617] ([i915#15989]) -> [PASS][618] +5 other tests pass
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [SKIP][619] -> [PASS][620] +10 other tests pass
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-mtlp:         [INCOMPLETE][621] ([i915#17319]) -> [PASS][622] +1 other test pass
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-2/igt@kms_hdr@bpc-switch-suspend.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010:
    - shard-mtlp:         [FAIL][623] ([i915#17172]) -> [PASS][624]
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-2/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010.html

  * igt@kms_invalid_mode@zero-clock:
    - shard-dg2:          [SKIP][625] ([i915#16746] / [i915#3555]) -> [PASS][626]
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_invalid_mode@zero-clock.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-dg2:          [SKIP][627] ([i915#8825]) -> [PASS][628] +2 other tests pass
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [SKIP][629] ([i915#6953]) -> [PASS][630]
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          [SKIP][631] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423]) -> [PASS][632]
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-dg2:          [SKIP][633] ([i915#15329]) -> [PASS][634] +2 other tests pass
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:
    - shard-dg2:          [SKIP][635] ([i915#15329] / [i915#17356]) -> [PASS][636]
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-rkl:          [ABORT][637] ([i915#15132]) -> [PASS][638]
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
    - shard-mtlp:         [INCOMPLETE][639] ([i915#17230]) -> [PASS][640]
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-4/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [SKIP][641] ([i915#15073]) -> [PASS][642]
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg1:          [SKIP][643] ([i915#15073]) -> [PASS][644] +1 other test pass
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][645] ([i915#12276] / [i915#13356]) -> [PASS][646]
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-mtlp:         [FAIL][647] ([i915#4349]) -> [PASS][648]
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-3/igt@perf_pmu@busy-double-start@vecs0.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-4/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-dg2:          [SKIP][649] -> [PASS][650]
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@prime_mmap_kms@buffer-sharing.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@prime_mmap_kms@buffer-sharing.html

  
#### Warnings ####

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          [SKIP][651] ([i915#14544] / [i915#7697]) -> [SKIP][652] ([i915#7697])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-mtlp:         [INCOMPLETE][653] ([i915#13356] / [i915#17244]) -> [ABORT][654] ([i915#17146])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-mtlp:         [FAIL][655] ([i915#17176]) -> [ABORT][656] ([i915#17146])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          [SKIP][657] ([i915#4525]) -> [SKIP][658] ([i915#14544] / [i915#4525])
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [FAIL][659] ([i915#15816]) -> [FAIL][660] ([i915#15944])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-tglu-2/igt@gem_exec_big@single.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@gem_exec_big@single.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-rkl:          [SKIP][661] ([i915#14544] / [i915#3281]) -> [SKIP][662] ([i915#3281])
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gem_exec_reloc@basic-write-gtt.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [SKIP][663] ([i915#3281]) -> [SKIP][664] ([i915#14544] / [i915#3281]) +4 other tests skip
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_lmem_swapping@massive:
    - shard-rkl:          [SKIP][665] ([i915#14544] / [i915#4613]) -> [SKIP][666] ([i915#4613])
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gem_lmem_swapping@massive.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@gem_lmem_swapping@massive.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          [SKIP][667] ([i915#14544] / [i915#3282]) -> [SKIP][668] ([i915#3282]) +2 other tests skip
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          [SKIP][669] ([i915#3282]) -> [SKIP][670] ([i915#14544] / [i915#3282]) +4 other tests skip
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          [SKIP][671] ([i915#17433] / [i915#3297]) -> [SKIP][672] ([i915#14544] / [i915#17433] / [i915#3297])
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@gem_userptr_blits@coherency-sync.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-rkl:          [SKIP][673] ([i915#14544] / [i915#3297]) -> [SKIP][674] ([i915#3297])
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen3_render_linear_blits:
    - shard-rkl:          [SKIP][675] -> [SKIP][676] ([i915#14544]) +3 other tests skip
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@gen3_render_linear_blits.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gen3_render_linear_blits.html

  * igt@gen3_render_tiledx_blits:
    - shard-rkl:          [SKIP][677] ([i915#14544]) -> [SKIP][678] +1 other test skip
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gen3_render_tiledx_blits.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@gen3_render_tiledx_blits.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          [SKIP][679] ([i915#14544] / [i915#2527]) -> [SKIP][680] ([i915#2527])
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@gen9_exec_parse@bb-start-far.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-rkl:          [SKIP][681] ([i915#14544] / [i915#15678]) -> [SKIP][682] ([i915#15678])
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gpu_buddy@gpu_buddy.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          [SKIP][683] ([i915#8399]) -> [SKIP][684] ([i915#14544] / [i915#8399])
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@i915_pm_freq_api@freq-reset.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-rkl:          [SKIP][685] ([i915#14544] / [i915#16109]) -> [SKIP][686] ([i915#16109])
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@i915_query@query-topology-known-pci-ids.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          [SKIP][687] ([i915#1769] / [i915#3555]) -> [SKIP][688] ([i915#17356])
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-rkl:          [SKIP][689] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][690] ([i915#4538] / [i915#5286])
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          [SKIP][691] ([i915#4538] / [i915#5286]) -> [SKIP][692] ([i915#14544] / [i915#4538] / [i915#5286]) +1 other test skip
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2:          [SKIP][693] ([i915#17431]) -> [SKIP][694] ([i915#17356]) +3 other tests skip
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          [SKIP][695] ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][696] ([i915#17431] / [i915#3638]) +2 other tests skip
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2:          [SKIP][697] ([i915#3828]) -> [SKIP][698] ([i915#17356]) +1 other test skip
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-rkl:          [SKIP][699] ([i915#14544] / [i915#3828]) -> [SKIP][700] ([i915#3828])
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2:          [SKIP][701] ([i915#17356]) -> [SKIP][702] ([i915#17431]) +2 other tests skip
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-rkl:          [SKIP][703] ([i915#17431] / [i915#3638]) -> [SKIP][704] ([i915#14544] / [i915#17431] / [i915#3638]) +1 other test skip
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          [SKIP][705] ([i915#17356] / [i915#5190]) -> [SKIP][706] ([i915#4538] / [i915#5190]) +4 other tests skip
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          [SKIP][707] ([i915#17356] / [i915#5190]) -> [SKIP][708] ([i915#5190])
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          [SKIP][709] ([i915#4538] / [i915#5190]) -> [SKIP][710] ([i915#17356] / [i915#5190]) +8 other tests skip
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2:          [SKIP][711] ([i915#5190]) -> [SKIP][712] ([i915#17356] / [i915#5190])
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [SKIP][713] ([i915#4538]) -> [SKIP][714] ([i915#14544] / [i915#4538])
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-rkl:          [SKIP][715] ([i915#14544] / [i915#4538]) -> [SKIP][716] ([i915#4538]) +1 other test skip
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][717] ([i915#14098] / [i915#6095]) -> [SKIP][718] ([i915#14098] / [i915#14544] / [i915#6095]) +8 other tests skip
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-dg2:          [SKIP][719] ([i915#17356]) -> [SKIP][720] ([i915#10307] / [i915#6095]) +4 other tests skip
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][721] ([i915#12313]) -> [SKIP][722] ([i915#17356]) +1 other test skip
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][723] ([i915#6095]) -> [SKIP][724] ([i915#14544] / [i915#6095]) +5 other tests skip
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][725] ([i915#17356]) -> [SKIP][726] ([i915#12313]) +2 other tests skip
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][727] ([i915#12313] / [i915#14544]) -> [SKIP][728] ([i915#12313])
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-dg2:          [SKIP][729] ([i915#10307] / [i915#6095]) -> [SKIP][730] ([i915#17356]) +14 other tests skip
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][731] ([i915#14544] / [i915#6095]) -> [SKIP][732] ([i915#6095]) +1 other test skip
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-mtlp:         [FAIL][733] ([i915#17158]) -> [INCOMPLETE][734] ([i915#15582]) +1 other test incomplete
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          [INCOMPLETE][735] ([i915#13356] / [i915#15582]) -> [INCOMPLETE][736] ([i915#13356] / [i915#14694] / [i915#15582])
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2:          [SKIP][737] ([i915#6095]) -> [SKIP][738] ([i915#17356])
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
    - shard-rkl:          [INCOMPLETE][739] ([i915#14694] / [i915#15582]) -> [INCOMPLETE][740] ([i915#15582])
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][741] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][742] ([i915#14098] / [i915#6095]) +6 other tests skip
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
    - shard-glk:          [INCOMPLETE][743] ([i915#13356] / [i915#14694] / [i915#15582]) -> [INCOMPLETE][744] ([i915#13356] / [i915#15582])
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][745] ([i915#12313]) -> [SKIP][746] ([i915#12313] / [i915#14544])
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2:          [SKIP][747] ([i915#17356]) -> [SKIP][748] ([i915#13781])
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_cdclk@mode-transition.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          [SKIP][749] ([i915#16017]) -> [SKIP][750] ([i915#17356])
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_cdclk@mode-transition-all-outputs.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-rkl:          [SKIP][751] ([i915#11151]) -> [SKIP][752] ([i915#11151] / [i915#14544])
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-rkl:          [SKIP][753] ([i915#17427]) -> [SKIP][754] ([i915#14544] / [i915#17427])
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-4/igt@kms_chamelium_color@ctm-0-75.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-rkl:          [SKIP][755] ([i915#14544] / [i915#17427]) -> [SKIP][756] ([i915#17427]) +2 other tests skip
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-rkl:          [SKIP][757] ([i915#16471] / [i915#17427]) -> [SKIP][758] ([i915#14544] / [i915#16471] / [i915#17427])
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg1:          [SKIP][759] ([i915#11151] / [i915#7828]) -> [SKIP][760] ([i915#11151] / [i915#4423] / [i915#7828])
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-12/igt@kms_chamelium_frames@dp-frame-dump.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-rkl:          [SKIP][761] ([i915#11151] / [i915#7828]) -> [SKIP][762] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_chamelium_frames@vga-frame-dump.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][763] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][764] ([i915#11151] / [i915#7828]) +1 other test skip
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          [SKIP][765] ([i915#15865]) -> [SKIP][766] ([i915#17356]) +3 other tests skip
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-rkl:          [SKIP][767] ([i915#14544] / [i915#15865]) -> [SKIP][768] ([i915#15865])
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_content_protection@atomic-hdcp14.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          [SKIP][769] ([i915#15330] / [i915#3299]) -> [SKIP][770] ([i915#17356]) +1 other test skip
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_content_protection@dp-mst-lic-type-1.html
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          [SKIP][771] ([i915#15330] / [i915#3116]) -> [SKIP][772] ([i915#14544] / [i915#15330] / [i915#3116])
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          [SKIP][773] ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][774] ([i915#15330] / [i915#3116])
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          [SKIP][775] ([i915#17356]) -> [SKIP][776] ([i915#15865])
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_content_protection@uevent.html
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          [SKIP][777] ([i915#13049] / [i915#14544]) -> [SKIP][778] ([i915#13049])
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          [SKIP][779] ([i915#14544] / [i915#3555]) -> [SKIP][780] ([i915#3555])
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          [SKIP][781] ([i915#17356]) -> [SKIP][782] ([i915#3555]) +2 other tests skip
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-rkl:          [SKIP][783] ([i915#3555]) -> [SKIP][784] ([i915#14544] / [i915#3555])
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          [SKIP][785] ([i915#13049]) -> [SKIP][786] ([i915#17356]) +1 other test skip
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2:          [SKIP][787] ([i915#13046] / [i915#5354]) -> [SKIP][788] ([i915#17356]) +3 other tests skip
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][789] ([i915#14544] / [i915#17428]) -> [SKIP][790] ([i915#17428]) +28 other tests skip
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          [SKIP][791] ([i915#11190] / [i915#17356]) -> [SKIP][792] ([i915#4103])
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2:          [SKIP][793] ([i915#17356]) -> [SKIP][794] ([i915#13046] / [i915#5354])
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          [SKIP][795] ([i915#4103]) -> [SKIP][796] ([i915#17356])
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][797] ([i915#9723]) -> [SKIP][798] ([i915#14544] / [i915#9723])
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          [SKIP][799] ([i915#13691]) -> [SKIP][800] ([i915#17356])
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_display_modes@extended-mode-basic.html
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg2:          [SKIP][801] ([i915#3555]) -> [SKIP][802] ([i915#17356]) +4 other tests skip
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          [SKIP][803] ([i915#14544] / [i915#17289]) -> [SKIP][804] ([i915#17289])
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-rkl:          [SKIP][805] ([i915#14544] / [i915#17287]) -> [SKIP][806] ([i915#17287])
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-dg2:          [SKIP][807] ([i915#17291]) -> [SKIP][808] ([i915#17356])
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-dg2:          [SKIP][809] ([i915#17285]) -> [SKIP][810] ([i915#17356])
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][811] ([i915#13748]) -> [SKIP][812] ([i915#13748] / [i915#14544])
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-rkl:          [SKIP][813] ([i915#17285]) -> [SKIP][814] ([i915#14544] / [i915#17285])
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-dg2:          [SKIP][815] ([i915#17356]) -> [SKIP][816] ([i915#16361]) +1 other test skip
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
    - shard-rkl:          [SKIP][817] ([i915#16361]) -> [SKIP][818] ([i915#14544] / [i915#16361]) +1 other test skip
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          [SKIP][819] ([i915#16361]) -> [SKIP][820] ([i915#17356]) +4 other tests skip
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats.html
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-rkl:          [SKIP][821] ([i915#14544] / [i915#16361]) -> [SKIP][822] ([i915#16361])
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          [SKIP][823] ([i915#16081]) -> [SKIP][824] ([i915#14544] / [i915#16081])
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_feature_discovery@display-3x.html
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][825] ([i915#14544] / [i915#16599]) -> [SKIP][826] ([i915#16599])
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-rkl:          [SKIP][827] ([i915#14544] / [i915#9934]) -> [SKIP][828] ([i915#9934]) +1 other test skip
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][829] ([i915#15643]) -> [SKIP][830] ([i915#14544] / [i915#15643])
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][831] ([i915#14544] / [i915#15643]) -> [SKIP][832] ([i915#15643]) +1 other test skip
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][833] ([i915#15990] / [i915#8708]) -> [SKIP][834] ([i915#16708] / [i915#5354]) +13 other tests skip
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move:
    - shard-dg1:          [SKIP][835] ([i915#15989] / [i915#4423]) -> [SKIP][836] ([i915#15989])
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          [SKIP][837] ([i915#17428] / [i915#4423]) -> [SKIP][838] ([i915#17428])
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt.html
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][839] ([i915#15104] / [i915#15990]) -> [SKIP][840] ([i915#16708]) +2 other tests skip
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][841] ([i915#15102]) -> [SKIP][842] ([i915#16708] / [i915#5354]) +15 other tests skip
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][843] ([i915#16708] / [i915#5354]) -> [SKIP][844] ([i915#15990] / [i915#8708]) +4 other tests skip
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][845] ([i915#17428] / [i915#1825]) -> [SKIP][846] ([i915#14544] / [i915#17428] / [i915#1825]) +2 other tests skip
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2:          [SKIP][847] ([i915#15991] / [i915#5354]) -> [SKIP][848] ([i915#16708] / [i915#5354]) +33 other tests skip
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][849] ([i915#5439]) -> [SKIP][850] ([i915#14544] / [i915#5439])
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          [SKIP][851] ([i915#10055]) -> [SKIP][852] ([i915#16708] / [i915#5354])
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][853] ([i915#15102]) -> [SKIP][854] ([i915#14544] / [i915#15102]) +20 other tests skip
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][855] ([i915#14544] / [i915#15102]) -> [SKIP][856] ([i915#15102]) +19 other tests skip
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:
    - shard-dg2:          [SKIP][857] ([i915#16708]) -> [SKIP][858] ([i915#15102]) +9 other tests skip
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-dg2:          [SKIP][859] ([i915#10055]) -> [SKIP][860] ([i915#16708])
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          [SKIP][861] ([i915#15989]) -> [SKIP][862] ([i915#16708]) +12 other tests skip
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-render.html
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][863] ([i915#16708]) -> [SKIP][864] ([i915#15990]) +5 other tests skip
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw:
    - shard-dg2:          [SKIP][865] ([i915#16708]) -> [SKIP][866] ([i915#15991]) +20 other tests skip
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw.html
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][867] ([i915#15990]) -> [SKIP][868] ([i915#16708]) +30 other tests skip
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:
    - shard-dg2:          [SKIP][869] ([i915#16708]) -> [SKIP][870] ([i915#15989]) +10 other tests skip
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][871] ([i915#16708] / [i915#5354]) -> [SKIP][872] ([i915#15991] / [i915#5354]) +16 other tests skip
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][873] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][874] ([i915#17428] / [i915#1825]) +3 other tests skip
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          [SKIP][875] ([i915#17428]) -> [SKIP][876] ([i915#14544] / [i915#17428]) +23 other tests skip
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:
    - shard-dg2:          [SKIP][877] ([i915#16708] / [i915#5354]) -> [SKIP][878] ([i915#15102]) +2 other tests skip
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2:          [SKIP][879] ([i915#15102]) -> [SKIP][880] ([i915#16708]) +19 other tests skip
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt.html
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - shard-dg2:          [SKIP][881] ([i915#15991]) -> [SKIP][882] ([i915#16708]) +33 other tests skip
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          [SKIP][883] ([i915#17356]) -> [SKIP][884] ([i915#16518] / [i915#3555] / [i915#8228])
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_hdr@bpc-switch-dpms.html
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][885] ([i915#12713] / [i915#16644]) -> [SKIP][886] ([i915#14544] / [i915#16644])
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [SKIP][887] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][888] ([i915#17356]) +1 other test skip
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_hdr@static-swap.html
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          [SKIP][889] ([i915#14544] / [i915#15458]) -> [SKIP][890] ([i915#15458])
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          [SKIP][891] ([i915#6301]) -> [SKIP][892] ([i915#17356]) +1 other test skip
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_panel_fitting@atomic-fastset.html
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][893] ([i915#14544] / [i915#6301]) -> [SKIP][894] ([i915#6301])
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_panel_fitting@legacy.html
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-dg2:          [SKIP][895] ([i915#14712]) -> [SKIP][896] ([i915#17356])
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][897] ([i915#14544] / [i915#15709]) -> [SKIP][898] ([i915#15709]) +1 other test skip
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          [SKIP][899] ([i915#15709]) -> [SKIP][900] ([i915#14544] / [i915#15709])
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          [SKIP][901] ([i915#3555] / [i915#8821]) -> [SKIP][902] ([i915#17356])
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_plane_lowres@tiling-yf.html
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          [SKIP][903] ([i915#13958]) -> [SKIP][904] ([i915#17356]) +1 other test skip
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-4.html
   [904]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          [SKIP][905] ([i915#14259]) -> [SKIP][906] ([i915#17356])
   [905]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_plane_multiple@tiling-yf.html
   [906]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          [SKIP][907] ([i915#17356] / [i915#5354] / [i915#9423]) -> [SKIP][908] ([i915#13046] / [i915#5354] / [i915#9423])
   [907]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [908]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-rkl:          [SKIP][909] ([i915#14544] / [i915#15329]) -> [SKIP][910] ([i915#15329]) +7 other tests skip
   [909]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html
   [910]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          [SKIP][911] ([i915#12343] / [i915#5354]) -> [SKIP][912] ([i915#12343] / [i915#14544] / [i915#5354])
   [911]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-1/igt@kms_pm_backlight@bad-brightness.html
   [912]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          [SKIP][913] ([i915#12343]) -> [SKIP][914] ([i915#12343] / [i915#14544])
   [913]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@kms_pm_backlight@brightness-with-dpms.html
   [914]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg1:          [SKIP][915] ([i915#17434]) -> [SKIP][916] ([i915#17434] / [i915#4423])
   [915]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-12/igt@kms_pm_rpm@pc8-residency.html
   [916]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][917] ([i915#11520]) -> [SKIP][918] ([i915#11520] / [i915#14544]) +2 other tests skip
   [917]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [918]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][919] ([i915#11520] / [i915#14544]) -> [SKIP][920] ([i915#11520]) +3 other tests skip
   [919]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [920]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          [SKIP][921] ([i915#9683]) -> [SKIP][922] ([i915#14544] / [i915#9683])
   [921]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [922]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          [SKIP][923] ([i915#14544] / [i915#9683]) -> [SKIP][924] ([i915#9683])
   [923]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html
   [924]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          [SKIP][925] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][926] ([i915#1072] / [i915#9732]) +5 other tests skip
   [925]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html
   [926]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-rkl:          [SKIP][927] ([i915#1072] / [i915#9732]) -> [SKIP][928] ([i915#1072] / [i915#14544] / [i915#9732]) +8 other tests skip
   [927]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_psr@psr-cursor-mmap-cpu.html
   [928]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          [SKIP][929] ([i915#14544] / [i915#15949]) -> [SKIP][930] ([i915#15949]) +1 other test skip
   [929]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [930]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          [SKIP][931] ([i915#12755] / [i915#15867]) -> [SKIP][932] ([i915#17356]) +1 other test skip
   [931]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_rotation_crc@bad-tiling.html
   [932]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          [SKIP][933] ([i915#17432] / [i915#5289]) -> [SKIP][934] ([i915#14544] / [i915#17432] / [i915#5289])
   [933]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [934]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          [ABORT][935] ([i915#13179]) -> [ABORT][936] ([i915#13179] / [i915#16508]) +1 other test abort
   [935]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-12/igt@kms_selftest@drm_framebuffer.html
   [936]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][937] ([i915#8623]) -> [SKIP][938] ([i915#14544] / [i915#8623])
   [937]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [938]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic:
    - shard-dg2:          [SKIP][939] ([i915#15243] / [i915#3555]) -> [SKIP][940] ([i915#17356]) +1 other test skip
   [939]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_vrr@flip-basic.html
   [940]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - shard-rkl:          [SKIP][941] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][942] ([i915#15243] / [i915#3555])
   [941]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_vrr@flipline.html
   [942]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_vrr@flipline.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          [SKIP][943] ([i915#14544] / [i915#3708]) -> [SKIP][944] ([i915#3708]) +1 other test skip
   [943]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
   [944]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@prime_vgem@fence-flip-hang.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15314
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16108
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193
  [i915#16202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16202
  [i915#16226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16226
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16508
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16604]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16604
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17032]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17032
  [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17110]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17110
  [i915#17146]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17172
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
  [i915#17190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190
  [i915#17226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17226
  [i915#17230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17230
  [i915#17244]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17244
  [i915#17276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17276
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17288]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288
  [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291
  [i915#17319]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17319
  [i915#17356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
  [i915#17357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357
  [i915#17358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17358
  [i915#17373]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
  [i915#17374]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17374
  [i915#17375]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17375
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17429]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8063]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9162 -> IGTPW_16043

  CI-20190529: 20190529
  CI_DRM_19391: b255dd13059988fddde9ea187d1dd1017c9a5766 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16043: 16043
  IGT_9162: 9162

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/index.html

--===============8703642399000303564==
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
<tr><td><b>Series:</b></td><td>Ignore AER error and recovery messages in dmesg (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176295/">https://patchwork.freedesktop.org/series/176295/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9162_full -&gt; IGTPW_16043_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16043_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_16043_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_16043_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-128:<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-1-size-128.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16043_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814">i915#11814</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176">i915#17176</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-1/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk3/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-tglu-3/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress@blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@gem_eio@unwedge-stress@blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15314">i915#15314</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@gem_exec_big@single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16604">i915#16604</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@gem_exec_capture@capture.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904">i915#16904</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904">i915#16904</a>) +4 other tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904">i915#16904</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@gem_exec_flush@basic-wb-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_exec_reloc@basic-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@gem_exec_reloc@basic-range-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk8/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@gem_mmap@basic-small-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16108">i915#16108</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16202">i915#16202</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@gem_mmap_offset@clear-via-pagefault@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@gem_mmap_offset@clear-via-pagefault@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17374">i915#17374</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@invalid-flags:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@gem_mmap_wc@invalid-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@gem_mmap_wc@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@gem_pwrite@basic-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@gem_render_copy@yf-tiled-ccs-to-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433">i915#17433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk11/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gen3_render_mixed_blits.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@gen7_exec_parse@basic-offset.html">SKIP</a> +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@gen7_exec_parse@basic-offset.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-5/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@i915_drm_fdinfo@busy-idle@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@i915_drm_fdinfo@isolation@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@i915_drm_fdinfo@virtual-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk6/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@i915_pm_rps@thresholds-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@i915_pm_rps@thresholds-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk6/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk9/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk4/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> +466 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_cdclk@mode-rejected-max-dotclock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099">i915#17099</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464">i915#16464</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_color@background-color.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_color@background-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_color@ctm-negative.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915#15529</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063">i915#8063</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +96 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291">i915#17291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288">i915#17288</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288">i915#17288</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288">i915#17288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-5/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk11/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_feature_discovery@display-1x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738">i915#9738</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_flip@plain-flip-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_flip@plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +10 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +33 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-move.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +12 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk10:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +106 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> +184 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-19/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk10/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102">i915#17102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357">i915#17357</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101">i915#17101</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188">i915#17188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17110">i915#17110</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-1/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_invalid_mode@bad-htotal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_invalid_mode@zero-hdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412">i915#14412</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226">i915#10226</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17032">i915#17032</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441">i915#13441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-12/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_pm_rpm@fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-8/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk4/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk5/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#10553</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_properties@crtc-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_properties@crtc-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521">i915#11521</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-snb5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk11/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348">i915#4348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-2/igt@kms_psr@fbc-psr-cursor-plane-move@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_psr@pr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-snb7/igt@kms_psr@psr-sprite-blt.html">SKIP</a> +144 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@kms_psr@psr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_psr@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17226">i915#17226</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk11/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-snb6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk2/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-7/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100">i915#9100</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@perf@per-context-mode-unprivileged.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-3/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-4/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429">i915#17429</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-1/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429">i915#17429</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-14/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-5/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-5/igt@gem_eio@hibernate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190">i915#17190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@gem_exec_capture@pi.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17375">i915#17375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@gem_exec_capture@pi.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@ccs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@gem_exec_capture@pi@ccs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@gem_exec_capture@pi@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-3/igt@gem_exec_suspend@basic-s4-devices.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@gem_mmap_offset@clear-via-pagefault.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16108">i915#16108</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@gem_mmap_offset@clear-via-pagefault.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193">i915#16193</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk5/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16226">i915#16226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-18/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_async_flips@async-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_async_flips@async-flip-hang.html">PASS</a> +29 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-4/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150">i915#17150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685">i915#16685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_color@deep-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915#15529</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> +4 other tests pass</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_flip@flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17358">i915#17358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_flip@flip-vs-dpms-on-nop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_flip@flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_flip@flip-vs-panning.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17276">i915#17276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-2/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17319">i915#17319</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-2/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17172">i915#17172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_invalid_mode@zero-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_invalid_mode@zero-clock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-4/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17230">i915#17230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-3/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-4/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@prime_mmap_kms@buffer-sharing.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@prime_mmap_kms@buffer-sharing.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17244">i915#17244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146">i915#17146</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176">i915#17176</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146">i915#17146</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-tglu-2/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#15816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-tglu-9/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944">i915#15944</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gem_lmem_swapping@massive.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@gem_lmem_swapping@massive.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433">i915#17433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433">i915#17433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@gen3_render_linear_blits.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@gen3_render_tiledx_blits.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +2 other tests skip</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017">i915#16017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-4/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-12/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287">i915#17287</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291">i915#17291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-4/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-1/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-3/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-12/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-7/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg1-12/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg1-18/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16508">i915#16508</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-dg2-3/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-dg2-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-8/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9162/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16043/shard-rkl-3/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9162 -&gt; IGTPW_16043</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19391: b255dd13059988fddde9ea187d1dd1017c9a5766 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16043: 16043<br />
  IGT_9162: 9162</p>

</body>
</html>

--===============8703642399000303564==--
