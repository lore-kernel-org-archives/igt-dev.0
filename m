Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50502606A32A
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 10:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AD410E42F;
	Fri, 20 Nov 2026 10:11:52 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C59F112881;
 Fri, 20 Nov 2026 10:10:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2457668943804254147=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/i915=5Fhangm?=
 =?utf-8?q?an=3A_Add_engine-error-state-skipped-capture?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Nov 2026 10:10:48 -0000
Message-ID: <179516944834.58097.5996131038914801184@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118120112.5434-1-sebastian.brzezinka@intel.com>
In-Reply-To: <20261118120112.5434-1-sebastian.brzezinka@intel.com>
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

--===============2457668943804254147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_hangman: Add engine-error-state-skipped-capture
URL   : https://patchwork.freedesktop.org/series/178889/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9197_full -> IGTPW_16171_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16171_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16171_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16171_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_hangman@engine-error-state-skipped-capture} (NEW):
    - shard-dg2:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@i915_hangman@engine-error-state-skipped-capture.html
    - shard-snb:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@i915_hangman@engine-error-state-skipped-capture.html
    - shard-mtlp:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-4/igt@i915_hangman@engine-error-state-skipped-capture.html
    - shard-glk10:        NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@i915_hangman@engine-error-state-skipped-capture.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-tglu:         [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-5/igt@kms_pm_rpm@system-suspend-modeset.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@kms_pm_rpm@system-suspend-modeset.html

  
New tests
---------

  New tests have been introduced between IGT_9197_full and IGTPW_16171_full:

### New IGT tests (1) ###

  * igt@i915_hangman@engine-error-state-skipped-capture:
    - Statuses : 2 fail(s) 2 skip(s)
    - Exec time: [0.0, 6.52] s

  

Known issues
------------

  Here are the changes found in IGTPW_16171_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@bb-with-allocator:
    - shard-snb:          NOTRUN -> [SKIP][8] ([i915#17684])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@api_intel_bb@bb-with-allocator.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#8411])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-glk:          NOTRUN -> [SKIP][10] ([i915#17576])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#6230])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@api_intel_bb@crc32.html
    - shard-snb:          NOTRUN -> [SKIP][12] ([i915#17576])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#11078])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-snb:          NOTRUN -> [SKIP][14] ([i915#17620])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-glk:          NOTRUN -> [SKIP][15] ([i915#17537])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@dmabuf@dma-buf-fence-chain:
    - shard-glk:          NOTRUN -> [SKIP][17] ([i915#17712])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk2/igt@dmabuf@dma-buf-fence-chain.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#3936])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@gem_busy@semaphore.html
    - shard-snb:          NOTRUN -> [SKIP][19] ([i915#17671])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#3936])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-glk10:        NOTRUN -> [SKIP][21] ([i915#17499])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-glk:          NOTRUN -> [SKIP][22] ([i915#17499])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#17854])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-snb:          NOTRUN -> [SKIP][27] ([i915#17499]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][28] -> [INCOMPLETE][29] ([i915#13356] / [i915#16348])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_compute@compute-square:
    - shard-snb:          NOTRUN -> [SKIP][30] ([i915#17552])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_compute@compute-square.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-snb:          NOTRUN -> [SKIP][31] ([i915#17513])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@gem_create@create-ext-cpu-access-big.html
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#6335])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@gem_create@create-ext-cpu-access-big.html
    - shard-glk:          NOTRUN -> [SKIP][33] ([i915#17513])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk5/igt@gem_create@create-ext-cpu-access-big.html
    - shard-dg2:          NOTRUN -> [FAIL][34] ([i915#15454])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_isolation@preservation-s3@ccs0:
    - shard-mtlp:         NOTRUN -> [FAIL][35] ([i915#17176])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3@ccs0.html

  * igt@gem_ctx_param@set-priority-range:
    - shard-snb:          NOTRUN -> [SKIP][36] ([i915#17646])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@gem_ctx_param@set-priority-range.html

  * igt@gem_ctx_persistence@hang:
    - shard-glk:          NOTRUN -> [SKIP][37] ([i915#17527]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#8555]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-close.html
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#8555])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-snb:          NOTRUN -> [SKIP][40] ([i915#17621]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][41] ([i915#1099]) +7 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_shared@create-shared-gtt:
    - shard-snb:          NOTRUN -> [SKIP][42] ([i915#17342]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@gem_ctx_shared@create-shared-gtt.html

  * igt@gem_ctx_sseu@engines:
    - shard-glk:          NOTRUN -> [SKIP][43] ([i915#17496]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#280])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglu:         NOTRUN -> [SKIP][45] ([i915#280])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@gem_ctx_sseu@invalid-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#280])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#280]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-snb:          NOTRUN -> [SKIP][48] ([i915#17496]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_ctx_sseu@mmap-args.html
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#280]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          NOTRUN -> [ABORT][50] ([i915#17844] / [i915#7975])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@gem_eio@hibernate.html
    - shard-dg2:          NOTRUN -> [ABORT][51] ([i915#17844] / [i915#7975])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress@blt:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#15314])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@gem_eio@reset-stress@blt.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][53] ([i915#8898]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4812]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@gem_exec_balancer@bonded-true-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4812]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-glk10:        NOTRUN -> [SKIP][56] ([i915#17547])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-glk:          NOTRUN -> [SKIP][57] ([i915#17547]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_balancer@smoke:
    - shard-snb:          NOTRUN -> [SKIP][58] ([i915#17587]) +10 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [PASS][59] -> [FAIL][60] ([i915#15816])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-8/igt@gem_exec_big@single.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-9/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#6344])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@parallel:
    - shard-snb:          NOTRUN -> [SKIP][62] ([i915#17599]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_exec_fence@parallel.html

  * igt@gem_exec_fence@submit67:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4812])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-8/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3539] / [i915#4852]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3539] / [i915#4852])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_params@invalid-bsd2-flag-on-vebox:
    - shard-snb:          NOTRUN -> [SKIP][66] ([i915#17659])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_exec_params@invalid-bsd2-flag-on-vebox.html

  * igt@gem_exec_params@larger-than-life-batch:
    - shard-glk:          NOTRUN -> [SKIP][67] ([i915#16871])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@gem_exec_params@larger-than-life-batch.html
    - shard-snb:          NOTRUN -> [SKIP][68] ([i915#17662])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_exec_params@larger-than-life-batch.html

  * igt@gem_exec_params@secure-non-root:
    - shard-glk:          NOTRUN -> [SKIP][69] ([i915#17523])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@gem_exec_params@secure-non-root.html
    - shard-snb:          NOTRUN -> [SKIP][70] ([i915#17523])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#3281]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3281]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3281]) +15 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3281]) +15 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4537] / [i915#4812]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-snb:          NOTRUN -> [SKIP][76] ([i915#17590]) +11 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-snb:          NOTRUN -> [ABORT][77] ([i915#15840]) +6 other tests abort
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-snb:          NOTRUN -> [SKIP][78] ([i915#17655])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4860]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4860]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-glk:          NOTRUN -> [SKIP][81] ([i915#17605] / [i915#4613])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4613]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@gem_lmem_swapping@basic.html
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#14544] / [i915#4613])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-snb:          NOTRUN -> [SKIP][84] ([i915#17503]) +8 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4565]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-glk10:        NOTRUN -> [SKIP][86] ([i915#17503]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#4613])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#12193]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#4613]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][90] ([i915#17503] / [i915#4613]) +9 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_media_fill@media-fill:
    - shard-snb:          NOTRUN -> [SKIP][91] ([i915#17661])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-snb:          NOTRUN -> [SKIP][92] ([i915#17543])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_media_vme.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4083]) +6 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@gem_mmap@bad-object.html

  * igt@gem_mmap@pf-nonblock:
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#4083])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@gem_mmap@pf-nonblock.html

  * igt@gem_mmap_gtt@basic-wc:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4077]) +12 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@gem_mmap_gtt@basic-wc.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#4077]) +17 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#4077]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4083]) +8 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@gem_mmap_wc@close.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3282]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#3282]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3282]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][102] ([i915#2658])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][103] ([i915#2658]) +1 other test warn
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_pread@exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][104] ([i915#2658])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-glk10:        NOTRUN -> [SKIP][105] ([i915#17521]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-rkl:          ([PASS][106], [PASS][107]) -> [SKIP][108] ([i915#4270])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-glk:          NOTRUN -> [SKIP][109] ([i915#17521]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk5/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4270]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4270]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-snb:          NOTRUN -> [SKIP][112] ([i915#17521]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#3282]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#8428]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@gem_render_copy@y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-x-tiled:
    - shard-snb:          NOTRUN -> [SKIP][115] ([i915#17591]) +7 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][116] ([i915#17492]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-snb:          NOTRUN -> [SKIP][117] ([i915#17492]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html
    - shard-glk10:        NOTRUN -> [SKIP][118] ([i915#17492])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#5190] / [i915#8428]) +10 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#4079]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#8411]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#4079]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4079])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-prime:
    - shard-snb:          NOTRUN -> [SKIP][124] ([i915#17471]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@gem_softpin@evict-prime.html

  * igt@gem_softpin@evict-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#17430])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@gem_softpin@evict-snoop.html
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#4885]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@gem_softpin@evict-snoop.html
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#17430])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#4885])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@gem_softpin@evict-snoop.html
    - shard-glk:          NOTRUN -> [SKIP][129] ([i915#17551])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk5/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#4885])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@access-control:
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#3297])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@gem_userptr_blits@access-control.html
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#3297])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#3297]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#3297]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#3282] / [i915#3297])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#3282] / [i915#3297])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#3297] / [i915#4958])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@gem_userptr_blits@sd-probe.html
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#3297] / [i915#4958])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-snb:          NOTRUN -> [SKIP][139] ([i915#17507]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-glk:          NOTRUN -> [SKIP][140] ([i915#17507]) +3 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#3297]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][142] ([i915#17596]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_vm_create@invalid-create.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          ([PASS][143], [PASS][144]) -> [INCOMPLETE][145] ([i915#13356] / [i915#14586])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk9/igt@gem_workarounds@suspend-resume.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk4/igt@gem_workarounds@suspend-resume.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk2/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [PASS][146] -> [INCOMPLETE][147] ([i915#13356] / [i915#14586])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk2/igt@gem_workarounds@suspend-resume-fd.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen3_render_linear_blits:
    - shard-glk:          NOTRUN -> [SKIP][148] ([i915#17555])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@gen3_render_linear_blits.html

  * igt@gen3_render_tiledx_blits:
    - shard-snb:          NOTRUN -> [SKIP][149] ([i915#17511])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gen3_render_tiledx_blits.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#17455]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-glk:          NOTRUN -> [SKIP][151] ([i915#17505])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk6/igt@gen7_exec_parse@basic-allocation.html
    - shard-snb:          NOTRUN -> [SKIP][152] ([i915#17505])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][153] ([i915#17597]) +8 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#14544] / [i915#2527])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#2856])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#2527] / [i915#2856]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-9/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#2856]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#2527]) +5 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_drm_fdinfo@busy-check-all@vecs0:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#11527]) +7 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@i915_drm_fdinfo@busy-check-all@vecs0.html

  * igt@i915_drm_fdinfo@busy-idle@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#14073]) +11 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@i915_drm_fdinfo@busy-idle@bcs0.html

  * igt@i915_drm_fdinfo@busy-idle@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#14073]) +6 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@i915_drm_fdinfo@busy-idle@rcs0.html

  * igt@i915_drm_fdinfo@busy@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#14073]) +23 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@i915_drm_fdinfo@busy@vecs1.html

  * igt@i915_drm_fdinfo@virtual-busy-hang:
    - shard-snb:          NOTRUN -> [SKIP][163] ([i915#17603]) +8 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@i915_drm_fdinfo@virtual-busy-hang.html

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#14118]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#14118]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#13786])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@i915_fb_tiling@basic-x-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#13786])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][168] ([i915#17580])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_hangman@engine-engine-hang:
    - shard-snb:          NOTRUN -> [SKIP][169] ([i915#17610]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@i915_hangman@engine-engine-hang.html

  * igt@i915_module_load@fault-injection:
    - shard-snb:          NOTRUN -> [ABORT][170] ([i915#15342] / [i915#15840])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - shard-snb:          NOTRUN -> [DMESG-WARN][171] ([i915#17755])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-snb:          NOTRUN -> [ABORT][172] ([i915#15342])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@intel_guc_ct_init:
    - shard-snb:          NOTRUN -> [SKIP][173] ([i915#17600]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@i915_module_load@fault-injection@intel_guc_ct_init.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#6412])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#8399])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#8399])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-snb:          NOTRUN -> [SKIP][177] ([i915#17526]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@i915_pm_freq_api@freq-suspend.html
    - shard-glk:          NOTRUN -> [SKIP][178] ([i915#17526])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu:         NOTRUN -> [SKIP][179] ([i915#6590]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#6590]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@i915_pm_freq_mult@media-freq@gt1.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-snb:          NOTRUN -> [SKIP][181] ([i915#17541])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-snb:          NOTRUN -> [SKIP][182] ([i915#17690])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#11681])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#11681])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@i915_pm_rps@thresholds-park.html
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#11681])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         NOTRUN -> [FAIL][186] ([i915#15365])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@i915_pm_rps@waitboost.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#6245])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-kernel-writes:
    - shard-snb:          NOTRUN -> [SKIP][188] ([i915#17629])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@i915_query@query-topology-kernel-writes.html

  * igt@i915_query@query-topology-unsupported:
    - shard-glk:          NOTRUN -> [SKIP][189] ([i915#17563])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@i915_query@query-topology-unsupported.html
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#16079])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@i915_query@query-topology-unsupported.html
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#16079])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#5723])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][193] ([i915#13356] / [i915#16182] / [i915#4817])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk11/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][194] ([i915#13356] / [i915#16182] / [i915#4817]) +1 other test incomplete
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@i915_suspend@forcewake.html
    - shard-tglu:         [PASS][195] -> [ABORT][196] ([i915#15840])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-5/igt@i915_suspend@forcewake.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@i915_suspend@forcewake.html

  * igt@i915_suspend@sysfs-reader:
    - shard-dg1:          NOTRUN -> [ABORT][197] ([i915#17844]) +9 other tests abort
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#7707])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#5190]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-snb:          NOTRUN -> [SKIP][200] ([i915#17469])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#4212])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#4212]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_addfb_basic@clobberred-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#4212])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][204] ([i915#12761] / [i915#13356] / [i915#14995])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-glk10:        NOTRUN -> [SKIP][205] ([i915#17562])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#9531])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglu:         [PASS][207] -> [FAIL][208] ([i915#15662]) +1 other test fail
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#1769] / [i915#3555])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#1769] / [i915#3555])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][211] ([i915#1769])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#17432] / [i915#5286]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#5286])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb.html
    - shard-snb:          NOTRUN -> [SKIP][214] ([i915#17556]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-glk:          NOTRUN -> [SKIP][215] ([i915#17544])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
    - shard-snb:          NOTRUN -> [SKIP][216] ([i915#17544])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#4538] / [i915#5286])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#4538] / [i915#5286]) +6 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-glk10:        NOTRUN -> [SKIP][219] ([i915#17478]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#3638]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-snb:          NOTRUN -> [SKIP][221] ([i915#17500]) +8 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-glk10:        NOTRUN -> [SKIP][222] ([i915#17500]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#17431] / [i915#3638]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][224] ([i915#17431])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#3828])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#3828])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-glk:          NOTRUN -> [SKIP][227] ([i915#17500]) +11 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#17431]) +4 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#17431]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-snb:          NOTRUN -> [SKIP][230] ([i915#17630])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-snb:          NOTRUN -> [SKIP][231] ([i915#17557]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-glk11:        NOTRUN -> [SKIP][232] ([i915#17500])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#17432]) +7 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#4538] / [i915#5190]) +17 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#17432]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#4538]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-snb:          NOTRUN -> [SKIP][237] ([i915#17478]) +34 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#4538]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][239] ([i915#17478]) +14 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          ([PASS][240], [PASS][241]) -> [DMESG-WARN][242] ([i915#13363])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
    - shard-tglu:         [PASS][243] -> [DMESG-WARN][244] ([i915#13363])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-9/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - shard-tglu:         [PASS][245] -> [DMESG-WARN][246] ([i915#17147])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-9/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
    - shard-rkl:          ([PASS][247], [PASS][248]) -> [DMESG-WARN][249] ([i915#17147])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#6095]) +124 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#10307] / [i915#6095]) +86 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#6095]) +49 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][254] ([i915#17490] / [i915#17491]) +13 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-snb:          NOTRUN -> [SKIP][255] ([i915#17594]) +32 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#14544] / [i915#6095]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][257] ([i915#17491]) +36 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#14098] / [i915#14544] / [i915#6095])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#6095]) +54 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][260] ([i915#17491]) +124 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-glk:          NOTRUN -> [SKIP][261] ([i915#17525]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#12805])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-glk:          NOTRUN -> [SKIP][263] ([i915#17490] / [i915#17491]) +49 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#14098] / [i915#6095]) +26 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][265] ([i915#17158])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#6095]) +9 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#12313])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#12313])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#6095]) +39 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-glk:          NOTRUN -> [SKIP][270] ([i915#17550]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_cdclk@mode-rejected-max-dotclock.html
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#17099])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_cdclk@mode-rejected-max-dotclock.html
    - shard-snb:          NOTRUN -> [SKIP][272] ([i915#17550]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#16017])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#3742])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#16017])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#13781]) +4 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#11151])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-snb:          NOTRUN -> [SKIP][278] ([i915#17489]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-glk10:        NOTRUN -> [SKIP][279] ([i915#17489])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-glk:          NOTRUN -> [SKIP][280] ([i915#17489]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_chamelium_color@ctm-negative.html
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#17427]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_chamelium_color@ctm-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#17427]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@kms_chamelium_color@ctm-negative.html
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#17427])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_chamelium_color@ctm-negative.html
    - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#17427])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#16464] / [i915#16471] / [i915#17427]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#17427]) +6 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html
    - shard-glk10:        NOTRUN -> [SKIP][287] ([i915#17497])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-glk:          NOTRUN -> [SKIP][288] ([i915#17497]) +4 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#16471] / [i915#17427]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#16471] / [i915#17427]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#16471] / [i915#17427]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
    - shard-snb:          NOTRUN -> [SKIP][292] ([i915#17497]) +7 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-glk11:        NOTRUN -> [SKIP][293] ([i915#17497])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk11/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-glk:          NOTRUN -> [SKIP][294] ([i915#17483]) +11 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#11151] / [i915#7828]) +12 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-glk10:        NOTRUN -> [SKIP][296] ([i915#17483]) +3 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#11151] / [i915#7828]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#11151] / [i915#14544] / [i915#7828])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#11151] / [i915#7828]) +9 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-snb:          NOTRUN -> [SKIP][300] ([i915#17483]) +12 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#11151] / [i915#7828]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#11151] / [i915#7828]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_color@invalid-degamma-lut-sizes:
    - shard-snb:          NOTRUN -> [SKIP][303] ([i915#17656]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_color@invalid-degamma-lut-sizes.html

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][304] ([i915#17657])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_color@invalid-degamma-lut-sizes@pipe-a.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][305] ([i915#17510])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][306] ([i915#17510]) +7 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk2/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html
    - shard-snb:          NOTRUN -> [SKIP][307] ([i915#17510]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#16990]) +23 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#16990]) +31 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#15865]) +4 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_content_protection@atomic-hdcp14.html
    - shard-snb:          NOTRUN -> [SKIP][311] ([i915#17508]) +4 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#15330] / [i915#3116] / [i915#3299])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#15330] / [i915#3299]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-snb:          NOTRUN -> [SKIP][314] ([i915#17502]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#15330] / [i915#3299]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#15330] / [i915#3299])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-glk:          NOTRUN -> [SKIP][317] ([i915#17502])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#15330])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#15330])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#15330])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#15865])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#15865]) +5 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#15865]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-9/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-glk:          NOTRUN -> [SKIP][324] ([i915#17508]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk1/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#3555]) +7 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#3555]) +6 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#13049]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-snb:          NOTRUN -> [SKIP][328] ([i915#17533]) +2 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#13049]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-glk10:        NOTRUN -> [SKIP][330] ([i915#17504]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-glk:          NOTRUN -> [SKIP][331] ([i915#17533]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#3555]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][333] ([i915#3555] / [i915#8814])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html
    - shard-glk11:        NOTRUN -> [SKIP][334] ([i915#17504])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk11/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-snb:          NOTRUN -> [SKIP][335] ([i915#17504]) +10 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          ([PASS][336], [PASS][337]) -> [FAIL][338] ([i915#13566])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][339] -> [FAIL][340] ([i915#13566])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-glk:          NOTRUN -> [SKIP][341] ([i915#17504]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-tglu:         ([PASS][342], [PASS][343]) -> [FAIL][344] ([i915#13566]) +3 other tests fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#4103]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-snb:          NOTRUN -> [SKIP][346] ([i915#17457]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#17428] / [i915#9809])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#13046] / [i915#17454] / [i915#5354]) +5 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#17428] / [i915#17454]) +3 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][350] ([i915#15804])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#4103])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-glk:          NOTRUN -> [SKIP][352] ([i915#17457]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-glk10:        NOTRUN -> [SKIP][353] ([i915#17515])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-snb:          NOTRUN -> [SKIP][354] ([i915#17486]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][355] ([i915#17487])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][356] ([i915#17486]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2:          NOTRUN -> [SKIP][357] ([i915#17289])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#17286])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-snb:          NOTRUN -> [SKIP][359] ([i915#17506])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-glk10:        NOTRUN -> [SKIP][360] ([i915#17506])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-snb:          NOTRUN -> [SKIP][361] ([i915#17531])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#13748])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_dp_link_training@uhbr-mst.html
    - shard-snb:          NOTRUN -> [SKIP][363] ([i915#17477])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#13748]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-glk:          NOTRUN -> [SKIP][365] ([i915#17477]) +2 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-glk:          NOTRUN -> [SKIP][366] ([i915#17625])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-snb:          NOTRUN -> [SKIP][367] ([i915#17625])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][368] ([i915#16867])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][369] ([i915#13707])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-glk:          NOTRUN -> [SKIP][370] ([i915#17548])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-dg2:          NOTRUN -> [SKIP][371] ([i915#16867]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-snb:          NOTRUN -> [SKIP][372] ([i915#17548])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#16867])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#8812]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#8812])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#16361]) +5 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-snb:          NOTRUN -> [SKIP][377] ([i915#17458]) +8 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-tglu:         NOTRUN -> [SKIP][378] ([i915#16361]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][379] ([i915#16361])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#16361]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
    - shard-glk10:        NOTRUN -> [SKIP][381] ([i915#17458])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-glk:          NOTRUN -> [SKIP][382] ([i915#17458]) +6 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#16361]) +6 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_explicit_fence@multiplane-atomic-fence-wait:
    - shard-snb:          NOTRUN -> [SKIP][384] ([i915#17623])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_explicit_fence@multiplane-atomic-fence-wait.html

  * igt@kms_fbcon_fbt@psr:
    - shard-glk10:        NOTRUN -> [SKIP][385] ([i915#17516])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-mtlp:         [PASS][386] -> [FAIL][387] ([i915#17189] / [i915#17349])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-1/igt@kms_fbcon_fbt@psr-suspend.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-glk:          NOTRUN -> [SKIP][388] ([i915#17666])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_feature_discovery@display-4x.html
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#16081])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_feature_discovery@display-4x.html
    - shard-snb:          NOTRUN -> [SKIP][390] ([i915#17666])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dsc:
    - shard-glk10:        NOTRUN -> [SKIP][391] ([i915#17539]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@hdr:
    - shard-rkl:          NOTRUN -> [SKIP][392] ([i915#16600])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_feature_discovery@hdr.html
    - shard-snb:          NOTRUN -> [SKIP][393] ([i915#17539])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_feature_discovery@hdr.html
    - shard-mtlp:         NOTRUN -> [SKIP][394] ([i915#16600])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr1:
    - shard-snb:          NOTRUN -> [SKIP][395] ([i915#17707])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_feature_discovery@psr1.html
    - shard-glk:          NOTRUN -> [SKIP][396] ([i915#17707])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][397] ([i915#658]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][398] ([i915#658])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@kms_feature_discovery@psr2.html
    - shard-snb:          NOTRUN -> [SKIP][399] ([i915#17585])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][400] ([i915#4881])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_fence_pin_leak.html
    - shard-dg1:          NOTRUN -> [SKIP][401] ([i915#4881])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][402] ([i915#3637] / [i915#9934]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][403] ([i915#9934]) +11 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu:         NOTRUN -> [SKIP][404] ([i915#9934])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - shard-mtlp:         NOTRUN -> [SKIP][405] ([i915#9934])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][406] ([i915#9934]) +3 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][407] ([i915#3637] / [i915#9934]) +4 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#9934]) +10 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][409] ([i915#8381])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_flip@flip-vs-fences-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][410] ([i915#8381])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-rkl:          ([PASS][411], [PASS][412]) -> [INCOMPLETE][413] ([i915#16276] / [i915#6113])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-rkl:          [PASS][414] -> [INCOMPLETE][415] ([i915#16276] / [i915#6113])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][416] ([i915#17484]) +4 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][417] ([i915#15643]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][418] ([i915#15643]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-snb:          NOTRUN -> [SKIP][419] ([i915#17593]) +16 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][420] ([i915#17522]) +5 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-glk10:        NOTRUN -> [SKIP][421] ([i915#17484]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][422] ([i915#15643]) +2 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][423] ([i915#15643]) +2 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][424] ([i915#15643]) +2 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][425] ([i915#15643] / [i915#5190]) +3 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][426] ([i915#17493]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][427] ([i915#15990] / [i915#8708]) +4 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][428] ([i915#15990] / [i915#8708]) +28 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][429] ([i915#17428] / [i915#1825]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-snb:          NOTRUN -> [SKIP][430] ([i915#17609])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][431] ([i915#15989]) +20 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-glk:          NOTRUN -> [SKIP][432] ([i915#17517]) +55 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][433] ([i915#15989]) +8 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][434] ([i915#15989]) +16 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][435] ([i915#15991] / [i915#17428]) +13 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-snb:          NOTRUN -> [SKIP][436] ([i915#17588]) +181 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][437] ([i915#17559])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-snb:          NOTRUN -> [SKIP][438] ([i915#17559])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][439] ([i915#5439]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][440] ([i915#15104] / [i915#15990]) +2 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][441] ([i915#15102]) +26 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][442] ([i915#15990] / [i915#8708]) +24 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][443] ([i915#15991] / [i915#5354]) +39 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk11:        NOTRUN -> [SKIP][444] ([i915#17482])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][445] ([i915#5439])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - shard-dg1:          NOTRUN -> [SKIP][446] ([i915#15102]) +39 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-onoff:
    - shard-glk10:        NOTRUN -> [SKIP][447] ([i915#17482]) +40 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][448] ([i915#15990]) +22 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][449] ([i915#15990]) +29 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][450] ([i915#14544] / [i915#17428]) +2 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][451] ([i915#17517]) +36 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][452] ([i915#15989]) +4 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][453] ([i915#17428]) +86 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [PASS][454] -> [SKIP][455] ([i915#17517]) +9 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:
    - shard-dg1:          NOTRUN -> [SKIP][456] ([i915#15989]) +16 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html
    - shard-snb:          NOTRUN -> [SKIP][457] ([i915#17606]) +2 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][458] ([i915#14544] / [i915#15102]) +3 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][459] ([i915#15104] / [i915#15990]) +2 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][460] ([i915#17482]) +133 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][461] ([i915#15102]) +53 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][462] ([i915#15991] / [i915#17428] / [i915#1825]) +14 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][463] ([i915#15102]) +18 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-snb:          NOTRUN -> [SKIP][464] ([i915#17482]) +79 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][465] ([i915#17428]) +47 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][466] ([i915#17428]) +25 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][467] ([i915#15991]) +56 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][468] ([i915#15990]) +3 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-mmap-gtt.html

  * igt@kms_getfb@getfb-reject-nv12:
    - shard-snb:          NOTRUN -> [SKIP][469] ([i915#17636])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_getfb@getfb-reject-nv12.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-snb:          NOTRUN -> [FAIL][470] ([i915#17104])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdmi_audio_bw@dpms-audio-recovery:
    - shard-mtlp:         NOTRUN -> [SKIP][471] ([i915#17103])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-4/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-glk:          NOTRUN -> [INCOMPLETE][472] ([i915#13356])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk1/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-snb:          NOTRUN -> [SKIP][473] ([i915#17681])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-mtlp:         ([PASS][474], [PASS][475]) -> [INCOMPLETE][476] ([i915#17319]) +1 other test incomplete
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-3/igt@kms_hdr@bpc-switch-suspend.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-6/igt@kms_hdr@bpc-switch-suspend.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-8/igt@kms_hdr@bpc-switch-suspend.html
    - shard-glk10:        NOTRUN -> [SKIP][477] ([i915#17498]) +1 other test skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010:
    - shard-mtlp:         ([PASS][478], [PASS][479]) -> [FAIL][480] ([i915#17172])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-8/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][481] ([i915#15436]) +1 other test incomplete
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010.html

  * igt@kms_hdr@invalid-hdr:
    - shard-glk:          NOTRUN -> [SKIP][482] ([i915#17498]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-snb:          NOTRUN -> [SKIP][483] ([i915#17498]) +3 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_hdr@static-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][484] ([i915#3555] / [i915#8228]) +1 other test skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][485] ([i915#16518] / [i915#3555] / [i915#8228]) +3 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][486] ([i915#15460])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_joiner@basic-big-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][487] ([i915#17512])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_joiner@basic-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][488] ([i915#15460])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][489] ([i915#15459])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][490] ([i915#15459])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][491] ([i915#17678])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][492] ([i915#15459])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-glk:          NOTRUN -> [SKIP][493] ([i915#17678])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-glk10:        NOTRUN -> [SKIP][494] ([i915#17567])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][495] ([i915#17567])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][496] ([i915#17617])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][497] ([i915#15638] / [i915#15722])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][498] ([i915#15638] / [i915#15722])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][499] ([i915#15638] / [i915#15722])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][500] ([i915#17617])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-dg2:          NOTRUN -> [SKIP][501] ([i915#16451])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_mst@mst-suspend-read-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][502] ([i915#16451])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_mst@mst-suspend-read-crc.html
    - shard-snb:          NOTRUN -> [SKIP][503] ([i915#17579])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][504] ([i915#17455])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][505] ([i915#118])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-glk10:        NOTRUN -> [SKIP][506] ([i915#17479]) +1 other test skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][507] ([i915#15709]) +1 other test skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-glk:          NOTRUN -> [SKIP][508] ([i915#17479]) +4 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][509] ([i915#16386]) +9 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][510] ([i915#15709]) +3 other tests skip
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:
    - shard-mtlp:         NOTRUN -> [SKIP][511] ([i915#16386]) +1 other test skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-snb:          NOTRUN -> [SKIP][512] ([i915#17479]) +13 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][513] ([i915#15709]) +2 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][514] ([i915#16386]) +3 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][515] ([i915#15709]) +6 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][516] ([i915#17494]) +3 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][517] ([i915#16386]) +1 other test skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][518] ([i915#15709]) +6 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-snb:          NOTRUN -> [SKIP][519] ([i915#17598])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-glk:          NOTRUN -> [SKIP][520] ([i915#17700])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
    - shard-dg2:          NOTRUN -> [SKIP][521] ([i915#16112])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
    - shard-dg1:          NOTRUN -> [SKIP][522] ([i915#16112])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][523] ([i915#12178])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][524] ([i915#7862]) +1 other test fail
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][525] ([i915#10647] / [i915#12177])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][526] ([i915#10647]) +1 other test fail
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@coverage-7efc:
    - shard-snb:          NOTRUN -> [SKIP][527] ([i915#17595]) +3 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_plane_alpha_blend@coverage-7efc.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-snb:          NOTRUN -> [SKIP][528] ([i915#17509])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2:          NOTRUN -> [SKIP][529] ([i915#13958])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-x.html
    - shard-rkl:          NOTRUN -> [SKIP][530] ([i915#13958])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-x.html
    - shard-dg1:          NOTRUN -> [SKIP][531] ([i915#13958])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-snb:          NOTRUN -> [SKIP][532] ([i915#17542])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][533] ([i915#14259])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          NOTRUN -> [SKIP][534] ([i915#17832] / [i915#6953])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][535] ([i915#17832] / [i915#6953])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-snb:          NOTRUN -> [SKIP][536] ([i915#17528]) +11 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-snb:          NOTRUN -> [SKIP][537] ([i915#17626])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][538] ([i915#17832])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-hdmi-a-1-xyuv8888:
    - shard-glk10:        NOTRUN -> [SKIP][539] ([i915#17833]) +8 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-c-hdmi-a-1-xyuv8888.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][540] ([i915#17832]) +1 other test skip
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-1-xv36:
    - shard-tglu:         NOTRUN -> [SKIP][541] ([i915#17843]) +11 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-1-xv36.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-c-hdmi-a-1-xrgb16161616f:
    - shard-rkl:          NOTRUN -> [SKIP][542] ([i915#17843]) +8 other tests skip
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-c-hdmi-a-1-xrgb16161616f.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-yuyv:
    - shard-glk:          NOTRUN -> [SKIP][543] ([i915#17833]) +8 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk8/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-yuyv.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][544] ([i915#17832]) +3 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][545] ([i915#17529])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled:
    - shard-glk:          NOTRUN -> [SKIP][546] ([i915#17528]) +1 other test skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-rgb565:
    - shard-glk10:        NOTRUN -> [SKIP][547] ([i915#17843]) +2 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-rgb565.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][548] ([i915#12343])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][549] ([i915#12343])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][550] ([i915#12343])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-glk10:        NOTRUN -> [SKIP][551] ([i915#17462])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-glk:          NOTRUN -> [SKIP][552] ([i915#17462]) +1 other test skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-snb:          NOTRUN -> [SKIP][553] ([i915#17462]) +1 other test skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-dg1:          NOTRUN -> [SKIP][554] ([i915#9685])
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][555] ([i915#16914])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu:         NOTRUN -> [SKIP][556] ([i915#3828])
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-glk:          NOTRUN -> [SKIP][557] ([i915#17703])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-snb:          NOTRUN -> [SKIP][558] ([i915#17602])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_pm_dc@dc6-psr.html
    - shard-glk10:        NOTRUN -> [SKIP][559] ([i915#17564])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-snb:          NOTRUN -> [SKIP][560] ([i915#17618])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-glk:          NOTRUN -> [SKIP][561] ([i915#17573])
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-tglu:         [PASS][562] -> [SKIP][563] ([i915#17764])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-5/igt@kms_pm_rpm@dpms-lpsp.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg1:          [PASS][564] -> [SKIP][565] ([i915#15073])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-dg1-18/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-glk:          NOTRUN -> [SKIP][566] ([i915#15073])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg2:          NOTRUN -> [SKIP][567] ([i915#15073])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][568] ([i915#15073])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-dg1:          NOTRUN -> [SKIP][569] ([i915#17434] / [i915#17450])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-snb:          NOTRUN -> [SKIP][570] ([i915#17473]) +10 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-rkl:          ([PASS][571], [PASS][572]) -> [INCOMPLETE][573] ([i915#14419])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_pm_rpm@system-suspend-idle.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_pm_rpm@system-suspend-idle.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][574] ([i915#6524])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_properties@colorop-properties-atomic:
    - shard-glk:          NOTRUN -> [SKIP][575] ([i915#17481])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_properties@colorop-properties-atomic.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-snb:          NOTRUN -> [SKIP][576] ([i915#17481]) +1 other test skip
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][577] ([i915#11520]) +5 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][578] ([i915#11520]) +12 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][579] ([i915#11520]) +3 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][580] ([i915#11520]) +6 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-glk10:        NOTRUN -> [SKIP][581] ([i915#11520]) +3 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][582] ([i915#11520]) +3 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
    - shard-mtlp:         NOTRUN -> [SKIP][583] ([i915#12316]) +1 other test skip
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][584] ([i915#11520]) +13 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-mtlp:         NOTRUN -> [SKIP][585] ([i915#4348])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-snb:          NOTRUN -> [SKIP][586] ([i915#17546]) +1 other test skip
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-glk:          NOTRUN -> [SKIP][587] ([i915#17546])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-snb:          NOTRUN -> [SKIP][588] ([i915#17480]) +33 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-glk:          NOTRUN -> [SKIP][589] ([i915#17480]) +26 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-rkl:          NOTRUN -> [SKIP][590] ([i915#1072] / [i915#9732]) +7 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][591] ([i915#9732]) +13 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_psr@fbc-psr-no-drrs.html
    - shard-mtlp:         NOTRUN -> [SKIP][592] ([i915#9688]) +6 other tests skip
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][593] ([i915#1072] / [i915#14544] / [i915#9732])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][594] ([i915#1072] / [i915#9732]) +26 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][595] ([i915#17480] / [i915#9732])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-glk10:        NOTRUN -> [SKIP][596] ([i915#17480]) +7 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][597] ([i915#1072] / [i915#9732]) +30 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][598] ([i915#4077] / [i915#9688]) +1 other test skip
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-snb:          NOTRUN -> [SKIP][599] ([i915#17554])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][600] ([i915#15949])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][601] ([i915#15949])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          NOTRUN -> [INCOMPLETE][602] ([i915#15500] / [i915#16184])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
    - shard-snb:          NOTRUN -> [SKIP][603] ([i915#17634])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-snb:          NOTRUN -> [SKIP][604] ([i915#17488]) +7 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-dg2:          NOTRUN -> [SKIP][605] ([i915#12755] / [i915#15867])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-glk:          NOTRUN -> [SKIP][606] ([i915#17488]) +3 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][607] ([i915#15867]) +2 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][608] ([i915#12755] / [i915#15867] / [i915#5190]) +1 other test skip
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-glk10:        NOTRUN -> [SKIP][609] ([i915#17488])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-snb:          NOTRUN -> [SKIP][610] ([i915#17501]) +1 other test skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_scaling_modes@scaling-mode-center.html
    - shard-glk10:        NOTRUN -> [SKIP][611] ([i915#17501])
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][612] ([i915#3555]) +4 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][613] ([i915#3555] / [i915#8809] / [i915#8823])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][614] ([i915#10959])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-snb:          NOTRUN -> [SKIP][615] ([i915#17672])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2:          NOTRUN -> [ABORT][616] ([i915#17844]) +12 other tests abort
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_vblank@ts-continuation-dpms-suspend.html
    - shard-mtlp:         ([PASS][617], [PASS][618]) -> [INCOMPLETE][619] ([i915#12276]) +1 other test incomplete
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-7/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:
    - shard-mtlp:         ([PASS][620], [PASS][621]) -> [FAIL][622] ([i915#17209])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][623] ([i915#17752]) +3 other tests dmesg-warn
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][624] ([i915#12276] / [i915#13356]) +3 other tests incomplete
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][625] ([i915#15840] / [i915#17752]) +1 other test dmesg-warn
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-glk:          NOTRUN -> [SKIP][626] ([i915#17520]) +1 other test skip
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg2:          NOTRUN -> [SKIP][627] ([i915#9906])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html
    - shard-snb:          NOTRUN -> [SKIP][628] ([i915#17520])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][629] ([i915#9906])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         NOTRUN -> [SKIP][630] ([i915#3555] / [i915#8808])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@kms_vrr@flipline.html
    - shard-rkl:          NOTRUN -> [SKIP][631] ([i915#15243] / [i915#3555])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-tglu:         NOTRUN -> [SKIP][632] ([i915#9906])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@kms_vrr@max-min.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-snb:          NOTRUN -> [SKIP][633] ([i915#17592]) +12 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf@gen12-mi-rpc:
    - shard-glk:          NOTRUN -> [SKIP][634] ([i915#17536])
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk5/igt@perf@gen12-mi-rpc.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-glk10:        NOTRUN -> [SKIP][635] ([i915#17536])
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-glk:          NOTRUN -> [SKIP][636] ([i915#17704])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk8/igt@perf@per-context-mode-unprivileged.html
    - shard-dg2:          NOTRUN -> [SKIP][637] ([i915#17455]) +1 other test skip
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@perf@per-context-mode-unprivileged.html
    - shard-dg1:          NOTRUN -> [SKIP][638] ([i915#17455] / [i915#2433])
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy:
    - shard-rkl:          [PASS][639] -> [FAIL][640] ([i915#4349]) +1 other test fail
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@perf_pmu@busy.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@perf_pmu@busy.html

  * igt@perf_pmu@busy-accuracy-50@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][641] ([i915#17651]) +1 other test skip
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@perf_pmu@busy-accuracy-50@bcs0.html

  * igt@perf_pmu@busy-double-start@vcs0:
    - shard-mtlp:         ([PASS][642], [PASS][643]) -> [FAIL][644] ([i915#4349])
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-2/igt@perf_pmu@busy-double-start@vcs0.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-8/igt@perf_pmu@busy-double-start@vcs0.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@perf_pmu@busy-double-start@vcs0.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][645] ([i915#17416]) +1 other test skip
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@perf_pmu@event-wait@rcs0.html
    - shard-dg1:          NOTRUN -> [SKIP][646] ([i915#17416]) +1 other test skip
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@perf_pmu@event-wait@rcs0.html
    - shard-glk10:        NOTRUN -> [SKIP][647] ([i915#17698]) +1 other test skip
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-glk:          NOTRUN -> [SKIP][648] ([i915#17583])
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk3/igt@perf_pmu@rc6-all-gts.html
    - shard-dg2:          NOTRUN -> [SKIP][649] ([i915#8516])
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@perf_pmu@rc6-all-gts.html
    - shard-snb:          NOTRUN -> [SKIP][650] ([i915#17583]) +1 other test skip
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@perf_pmu@rc6-all-gts.html
    - shard-dg1:          NOTRUN -> [SKIP][651] ([i915#8516])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt0:
    - shard-snb:          NOTRUN -> [SKIP][652] ([i915#17687]) +1 other test skip
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@perf_pmu@rc6@runtime-pm-long-gt0.html

  * igt@perf_pmu@semaphore-wait-idle@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][653] ([i915#17648]) +1 other test skip
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@perf_pmu@semaphore-wait-idle@bcs0.html

  * igt@perf_pmu@semaphore-wait-idle@vcs0:
    - shard-snb:          NOTRUN -> [SKIP][654] ([i915#17637]) +5 other tests skip
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb1/igt@perf_pmu@semaphore-wait-idle@vcs0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][655] ([i915#3291] / [i915#3708])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][656] ([i915#3708] / [i915#4077])
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@prime_vgem@basic-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][657] ([i915#3708] / [i915#4077])
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][658] ([i915#3708])
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@prime_vgem@fence-flip-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][659] ([i915#3708])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html
    - shard-snb:          NOTRUN -> [SKIP][660] ([i915#17467])
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb6/igt@prime_vgem@fence-flip-hang.html
    - shard-glk10:        NOTRUN -> [SKIP][661] ([i915#17467])
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk10/igt@prime_vgem@fence-flip-hang.html

  * igt@sysfs_preempt_timeout@timeout:
    - shard-snb:          NOTRUN -> [SKIP][662] ([i915#17631]) +1 other test skip
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@sysfs_preempt_timeout@timeout.html

  * igt@sysfs_timeslice_duration@idempotent@vcs0:
    - shard-snb:          NOTRUN -> [SKIP][663] ([i915#17632]) +5 other tests skip
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-snb5/igt@sysfs_timeslice_duration@idempotent@vcs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][664] ([i915#17447])
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          ([PASS][665], [INCOMPLETE][666]) ([i915#16348]) -> [PASS][667]
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-dg2-4/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          ([PASS][668], [INCOMPLETE][669]) ([i915#13356]) -> [PASS][670] +1 other test pass
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@gem_ctx_isolation@preservation-s3.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          ([INCOMPLETE][671], [INCOMPLETE][672]) ([i915#13196] / [i915#13356]) -> [PASS][673] +1 other test pass
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk9/igt@gem_exec_suspend@basic-s3.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk4/igt@gem_exec_suspend@basic-s3.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-tglu:         ([INCOMPLETE][674], [PASS][675]) -> [PASS][676]
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-10/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@i915_module_load@load:
    - shard-tglu:         ([PASS][677], [PASS][678], [PASS][679], [PASS][680], [PASS][681], [PASS][682], [PASS][683], [PASS][684], [PASS][685], [INCOMPLETE][686], [PASS][687], [PASS][688], [PASS][689], [PASS][690], [PASS][691], [PASS][692], [PASS][693], [PASS][694], [PASS][695], [PASS][696], [PASS][697], [PASS][698], [PASS][699], [PASS][700], [PASS][701], [PASS][702], [PASS][703], [PASS][704], [PASS][705], [PASS][706], [PASS][707], [PASS][708], [PASS][709], [PASS][710], [PASS][711], [PASS][712], [PASS][713], [PASS][714]) -> ([PASS][715], [PASS][716], [PASS][717], [PASS][718], [PASS][719], [PASS][720], [PASS][721], [PASS][722], [PASS][723], [PASS][724], [PASS][725], [PASS][726], [PASS][727], [PASS][728], [PASS][729], [PASS][730], [PASS][731], [PASS][732], [PASS][733], [PASS][734], [PASS][735])
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-9/igt@i915_module_load@load.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-8/igt@i915_module_load@load.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-4/igt@i915_module_load@load.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-4/igt@i915_module_load@load.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-8/igt@i915_module_load@load.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-9/igt@i915_module_load@load.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-5/igt@i915_module_load@load.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-5/igt@i915_module_load@load.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-3/igt@i915_module_load@load.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-3/igt@i915_module_load@load.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@i915_module_load@load.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-8/igt@i915_module_load@load.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-4/igt@i915_module_load@load.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@i915_module_load@load.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-2/igt@i915_module_load@load.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-10/igt@i915_module_load@load.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-10/igt@i915_module_load@load.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-5/igt@i915_module_load@load.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-9/igt@i915_module_load@load.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@i915_module_load@load.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@i915_module_load@load.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-4/igt@i915_module_load@load.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-2/igt@i915_module_load@load.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@i915_module_load@load.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-2/igt@i915_module_load@load.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-3/igt@i915_module_load@load.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-2/igt@i915_module_load@load.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-8/igt@i915_module_load@load.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-5/igt@i915_module_load@load.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-9/igt@i915_module_load@load.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-3/igt@i915_module_load@load.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-10/igt@i915_module_load@load.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@i915_module_load@load.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-2/igt@i915_module_load@load.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-9/igt@i915_module_load@load.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-5/igt@i915_module_load@load.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-10/igt@i915_module_load@load.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-4/igt@i915_module_load@load.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@i915_module_load@load.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-9/igt@i915_module_load@load.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@i915_module_load@load.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@i915_module_load@load.html
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@i915_module_load@load.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@i915_module_load@load.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@i915_module_load@load.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@i915_module_load@load.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@i915_module_load@load.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-3/igt@i915_module_load@load.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@i915_module_load@load.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@i915_module_load@load.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-9/igt@i915_module_load@load.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@i915_module_load@load.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@i915_module_load@load.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-9/igt@i915_module_load@load.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@i915_module_load@load.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@i915_module_load@load.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@i915_module_load@load.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@i915_module_load@load.html
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@i915_module_load@load.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-mtlp:         [FAIL][736] ([i915#17828]) -> [PASS][737]
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-5/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_api@freq-suspend@gt1:
    - shard-mtlp:         [ABORT][738] ([i915#17146]) -> [PASS][739] +1 other test pass
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-5/igt@i915_pm_freq_api@freq-suspend@gt1.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@i915_pm_freq_api@freq-suspend@gt1.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          ([PASS][740], [INCOMPLETE][741]) ([i915#4817]) -> [PASS][742] +1 other test pass
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@i915_suspend@debugfs-reader.html
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@i915_suspend@debugfs-reader.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][743] ([i915#12761] / [i915#13356]) -> [PASS][744]
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         ([FAIL][745], [PASS][746]) ([i915#5956]) -> [PASS][747] +1 other test pass
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         ([FAIL][748], [FAIL][749]) ([i915#15733] / [i915#5138]) -> [PASS][750]
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         ([INCOMPLETE][751], [FAIL][752]) ([i915#15582] / [i915#17158]) -> [PASS][753]
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [INCOMPLETE][754] ([i915#15582]) -> [PASS][755]
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [FAIL][756] ([i915#13566]) -> [PASS][757] +2 other tests pass
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          ([FAIL][758], [FAIL][759]) ([i915#13566]) -> [PASS][760]
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@kms_cursor_crc@cursor-random-64x21.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html
    - shard-tglu:         ([FAIL][761], [FAIL][762]) ([i915#13566]) -> [PASS][763] +1 other test pass
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@kms_cursor_crc@cursor-random-64x21.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-10/igt@kms_cursor_crc@cursor-random-64x21.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          ([PASS][764], [INCOMPLETE][765]) ([i915#16276] / [i915#6113]) -> [PASS][766]
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_flip@flip-vs-suspend.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          ([PASS][767], [INCOMPLETE][768]) ([i915#10056]) -> [PASS][769]
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
    - shard-mtlp:         [FAIL][770] ([i915#17276]) -> [PASS][771]
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-glk:          [SKIP][772] ([i915#17517]) -> [PASS][773] +2 other tests pass
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][774] ([i915#15989]) -> [PASS][775] +2 other tests pass
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:
    - shard-rkl:          ([PASS][776], [SKIP][777]) ([i915#15989]) -> [PASS][778] +1 other test pass
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-render:
    - shard-rkl:          ([SKIP][779], [SKIP][780]) ([i915#15989]) -> [PASS][781] +2 other tests pass
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-render.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-render.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-render.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][782] ([i915#16644] / [i915#3555] / [i915#8228]) -> [PASS][783]
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_hdr@static-toggle.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-glk:          [INCOMPLETE][784] ([i915#13356] / [i915#16938]) -> [PASS][785]
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk5/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk2/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          ([PASS][786], [SKIP][787]) ([i915#14544] / [i915#15073]) -> [PASS][788]
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          ([SKIP][789], [PASS][790]) ([i915#15073]) -> [PASS][791]
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-dg2-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          ([PASS][792], [SKIP][793]) ([i915#15073]) -> [PASS][794] +1 other test pass
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:
    - shard-glk:          [ABORT][795] ([i915#13179]) -> [PASS][796]
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         ([PASS][797], [FAIL][798]) ([i915#4349]) -> [PASS][799] +1 other test pass
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - shard-mtlp:         [FAIL][800] ([i915#4349]) -> [PASS][801] +2 other tests pass
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@vecs0.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@perf_pmu@busy-idle-check-all@vecs0.html

  * igt@perf_pmu@gt-awake:
    - shard-mtlp:         ([INCOMPLETE][802], [PASS][803]) ([i915#13520]) -> [PASS][804]
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-4/igt@perf_pmu@gt-awake.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-1/igt@perf_pmu@gt-awake.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@perf_pmu@gt-awake.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          ([INCOMPLETE][805], [INCOMPLETE][806]) ([i915#13356] / [i915#14242] / [i915#16236]) -> [PASS][807]
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk6/igt@perf_pmu@rc6-suspend.html
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk1/igt@perf_pmu@rc6-suspend.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk9/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][808] ([i915#9323]) -> [SKIP][809] ([i915#14544] / [i915#9323])
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          ([SKIP][810], [SKIP][811]) ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][812] ([i915#3555] / [i915#9323])
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          ([SKIP][813], [SKIP][814]) ([i915#14544] / [i915#9323]) -> [SKIP][815] ([i915#9323])
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_ccs@suspend-resume.html
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@gem_ccs@suspend-resume.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          ([SKIP][816], [SKIP][817]) ([i915#14544] / [i915#7697]) -> [SKIP][818] ([i915#7697]) +1 other test skip
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@gem_close_race@multigpu-basic-threads.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          ([SKIP][819], [SKIP][820]) ([i915#14544] / [i915#8562]) -> [SKIP][821] ([i915#8562])
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_create@create-ext-set-pat.html
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@gem_create@create-ext-set-pat.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-mtlp:         [INCOMPLETE][822] ([i915#13356] / [i915#17244]) -> [FAIL][823] ([i915#17176]) +1 other test fail
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-1/igt@gem_ctx_isolation@preservation-s3.html
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          ([SKIP][824], [SKIP][825]) ([i915#14544] / [i915#4525]) -> [SKIP][826] ([i915#4525]) +1 other test skip
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@gem_exec_balancer@parallel-out-fence.html
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          ([SKIP][827], [SKIP][828]) ([i915#14544] / [i915#6344]) -> [SKIP][829] ([i915#6344])
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@gem_exec_capture@capture-recoverable.html
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          ([SKIP][830], [SKIP][831]) ([i915#3281]) -> [SKIP][832] ([i915#14544] / [i915#3281]) +3 other tests skip
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          ([SKIP][833], [SKIP][834]) ([i915#14544] / [i915#3281]) -> [SKIP][835] ([i915#3281]) +8 other tests skip
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          ([SKIP][836], [SKIP][837]) ([i915#14544] / [i915#2190]) -> [SKIP][838] ([i915#2190])
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@gem_huc_copy@huc-copy.html
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_huc_copy@huc-copy.html
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-rkl:          ([SKIP][839], [SKIP][840]) ([i915#14544] / [i915#4613]) -> [SKIP][841] ([i915#4613]) +3 other tests skip
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@gem_lmem_swapping@random-engines.html
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-rkl:          ([SKIP][842], [SKIP][843]) ([i915#4613]) -> [SKIP][844] ([i915#14544] / [i915#4613])
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@gem_lmem_swapping@verify-random-ccs.html
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@gem_lmem_swapping@verify-random-ccs.html
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_mmap_gtt@coherency:
    - shard-rkl:          [SKIP][845] ([i915#17429]) -> [SKIP][846] ([i915#14544] / [i915#17429])
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@gem_mmap_gtt@coherency.html
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pread@display:
    - shard-rkl:          ([SKIP][847], [SKIP][848]) ([i915#3282]) -> [SKIP][849] ([i915#14544] / [i915#3282]) +1 other test skip
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@gem_pread@display.html
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@gem_pread@display.html
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@gem_pread@display.html

  * igt@gem_pread@snoop:
    - shard-rkl:          ([SKIP][850], [SKIP][851]) ([i915#14544] / [i915#3282]) -> [SKIP][852] ([i915#3282]) +4 other tests skip
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@gem_pread@snoop.html
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_pread@snoop.html
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@gem_pread@snoop.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          ([SKIP][853], [SKIP][854]) ([i915#13717] / [i915#14544]) -> [SKIP][855] ([i915#13717])
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          ([SKIP][856], [SKIP][857]) ([i915#14544] / [i915#8411]) -> [SKIP][858] ([i915#8411]) +1 other test skip
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          ([SKIP][859], [SKIP][860]) ([i915#14544] / [i915#3297]) -> [SKIP][861] ([i915#3297])
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@gem_userptr_blits@coherency-unsync.html
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-rkl:          ([SKIP][862], [SKIP][863]) ([i915#17455]) -> [SKIP][864] ([i915#14544] / [i915#17455])
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@gen7_exec_parse@basic-allocation.html
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@gen7_exec_parse@basic-allocation.html
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          ([SKIP][865], [SKIP][866]) ([i915#14544] / [i915#17455]) -> [SKIP][867] ([i915#17455]) +3 other tests skip
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gen7_exec_parse@chained-batch.html
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@gen7_exec_parse@chained-batch.html
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          ([SKIP][868], [SKIP][869]) ([i915#14544] / [i915#2527]) -> [SKIP][870] ([i915#2527]) +3 other tests skip
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@gen9_exec_parse@valid-registers.html
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@gen9_exec_parse@valid-registers.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-rkl:          ([SKIP][871], [SKIP][872]) ([i915#14544] / [i915#15678]) -> [SKIP][873] ([i915#15678])
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gpu_buddy@gpu_buddy.html
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@gpu_buddy@gpu_buddy.html
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          ([SKIP][874], [SKIP][875]) ([i915#14544] / [i915#6412]) -> [SKIP][876] ([i915#6412])
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@i915_module_load@resize-bar.html
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@i915_module_load@resize-bar.html
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-rkl:          ([INCOMPLETE][877], [PASS][878]) ([i915#13356]) -> [INCOMPLETE][879] ([i915#13356])
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@i915_pm_rpm@system-suspend-execbuf.html
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          ([SKIP][880], [SKIP][881]) ([i915#14544] / [i915#6245]) -> [SKIP][882] ([i915#6245])
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@i915_query@hwconfig_table.html
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@i915_query@hwconfig_table.html
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@i915_query@hwconfig_table.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          ([PASS][883], [INCOMPLETE][884]) ([i915#4817]) -> [INCOMPLETE][885] ([i915#4817])
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          ([SKIP][886], [SKIP][887]) ([i915#12454] / [i915#12712] / [i915#14544]) -> [SKIP][888] ([i915#12454] / [i915#12712])
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
    - shard-mtlp:         ([ABORT][889], [PASS][890]) ([i915#17165]) -> [FAIL][891] ([i915#17150]) +1 other test fail
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          ([SKIP][892], [SKIP][893]) ([i915#14544] / [i915#9531]) -> [SKIP][894] ([i915#9531])
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][895] ([i915#4538] / [i915#5286]) -> [SKIP][896] ([i915#14544] / [i915#4538] / [i915#5286])
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          ([SKIP][897], [SKIP][898]) ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][899] ([i915#4538] / [i915#5286]) +6 other tests skip
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-rkl:          ([SKIP][900], [SKIP][901]) ([i915#4538] / [i915#5286]) -> [SKIP][902] ([i915#14544] / [i915#4538] / [i915#5286])
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          ([SKIP][903], [SKIP][904]) ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][905] ([i915#17431] / [i915#3638]) +3 other tests skip
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [904]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [905]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          ([SKIP][906], [SKIP][907]) ([i915#3828]) -> [SKIP][908] ([i915#14544] / [i915#3828])
   [906]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [907]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [908]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          ([SKIP][909], [SKIP][910]) ([i915#14544] / [i915#3828]) -> [SKIP][911] ([i915#3828]) +1 other test skip
   [909]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [910]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [911]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][912] ([i915#17431] / [i915#3638]) -> [SKIP][913] ([i915#14544] / [i915#17431] / [i915#3638])
   [912]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [913]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          ([SKIP][914], [SKIP][915]) ([i915#14544] / [i915#4538]) -> [SKIP][916] ([i915#4538]) +6 other tests skip
   [914]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [915]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [916]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][917] ([i915#4538]) -> [SKIP][918] ([i915#14544] / [i915#4538])
   [917]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [918]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][919] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][920] ([i915#14098] / [i915#6095]) +5 other tests skip
   [919]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html
   [920]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          ([SKIP][921], [SKIP][922]) ([i915#12313]) -> [SKIP][923] ([i915#12313] / [i915#14544])
   [921]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [922]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [923]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          ([SKIP][924], [SKIP][925]) ([i915#12313] / [i915#14544]) -> [SKIP][926] ([i915#12313])
   [924]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [925]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [926]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-mtlp:         ([INCOMPLETE][927], [INCOMPLETE][928]) ([i915#15582]) -> [FAIL][929] ([i915#17158])
   [927]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [928]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [929]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-rkl:          ([SKIP][930], [SKIP][931]) ([i915#14098] / [i915#6095]) -> [SKIP][932] ([i915#14098] / [i915#14544] / [i915#6095]) +3 other tests skip
   [930]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [931]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [932]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][933] ([i915#14098] / [i915#6095]) -> [SKIP][934] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [933]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html
   [934]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          ([SKIP][935], [SKIP][936]) ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][937] ([i915#14098] / [i915#6095]) +15 other tests skip
   [935]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [936]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [937]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][938] ([i915#14544] / [i915#6095]) -> [SKIP][939] ([i915#6095]) +11 other tests skip
   [938]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
   [939]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][940] ([i915#6095]) -> [SKIP][941] ([i915#14544] / [i915#6095]) +6 other tests skip
   [940]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html
   [941]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          ([SKIP][942], [SKIP][943]) ([i915#14544] / [i915#6095]) -> [SKIP][944] ([i915#6095]) +1 other test skip
   [942]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [943]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [944]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-rkl:          ([SKIP][945], [SKIP][946]) ([i915#14544] / [i915#17427]) -> [SKIP][947] ([i915#17427])
   [945]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html
   [946]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html
   [947]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-rkl:          ([SKIP][948], [SKIP][949]) ([i915#14544] / [i915#16471] / [i915#17427]) -> [SKIP][950] ([i915#16471] / [i915#17427])
   [948]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html
   [949]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d.html
   [950]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-rkl:          ([SKIP][951], [SKIP][952]) ([i915#11151] / [i915#7828]) -> [SKIP][953] ([i915#11151] / [i915#14544] / [i915#7828])
   [951]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [952]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [953]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-rkl:          ([SKIP][954], [SKIP][955]) ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][956] ([i915#11151] / [i915#7828]) +12 other tests skip
   [954]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [955]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [956]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][957] ([i915#11151] / [i915#7828]) -> [SKIP][958] ([i915#11151] / [i915#14544] / [i915#7828])
   [957]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [958]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          ([SKIP][959], [SKIP][960]) ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][961] ([i915#15330] / [i915#3116])
   [959]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [960]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0.html
   [961]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-rkl:          ([SKIP][962], [SKIP][963]) ([i915#14544] / [i915#15330]) -> [SKIP][964] ([i915#15330])
   [962]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [963]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [964]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-rkl:          [SKIP][965] ([i915#15865]) -> [SKIP][966] ([i915#14544] / [i915#15865])
   [965]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_content_protection@legacy-hdcp14.html
   [966]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@suspend-resume:
    - shard-rkl:          ([SKIP][967], [SKIP][968]) ([i915#14544] / [i915#15865]) -> [SKIP][969] ([i915#15865]) +1 other test skip
   [967]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_content_protection@suspend-resume.html
   [968]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_content_protection@suspend-resume.html
   [969]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          ([SKIP][970], [SKIP][971]) ([i915#13049]) -> [SKIP][972] ([i915#13049] / [i915#14544])
   [970]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [971]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [972]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          ([SKIP][973], [SKIP][974]) ([i915#14544] / [i915#3555]) -> [SKIP][975] ([i915#3555]) +4 other tests skip
   [973]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [974]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [975]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-rkl:          ([PASS][976], [FAIL][977]) ([i915#13566]) -> [FAIL][978] ([i915#13566])
   [976]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_cursor_crc@cursor-random-256x85.html
   [977]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85.html
   [978]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-tglu:         ([PASS][979], [FAIL][980]) ([i915#13566]) -> [FAIL][981] ([i915#13566]) +1 other test fail
   [979]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [980]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [981]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          ([SKIP][982], [SKIP][983]) ([i915#14544] / [i915#4103]) -> [SKIP][984] ([i915#4103]) +1 other test skip
   [982]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [983]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [984]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-rkl:          [SKIP][985] ([i915#17428]) -> [SKIP][986] ([i915#14544] / [i915#17428]) +5 other tests skip
   [985]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [986]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          ([SKIP][987], [SKIP][988]) ([i915#14544] / [i915#17428]) -> [SKIP][989] ([i915#17428]) +97 other tests skip
   [987]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [988]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [989]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dp_aux_dev@basic:
    - shard-rkl:          ([SKIP][990], [SKIP][991]) ([i915#1257] / [i915#14544]) -> [SKIP][992] ([i915#1257])
   [990]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_dp_aux_dev@basic.html
   [991]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_dp_aux_dev@basic.html
   [992]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-rkl:          ([SKIP][993], [SKIP][994]) ([i915#14544] / [i915#17291]) -> [SKIP][995] ([i915#17291])
   [993]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
   [994]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
   [995]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-rkl:          ([SKIP][996], [SKIP][997]) ([i915#14544] / [i915#17285]) -> [SKIP][998] ([i915#17285])
   [996]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html
   [997]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_dp_link_training@uhbr-mst-direct-train.html
   [998]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          ([SKIP][999], [SKIP][1000]) ([i915#13748] / [i915#14544]) -> [SKIP][1001] ([i915#13748])
   [999]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html
   [1000]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [1001]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-rkl:          ([SKIP][1002], [SKIP][1003]) ([i915#14544] / [i915#16361]) -> [SKIP][1004] ([i915#16361]) +3 other tests skip
   [1002]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html
   [1003]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html
   [1004]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-rkl:          [SKIP][1005] ([i915#16361]) -> [SKIP][1006] ([i915#14544] / [i915#16361])
   [1005]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [1006]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          ([SKIP][1007], [SKIP][1008]) ([i915#14544] / [i915#16081]) -> [SKIP][1009] ([i915#16081])
   [1007]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_feature_discovery@display-2x.html
   [1008]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_feature_discovery@display-2x.html
   [1009]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          ([SKIP][1010], [SKIP][1011]) ([i915#14544] / [i915#16599]) -> [SKIP][1012] ([i915#16599])
   [1010]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html
   [1011]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_feature_discovery@dp-mst.html
   [1012]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-rkl:          ([SKIP][1013], [SKIP][1014]) ([i915#16600]) -> [SKIP][1015] ([i915#14544] / [i915#16600])
   [1013]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@kms_feature_discovery@dsc.html
   [1014]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_feature_discovery@dsc.html
   [1015]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          ([SKIP][1016], [SKIP][1017]) ([i915#14544] / [i915#9934]) -> [SKIP][1018] ([i915#9934]) +8 other tests skip
   [1016]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_flip@2x-flip-vs-dpms.html
   [1017]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html
   [1018]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-rkl:          ([SKIP][1019], [SKIP][1020]) ([i915#9934]) -> [SKIP][1021] ([i915#14544] / [i915#9934]) +2 other tests skip
   [1019]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [1020]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [1021]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          ([SKIP][1022], [SKIP][1023]) ([i915#14544] / [i915#15643]) -> [SKIP][1024] ([i915#15643]) +3 other tests skip
   [1022]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [1023]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [1024]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][1025] ([i915#15643]) -> [SKIP][1026] ([i915#14544] / [i915#15643])
   [1025]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [1026]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          ([SKIP][1027], [SKIP][1028]) ([i915#14544] / [i915#17452]) -> [SKIP][1029] ([i915#17452])
   [1027]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html
   [1028]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html
   [1029]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          ([PASS][1030], [SKIP][1031]) ([i915#15989]) -> [SKIP][1032] ([i915#15989]) +29 other tests skip
   [1030]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [1031]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [1032]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          ([SKIP][1033], [SKIP][1034]) ([i915#17428] / [i915#1825]) -> [SKIP][1035] ([i915#14544] / [i915#17428] / [i915#1825]) +4 other tests skip
   [1033]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [1034]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [1035]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          ([SKIP][1036], [SKIP][1037]) ([i915#14544] / [i915#15102]) -> [SKIP][1038] ([i915#15102]) +58 other tests skip
   [1036]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [1037]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [1038]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          ([SKIP][1039], [SKIP][1040]) ([i915#14544] / [i915#5439]) -> [SKIP][1041] ([i915#5439])
   [1039]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [1040]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [1041]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          ([SKIP][1042], [SKIP][1043]) ([i915#15102]) -> [SKIP][1044] ([i915#14544] / [i915#15102]) +11 other tests skip
   [1042]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [1043]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [1044]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-rkl:          [SKIP][1045] ([i915#15102]) -> [SKIP][1046] ([i915#14544] / [i915#15102]) +2 other tests skip
   [1045]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
   [1046]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          ([SKIP][1047], [SKIP][1048]) ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][1049] ([i915#17428] / [i915#1825]) +11 other tests skip
   [1047]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [1048]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [1049]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          ([SKIP][1050], [SKIP][1051]) ([i915#17428]) -> [SKIP][1052] ([i915#14544] / [i915#17428]) +18 other tests skip
   [1050]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt.html
   [1051]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt.html
   [1052]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-rkl:          ([ABORT][1053], [FAIL][1054]) ([i915#15132] / [i915#17122] / [i915#17137]) -> [FAIL][1055] ([i915#17122] / [i915#17137])
   [1053]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [1054]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [1055]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          [SKIP][1056] ([i915#16644] / [i915#3555] / [i915#8228]) -> [INCOMPLETE][1057] ([i915#15436])
   [1056]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_hdr@bpc-switch-suspend.html
   [1057]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         ([SKIP][1058], [SKIP][1059]) ([i915#12713] / [i915#16490]) -> [SKIP][1060] ([i915#1187] / [i915#12713] / [i915#16490])
   [1058]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-3/igt@kms_hdr@brightness-with-hdr.html
   [1059]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-6/igt@kms_hdr@brightness-with-hdr.html
   [1060]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          ([SKIP][1061], [PASS][1062]) ([i915#16644] / [i915#3555] / [i915#8228]) -> [SKIP][1063] ([i915#16644] / [i915#3555] / [i915#8228])
   [1061]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_hdr@static-toggle-dpms.html
   [1062]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html
   [1063]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          ([SKIP][1064], [SKIP][1065]) ([i915#16644] / [i915#3555] / [i915#8228]) -> [INCOMPLETE][1066] ([i915#15436])
   [1064]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.html
   [1065]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html
   [1066]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          [SKIP][1067] ([i915#15460]) -> [SKIP][1068] ([i915#14544] / [i915#15460])
   [1067]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_joiner@basic-big-joiner.html
   [1068]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          ([SKIP][1069], [SKIP][1070]) ([i915#14544] / [i915#15459]) -> [SKIP][1071] ([i915#15459])
   [1069]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_joiner@basic-force-big-joiner.html
   [1070]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html
   [1071]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][1072] ([i915#15458]) -> [SKIP][1073] ([i915#14544] / [i915#15458])
   [1072]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [1073]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-rkl:          ([SKIP][1074], [SKIP][1075]) ([i915#14544] / [i915#14712]) -> [SKIP][1076] ([i915#14712])
   [1074]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [1075]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [1076]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-rkl:          ([SKIP][1077], [SKIP][1078]) ([i915#15709]) -> [SKIP][1079] ([i915#14544] / [i915#15709]) +2 other tests skip
   [1077]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
   [1078]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
   [1079]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          ([SKIP][1080], [SKIP][1081]) ([i915#14544] / [i915#15709]) -> [SKIP][1082] ([i915#15709]) +6 other tests skip
   [1080]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [1081]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [1082]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-rkl:          ([SKIP][1083], [SKIP][1084]) ([i915#13958] / [i915#14544]) -> [SKIP][1085] ([i915#13958])
   [1083]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [1084]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-yf.html
   [1085]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled:
    - shard-rkl:          ([SKIP][1086], [SKIP][1087]) ([i915#14544] / [i915#17832]) -> [SKIP][1088] ([i915#17832]) +1 other test skip
   [1086]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled.html
   [1087]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled.html
   [1088]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          ([SKIP][1089], [SKIP][1090]) ([i915#12343] / [i915#5354]) -> [SKIP][1091] ([i915#12343] / [i915#14544] / [i915#5354])
   [1089]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html
   [1090]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html
   [1091]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][1092] ([i915#3828]) -> [SKIP][1093] ([i915#9340])
   [1092]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html
   [1093]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          ([PASS][1094], [SKIP][1095]) ([i915#15073]) -> [SKIP][1096] ([i915#15073]) +2 other tests skip
   [1094]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [1095]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [1096]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-tglu:         ([SKIP][1097], [SKIP][1098]) ([i915#17434] / [i915#17450]) -> [SKIP][1099] ([i915#17764])
   [1097]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-9/igt@kms_pm_rpm@pc8-residency.html
   [1098]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-8/igt@kms_pm_rpm@pc8-residency.html
   [1099]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          ([INCOMPLETE][1100], [PASS][1101]) ([i915#10553] / [i915#13356]) -> [INCOMPLETE][1102] ([i915#10553] / [i915#13356])
   [1100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk9/igt@kms_pm_rpm@system-suspend-modeset.html
   [1101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk5/igt@kms_pm_rpm@system-suspend-modeset.html
   [1102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk8/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          ([SKIP][1103], [SKIP][1104]) ([i915#14544] / [i915#6524]) -> [SKIP][1105] ([i915#6524])
   [1103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_prime@d3hot.html
   [1104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_prime@d3hot.html
   [1105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][1106] ([i915#11520]) -> [SKIP][1107] ([i915#11520] / [i915#14544]) +2 other tests skip
   [1106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [1107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-rkl:          ([SKIP][1108], [SKIP][1109]) ([i915#11520]) -> [SKIP][1110] ([i915#11520] / [i915#14544])
   [1108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [1109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [1110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          ([SKIP][1111], [SKIP][1112]) ([i915#11520] / [i915#14544]) -> [SKIP][1113] ([i915#11520]) +7 other tests skip
   [1111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [1112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [1113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr-sprite-mmap-gtt:
    - shard-rkl:          ([SKIP][1114], [SKIP][1115]) ([i915#1072] / [i915#9732]) -> [SKIP][1116] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [1114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html
   [1115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html
   [1116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          ([SKIP][1117], [SKIP][1118]) ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][1119] ([i915#1072] / [i915#9732]) +23 other tests skip
   [1117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html
   [1118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_psr@psr-sprite-plane-move.html
   [1119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-rkl:          [SKIP][1120] ([i915#1072] / [i915#9732]) -> [SKIP][1121] ([i915#1072] / [i915#14544] / [i915#9732])
   [1120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt@kms_psr@psr2-primary-mmap-gtt.html
   [1121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          ([SKIP][1122], [SKIP][1123]) ([i915#14544] / [i915#17432] / [i915#5289]) -> [SKIP][1124] ([i915#17432] / [i915#5289])
   [1122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [1123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [1124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-glk:          [DMESG-FAIL][1125] ([i915#13179]) -> [ABORT][1126] ([i915#13179])
   [1125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html
   [1126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-rkl:          ([SKIP][1127], [SKIP][1128]) ([i915#3555]) -> [SKIP][1129] ([i915#14544] / [i915#3555])
   [1127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [1128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [1129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-rkl:          ([SKIP][1130], [SKIP][1131]) ([i915#14544] / [i915#17445]) -> [SKIP][1132] ([i915#17445])
   [1130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_tv_load_detect@load-detect.html
   [1131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_tv_load_detect@load-detect.html
   [1132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          ([SKIP][1133], [SKIP][1134]) ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][1135] ([i915#15243] / [i915#3555])
   [1133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_vrr@flip-dpms.html
   [1134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_vrr@flip-dpms.html
   [1135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          ([SKIP][1136], [SKIP][1137]) ([i915#15243] / [i915#3555]) -> [SKIP][1138] ([i915#14544] / [i915#15243] / [i915#3555])
   [1136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_vrr@flip-suspend.html
   [1137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_vrr@flip-suspend.html
   [1138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          ([SKIP][1139], [SKIP][1140]) ([i915#11920] / [i915#14544]) -> [SKIP][1141] ([i915#11920])
   [1139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_vrr@lobf.html
   [1140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_vrr@lobf.html
   [1141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          ([SKIP][1142], [SKIP][1143]) ([i915#14544] / [i915#9906]) -> [SKIP][1144] ([i915#9906])
   [1142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_vrr@max-min.html
   [1143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_vrr@max-min.html
   [1144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_vrr@max-min.html

  * igt@perf@mi-rpc:
    - shard-rkl:          ([SKIP][1145], [SKIP][1146]) ([i915#14544] / [i915#2434]) -> [SKIP][1147] ([i915#2434])
   [1145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@perf@mi-rpc.html
   [1146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@perf@mi-rpc.html
   [1147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@perf@mi-rpc.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         ([PASS][1148], [FAIL][1149]) ([i915#4349]) -> [FAIL][1150] ([i915#4349])
   [1148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-2/igt@perf_pmu@busy-double-start.html
   [1149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-8/igt@perf_pmu@busy-double-start.html
   [1150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-rkl:          [SKIP][1151] ([i915#17416]) -> [SKIP][1152] ([i915#14544] / [i915#17416]) +1 other test skip
   [1151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@perf_pmu@event-wait@rcs0.html
   [1152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          ([SKIP][1153], [SKIP][1154]) ([i915#8516]) -> [SKIP][1155] ([i915#14544] / [i915#8516])
   [1153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html
   [1154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html
   [1155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          ([SKIP][1156], [SKIP][1157]) ([i915#14544] / [i915#17448] / [i915#3291] / [i915#3708]) -> [SKIP][1158] ([i915#17448] / [i915#3291] / [i915#3708])
   [1156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@prime_vgem@basic-write.html
   [1157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@prime_vgem@basic-write.html
   [1158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          ([SKIP][1159], [SKIP][1160]) ([i915#17448] / [i915#3708]) -> [SKIP][1161] ([i915#14544] / [i915#17448] / [i915#3708]) +1 other test skip
   [1159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@prime_vgem@fence-flip-hang.html
   [1160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@prime_vgem@fence-flip-hang.html
   [1161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14995]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15314
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
  [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
  [i915#15454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15454
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16938]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
  [i915#17103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17103
  [i915#17104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17104
  [i915#17122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122
  [i915#17137]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17137
  [i915#17146]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146
  [i915#17147]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17147
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17165]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17165
  [i915#17172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17172
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17189]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17189
  [i915#17209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17209
  [i915#17244]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17244
  [i915#17276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17276
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
  [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
  [i915#17291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291
  [i915#17319]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17319
  [i915#17342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17342
  [i915#17349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17349
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17429]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429
  [i915#17430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
  [i915#17447]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17447
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
  [i915#17452]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17469
  [i915#17471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17471
  [i915#17473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473
  [i915#17477]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477
  [i915#17478]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
  [i915#17479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
  [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
  [i915#17481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17481
  [i915#17482]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482
  [i915#17483]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483
  [i915#17484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484
  [i915#17486]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17486
  [i915#17487]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17487
  [i915#17488]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488
  [i915#17489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489
  [i915#17490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490
  [i915#17491]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491
  [i915#17492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492
  [i915#17493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493
  [i915#17494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17494
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
  [i915#17506]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17506
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17509]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17511]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511
  [i915#17512]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512
  [i915#17513]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17513
  [i915#17515]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17515
  [i915#17516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17523]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
  [i915#17527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529
  [i915#17531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17531
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537
  [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
  [i915#17541]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17541
  [i915#17542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17542
  [i915#17543]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543
  [i915#17544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17544
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17548
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
  [i915#17552]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17552
  [i915#17554]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554
  [i915#17555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555
  [i915#17556]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17556
  [i915#17557]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17557
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
  [i915#17563]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17563
  [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17573]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17573
  [i915#17576]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576
  [i915#17579]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17579
  [i915#17580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580
  [i915#17583]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583
  [i915#17585]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17585
  [i915#17587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17587
  [i915#17588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588
  [i915#17590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17590
  [i915#17591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17591
  [i915#17592]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17592
  [i915#17593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17593
  [i915#17594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17594
  [i915#17595]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17595
  [i915#17596]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17596
  [i915#17597]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17597
  [i915#17598]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17598
  [i915#17599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17599
  [i915#17600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17600
  [i915#17602]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17602
  [i915#17603]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17603
  [i915#17605]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17605
  [i915#17606]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17606
  [i915#17609]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17609
  [i915#17610]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610
  [i915#17617]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17617
  [i915#17618]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17618
  [i915#17620]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17620
  [i915#17621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17621
  [i915#17623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17623
  [i915#17625]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17625
  [i915#17626]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17626
  [i915#17629]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17629
  [i915#17630]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17630
  [i915#17631]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17631
  [i915#17632]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17632
  [i915#17634]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17634
  [i915#17636]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17636
  [i915#17637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17637
  [i915#17646]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17646
  [i915#17648]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17648
  [i915#17651]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17651
  [i915#17655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17655
  [i915#17656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17656
  [i915#17657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17657
  [i915#17659]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17659
  [i915#17661]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17661
  [i915#17662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17662
  [i915#17666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17666
  [i915#17671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17671
  [i915#17672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17672
  [i915#17678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17678
  [i915#17681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17681
  [i915#17684]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17684
  [i915#17687]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17687
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17690]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17690
  [i915#17698]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17698
  [i915#17700]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17700
  [i915#17703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703
  [i915#17704]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704
  [i915#17707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17707
  [i915#17712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17712
  [i915#17752]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752
  [i915#17755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17755
  [i915#17764]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17764
  [i915#17828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17828
  [i915#17832]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832
  [i915#17833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17833
  [i915#17843]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843
  [i915#17844]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844
  [i915#17854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17854
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
  [i915#8898]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9197 -> IGTPW_16171
  * Linux: CI_DRM_19554 -> CI_DRM_19560

  CI-20190529: 20190529
  CI_DRM_19554: e2f954ea951b668430703f19387784f203ad71d0 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19560: 48995c76e90141a4e72ceafeb3762d4a3580eeef @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16171: 716e4d9c12f72bad9187e4777eb646f4d1b0e68c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9197: 9197

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/index.html

--===============2457668943804254147==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_hangman: Add engine-error-s=
tate-skipped-capture</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/178889/">https://patchwork.freedesktop.org/series/178889/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16171/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16171/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9197_full -&gt; IGTPW_16171_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16171_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_16171_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/index=
.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1617=
1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_hangman@engine-error-state-skipped-capture} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@i915_hangman@engine-error-state-s=
kipped-capture.html">FAIL</a></li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@i915_hangman@engine-error-state-sk=
ipped-capture.html">SKIP</a></li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-4/igt@i915_hangman@engine-error-state-=
skipped-capture.html">FAIL</a></li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@i915_hangman@engine-error-state-s=
kipped-capture.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@i915_pm_rpm@gem-evict-pwrite.htm=
l">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-tglu-5/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shar=
d-tglu-4/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_9197_full and IGTPW_16171_ful=
l:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@i915_hangman@engine-error-state-skipped-capture:<ul>
<li>Statuses : 2 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 6.52] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16171_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@bb-with-allocator:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@api_intel_bb@bb-with-allocator.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17684">i915#17684</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@api_intel_bb@blit-reloc-purge-ca=
che.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@api_intel_bb@crc32.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576">=
i915#17576</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@api_intel_bb@crc32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230"=
>i915#6230</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@api_intel_bb@crc32.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576">=
i915#17576</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11078">i915#11078</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@device_reset@unbind-cold-reset-reb=
ind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17620">i915#17620</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@device_reset@unbind-cold-reset-reb=
ind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17537">i915#17537</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@device_reset@unbind-cold-reset-re=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@dma-buf-fence-chain:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk2/igt@dmabuf@dma-buf-fence-chain.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17712">i915#17712</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@gem_busy@semaphore.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">=
i915#3936</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_busy@semaphore.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17671">=
i915#17671</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@gem_busy@semaphore.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936"=
>i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@gem_ccs@block-copy-compressed.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@gem_ccs@block-multicopy-compressed=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17499">i915#17499</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@gem_ccs@block-multicopy-compress=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@gem_ccs@block-multicopy-compress=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy-new-ctx.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@gem_ccs@large-ctrl-surf-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17854">i915#17854</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_ccs@large-ctrl-surf-copy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17499">i915#17499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0=
-lmem0-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16171/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compre=
ssed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_compute@compute-square.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17552">i915#17552</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@gem_create@create-ext-cpu-access-b=
ig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17513">i915#17513</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@gem_create@create-ext-cpu-access=
-big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6335">i915#6335</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk5/igt@gem_create@create-ext-cpu-access-b=
ig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17513">i915#17513</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@gem_create@create-ext-cpu-access-=
big.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15454">i915#15454</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s=
3@ccs0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17176">i915#17176</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-range:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@gem_ctx_param@set-priority-range.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17646">i915#17646</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@gem_ctx_persistence@hang.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7527">i915#17527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-clo=
se.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-cl=
ose.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_ctx_persistence@heartbeat-stop=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17621">i915#17621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_ctx_persistence@legacy-engines=
-queued.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1099">i915#1099</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@create-shared-gtt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@gem_ctx_shared@create-shared-gtt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17342">i915#17342</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@gem_ctx_sseu@engines.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496=
">i915#17496</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_ctx_sseu@mmap-args.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
96">i915#17496</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
80">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@gem_eio@hibernate.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844=
">i915#17844</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/7975">i915#7975</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@gem_eio@hibernate.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844"=
>i915#17844</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/7975">i915#7975</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress@blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@gem_eio@reset-stress@blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15314">i915#15314</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_eio@unwedge-stress.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/889=
8">i915#8898</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@gem_exec_balancer@bonded-true-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@gem_exec_balancer@bonded-true-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@gem_exec_balancer@parallel-bb-fir=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@gem_exec_balancer@parallel-orderin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17547">i915#17547</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@smoke:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_exec_balancer@smoke.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
587">i915#17587</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-tglu-8/igt@gem_exec_big@single.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-9/igt@g=
em_exec_big@single.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@gem_exec_capture@capture-recove=
rable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_exec_fence@parallel.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
599">i915#17599</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-8/igt@gem_exec_fence@submit67.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@gem_exec_flush@basic-wb-prw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@gem_exec_flush@basic-wb-ro-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@invalid-bsd2-flag-on-vebox:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_exec_params@invalid-bsd2-flag-=
on-vebox.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17659">i915#17659</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@larger-than-life-batch:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@gem_exec_params@larger-than-life-b=
atch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16871">i915#16871</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_exec_params@larger-than-life-b=
atch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17662">i915#17662</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17523">i915#17523</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17523">i915#17523</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-read.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@gem_exec_reloc@basic-gtt-wc-acti=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@gem_exec_reloc@basic-wc-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@gem_exec_reloc@basic-write-read-a=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-c=
ontexts-chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@smoketest-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@gem_exec_schedule@smoketest-all.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17590">i915#17590</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_exec_suspend@basic-s3@smem.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15840">i915#15840</a>) +6 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@gem_exec_whisper@basic-queues-fork=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17655">i915#17655</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@gem_fenced_exec_thrash@2-spare-f=
ences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4860">i915#4860</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-f=
ences-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4860">i915#4860</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@gem_lmem_evict@dontneed-evict-race=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17605">i915#17605</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@gem_lmem_swapping@basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@gem_lmem_swapping@basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_lmem_swapping@heavy-verify-ran=
dom-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17503">i915#17503</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4565">i915#4565</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@gem_lmem_swapping@parallel-random=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17503">i915#17503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@gem_lmem_swapping@parallel-random=
-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12193">i915#12193</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@gem_lmem_swapping@random-engines.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17503">i915#17503</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4613">i915#4613</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@gem_media_fill@media-fill.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17661">i915#17661</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543">i915#=
17543</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@gem_mmap@bad-object.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083=
">i915#4083</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@pf-nonblock:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@gem_mmap@pf-nonblock.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/408=
3">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@gem_mmap_gtt@basic-wc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
77">i915#4077</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4077">i915#4077</a>) +17 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@gem_mmap_gtt@cpuset-big-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@gem_mmap_wc@close.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@gem_partial_pwrite_pread@reads-un=
cached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-a=
fter-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@gem_partial_pwrite_pread@writes-=
after-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3282">i915#3282</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>) +1 other test warn</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@gem_pread@exhaustion.html">WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/26=
58">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@gem_pxp@create-regular-context-1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17521">i915#17521</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-1.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197=
/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-1.html">PASS<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/=
shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270=
">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk5/igt@gem_pxp@reject-modify-context-prot=
ection-off-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17521">i915#17521</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@gem_pxp@verify-pxp-execution-afte=
r-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@gem_pxp@verify-pxp-execution-aft=
er-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_pxp@verify-pxp-execution-after=
-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17521">i915#17521</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@gem_readwrite@read-bad-handle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@gem_render_copy@y-tiled.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8428">i915#8428</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gem_render_copy@y-tiled-ccs-to-x-t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17591">i915#17591</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@gem_render_copy@y-tiled-ccs-to-y-t=
iled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17492">i915#17492</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_render_copy@y-tiled-to-vebox-x=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17492">i915#17492</a>) +5 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-=
x-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@gem_render_copy@y-tiled-to-vebox-=
y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@gem_set_tiling_vs_blt@tiled-to-u=
ntiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-prime:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@gem_softpin@evict-prime.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
471">i915#17471</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@gem_softpin@evict-snoop.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7430">i915#17430</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17430">i915#17430</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk5/igt@gem_softpin@evict-snoop.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
551">i915#17551</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@gem_softpin@evict-snoop.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@gem_userptr_blits@access-control=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@gem_userptr_blits@access-control.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@gem_userptr_blits@forbidden-opera=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@gem_userptr_blits@forbidden-oper=
ations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@gem_userptr_blits@sd-probe.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4958">i915#4958</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@gem_userptr_blits@sd-probe.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_userptr_blits@unsync-overlap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17507">i915#17507</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@gem_userptr_blits@unsync-unmap-cyc=
les.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17507">i915#17507</a>) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@gem_userptr_blits@unsync-unmap-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@invalid-create:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@gem_vm_create@invalid-create.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17596">i915#17596</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-glk9/igt@gem_workarounds@suspend-resume.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk4/igt@g=
em_workarounds@suspend-resume.html">PASS</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk2/igt@gem_workarounds@sus=
pend-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-glk2/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-=
glk6/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@gen3_render_linear_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7555">i915#17555</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@gen3_render_tiledx_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7511">i915#17511</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@gen3_render_tiledy_blits.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk6/igt@gen7_exec_parse@basic-allocation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17505">i915#17505</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@gen7_exec_parse@basic-allocation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@gen9_exec_parse@basic-rejected-ctx=
-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17597">i915#17597</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@gen9_exec_parse@batch-without-end=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@gen9_exec_parse@batch-without-en=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-9/igt@gen9_exec_parse@batch-zero-lengt=
h.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2856">i915#2856</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@gen9_exec_parse@shadow-peek.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@vecs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@i915_drm_fdinfo@busy-check-all@ve=
cs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@i915_drm_fdinfo@busy-idle@bcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@i915_drm_fdinfo@busy-idle@rcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@i915_drm_fdinfo@busy@vecs1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14073">i915#14073</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@i915_drm_fdinfo@virtual-busy-hang.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17603">i915#17603</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy-hang=
-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14118">i915#14118</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@i915_drm_fdinfo@virtual-busy-han=
g-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14118">i915#14118</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@i915_fb_tiling@basic-x-tiling.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13786">i915#13786</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@i915_fb_tiling@basic-x-tiling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@i915_hangman@engine-engine-error@b=
cs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17580">i915#17580</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@i915_hangman@engine-engine-hang.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17610">i915#17610</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@i915_module_load@fault-injection.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15342">i915#15342</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15840">i915#15840</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@i915_module_load@fault-injection@i=
915_driver_mmio_probe.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17755">i915#17755</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@i915_module_load@fault-injection@i=
ntel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_guc_ct_init:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@i915_module_load@fault-injection@i=
ntel_guc_ct_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17600">i915#17600</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@i915_module_load@resize-bar.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multi=
ple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8399">i915#8399</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@i915_pm_freq_api@freq-reset-mult=
iple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@i915_pm_freq_api@freq-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17526">i915#17526</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@i915_pm_freq_api@freq-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17526">i915#17526</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@i915_pm_freq_mult@media-freq@gt0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@i915_pm_freq_mult@media-freq@gt1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6590">i915#6590</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17541">i915#17541</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@i915_pm_rc6_residency@rc6-idle.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17690">i915#17690</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-4/igt@i915_pm_rps@thresholds-idle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@i915_pm_rps@thresholds-park.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11681">i915#11681</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@i915_pm_rps@thresholds-park.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@i915_pm_rps@waitboost.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
365">i915#15365</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@i915_query@hwconfig_table.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-kernel-writes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@i915_query@query-topology-kernel-w=
rites.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17629">i915#17629</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@i915_query@query-topology-unsuppor=
ted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17563">i915#17563</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@i915_query@query-topology-unsuppo=
rted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16079">i915#16079</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@i915_query@query-topology-unsupp=
orted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk11/igt@i915_suspend@basic-s3-without-i91=
5.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@i915_suspend@forcewake.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) +1 other test incom=
plete</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-tglu-5/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-2/ig=
t@i915_suspend@forcewake.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@i915_suspend@sysfs-reader.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17844">i915#17844</a>) +9 other tests abort</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@intel_hwmon@hwmon-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_addfb_basic@addfb25-y-tiled-s=
mall-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_addfb_basic@addfb25-y-tiled-sm=
all-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17469">i915#17469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_addfb_basic@basic-x-tiled-le=
gacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_addfb_basic@clobberred-modifi=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4212">i915#4212</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_addfb_basic@clobberred-modif=
ier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk1/igt@kms_async_flips@async-flip-suspend=
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
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_async_flips@async-flip-with-p=
age-flip-events-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-fencing.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16171/shard-tglu-10/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15662">i915#15662</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@kms_atomic_transition@plane-all-m=
odeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@kms_big_fb@4-tiled-64bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5286">i915#5286</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_big_fb@4-tiled-addfb.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7556">i915#17556</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_big_fb@4-tiled-addfb-size-over=
flow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17544">i915#17544</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_big_fb@4-tiled-addfb-size-over=
flow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17544">i915#17544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_big_fb@linear-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_big_fb@linear-8bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17500">i915#17500</a>) +8 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_big_fb@linear-8bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17500">i915#17500</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_big_fb@linear-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_big_fb@linear-max-hw-stride-3=
2bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_big_fb@x-tiled-16bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17500">i915#17500</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_big_fb@x-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_big_fb@x-tiled-addfb-size-over=
flow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17630">i915#17630</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_big_fb@y-tiled-addfb-size-offs=
et-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17557">i915#17557</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk11/igt@kms_big_fb@y-tiled-max-hw-stride-=
32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>=
) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17432">i915#17432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +34 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk8/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +14 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_919=
7/shard-rkl-6/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html">PAS=
S</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1617=
1/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13363">i915#13363</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-tglu-7/igt@kms_busy@extended-modeset-hang-newfb-with-reset.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16171/shard-tglu-9/igt@kms_busy@extended-modeset-hang-newfb-with-reset.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-tglu-7/igt@kms_busy@extended-modeset-hang-newfb-with-reset@=
pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16171/shard-tglu-9/igt@kms_busy@extended-modeset-hang-newfb-with=
-reset@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17147">i915#17147</a>)</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_busy@extended-modeset-hang-newfb-with-reset@=
pipe-a.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_9197/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pi=
pe-a.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16171/shard-rkl-4/igt@kms_busy@extended-modeset-hang-newfb-with-r=
eset@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17147">i915#17147</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +124 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_ccs@bad-pixel-format-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +86 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-=
gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-4-tiled-=
dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_ccs@bad-rotation-90-4-tiled-d=
g2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +1=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_ccs@ccs-on-another-bo-yf-tiled=
-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17594">i915#17594</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled=
-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_ccs@crc-primary-basic-4-tiled=
-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +36 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled=
-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095=
">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +54 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-=
1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_ccs@crc-primary-rotation-180-y=
-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +124 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk2/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17525">i915#17525</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_ccs@crc-primary-suspend-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +49 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-til=
ed-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a=
>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs@pipe-d-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_ccs@random-ccs-data-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_ccs@random-ccs-data-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_ccs@random-ccs-data-y-tiled-c=
cs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_cdclk@mode-rejected-max-dotclo=
ck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17550">i915#17550</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_cdclk@mode-rejected-max-dotc=
lock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17099">i915#17099</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_cdclk@mode-rejected-max-dotclo=
ck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17550">i915#17550</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_cdclk@mode-transition-all-out=
puts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16017">i915#16017</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3742">i915#3742</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-8/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16017">i915#16017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-c-hd=
mi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13781">i915#13781</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_chamelium_audio@dp-audio-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_chamelium_color@ctm-0-75.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17489">i915#17489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_chamelium_color@ctm-limited-r=
ange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_chamelium_color@ctm-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17489">i915#17489</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_chamelium_color@ctm-negative.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17427">i915#17427</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@kms_chamelium_color@ctm-negative=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17427">i915#17427</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_chamelium_color@ctm-negative=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17427">i915#17427</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@kms_chamelium_color@ctm-negative=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_chamelium_color_pipeline@pla=
ne-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16464">i915#16464</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +6 other=
 tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 other =
tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 other=
 tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_chamelium_color_pipeline@plane=
-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17497">i915#17497</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk11/igt@kms_chamelium_color_pipeline@plan=
e-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_chamelium_edid@dp-edid-change-=
during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17483">i915#17483</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_chamelium_frames@dp-crc-fast.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7828">i915#7828</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_chamelium_frames@dp-crc-multi=
ple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17483">i915#17483</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_chamelium_frames@dp-frame-dum=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-d=
isable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</l=
i>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-enable-=
disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests sk=
ip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_chamelium_hpd@dp-hpd-enable-di=
sable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17483">i915#17483</a>) +12 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_chamelium_hpd@dp-hpd-enable-=
disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests sk=
ip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-enable-=
disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-degamma-lut-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_color@invalid-degamma-lut-size=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17656">i915#17656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-degamma-lut-sizes@pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_color@invalid-degamma-lut-size=
s@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17657">i915#17657</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_color_pipeline@plane-ctm3x4-l=
ut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk2/igt@kms_color_pipeline@plane-fixed-mat=
rix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +7 other tests skip<=
/li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_color_pipeline@plane-fixed-mat=
rix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_color_pipeline@plane-lut1d-ct=
m3x4@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16990">i915#16990</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_color_pipeline@plane-lut1d-p=
re-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +31 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_content_protection@atomic-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +4 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_content_protection@atomic-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17508">i915#17508</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@kms_content_protection@dp-mst-l=
ic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_content_protection@dp-mst-lic=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_content_protection@dp-mst-lic-=
type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17502">i915#17502</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</l=
i>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-8/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_content_protection@dp-mst-lic-=
type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_content_protection@dp-mst-typ=
e-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@kms_content_protection@dp-mst-ty=
pe-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@kms_content_protection@dp-mst-ty=
pe-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_content_protection@lic-type-0=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_content_protection@type1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15865">i915#15865</a>) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-9/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk1/igt@kms_content_protection@uevent-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17508">i915#17508</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_cursor_crc@cursor-offscreen-3=
2x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_cursor_crc@cursor-offscreen-=
32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_cursor_crc@cursor-offscreen-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17533">i915#17533</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_cursor_crc@cursor-onscreen-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17504">i915#17504</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk2/igt@kms_cursor_crc@cursor-onscreen-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17533">i915#17533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-m=
ax-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk11/igt@kms_cursor_crc@cursor-onscreen-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17504">i915#17504</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl=
-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@km=
s_cursor_crc@cursor-sliding-256x85.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-=
a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16171/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_cursor_crc@cursor-sliding-32x3=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17504">i915#17504</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi=
-a-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_9197/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1=
.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16171/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdm=
i-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test ski=
p</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flip=
b-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic-transitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17457">i915#17457</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17515">i915#17515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17486">i915#17486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17487">i915#17487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17486">i915#17486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17286">i915#17286</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_dp_link_training@non-uhbr-sst-=
direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17506">i915#17506</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_dp_link_training@non-uhbr-sst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17506">i915#17506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_dp_link_training@non-uhbr-sst-=
tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17531">i915#17531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_dp_link_training@uhbr-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_dp_link_training@uhbr-mst.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17477">i915#17477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_dp_link_training@uhbr-sst-tbta=
lt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk2/igt@kms_dp_linktrain_fallback@dp-fallb=
ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17625">i915#17625</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_dp_linktrain_fallback@dp-fallb=
ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17625">i915#17625</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_dp_linktrain_fallback@uhbr-to-=
hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17548">i915#17548</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_dp_linktrain_fallback@uhbr-to=
-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16867">i915#16867</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_dp_linktrain_fallback@uhbr-to-=
hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17548">i915#17548</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-wc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8812">i915#8812</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-wc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_dsc@dsc-basic-ultrajoiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16361">i915#16361</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_dsc@dsc-fractional-bpp-bigjoin=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17458">i915#17458</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16361">i915#16361</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@kms_dsc@dsc-with-bpc-bigjoiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_dsc@dsc-with-bpc-formats-bigj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_dsc@dsc-with-output-formats-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17458">i915#17458</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16361">i915#16361</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_explicit_fence@multiplane-atomic-fence-wait:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_explicit_fence@multiplane-atom=
ic-fence-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17623">i915#17623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516">=
i915#17516</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-mtlp-1/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-4=
/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17189">i915#17189</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17349">i915#17349</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_feature_discovery@display-4x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17666">i915#17666</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_feature_discovery@display-4x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16081">i915#16081</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_feature_discovery@display-4x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17666">i915#17666</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_feature_discovery@dsc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17539">i915#17539</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_feature_discovery@hdr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16600">i915#16600</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_feature_discovery@hdr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17539">i915#17539</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_feature_discovery@hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_feature_discovery@psr1.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17707">i915#17707</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_feature_discovery@psr1.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17707">i915#17707</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_feature_discovery@psr1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_feature_discovery@psr2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17585">i915#17585</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_fence_pin_leak.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">=
i915#4881</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_fence_pin_leak.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881"=
>i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_flip@2x-blocking-absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_flip@2x-blocking-wf_vblank.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_flip@2x-flip-vs-modeset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_flip@2x-nonexisting-fb-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_flip@flip-vs-fences-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8381">i915#8381</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_flip@flip-vs-fences-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-7/igt@kms_flip@flip-vs-suspend-interruptible.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-r=
kl-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@=
kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">=
i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-7/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16171/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16276">i915#16276</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +4 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other t=
est skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17593">i915#17593</a>) +16 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other te=
sts skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>=
) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_frontbuffer_tracking@fbc-tilin=
g-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17609">i915#17609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-1=
p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +20 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-1p=
-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +55 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_frontbuffer_tracking@fbchdr-=
1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-=
1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +16 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbchdr-=
2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>)=
 +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_frontbuffer_tracking@fbchdr-2p=
-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17588">i915#17588</a>) +181 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-ti=
ling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17559">i915#17559</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_frontbuffer_tracking@fbchdr-ti=
ling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17559">i915#17559</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +26 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708=
</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +39 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +39 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +40 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +22 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +29 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_frontbuffer_tracking@hdr-1p-pr=
imscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +36 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-2p-=
primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +86 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb=
-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_frontbuffer_tracking@hdr-2p-scnd=
scrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +9 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_frontbuffer_tracking@hdr-ind=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15989">i915#15989</a>) +16 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_frontbuffer_tracking@hdr-indfb=
-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17606">i915#17606</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-pr=
imscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +133 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +53 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825=
">i915#1825</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-rgb5=
65-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15102">i915#15102</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-pwrite:<=
/p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_frontbuffer_tracking@psrhdr-1p=
-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +79 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_frontbuffer_tracking@psrhdr-=
2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +47 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-2=
p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +25 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2=
p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +56 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@kms_frontbuffer_tracking@psrhdr-=
rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-nv12:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_getfb@getfb-reject-nv12.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17636">i915#17636</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_hdmi_audio_bw@audio-bw-hblank8=
0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17104">i915#17104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@dpms-audio-recovery:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-4/igt@kms_hdmi_audio_bw@dpms-audio-rec=
overy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17103">i915#17103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk1/igt@kms_hdmi_audio_bw@suspend-mem-audi=
o-recovery.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_hdmi_inject@inject-4k.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17681">i915#17681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-3/igt@kms_hdr@bpc-switch-suspend.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-6/igt@k=
ms_hdr@bpc-switch-suspend.html">PASS</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-8/igt@kms_hdr@bpc-switch-su=
spend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17319">i915#17319</a>) +1 other test incomplete</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_hdr@bpc-switch-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17498">i915#17498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb210=
1010.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_9197/shard-mtlp-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb2101010=
.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16171/shard-mtlp-8/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1-xrgb21=
01010.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17172">i915#17172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend@pipe-a=
-hdmi-a-2-xrgb2101010.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15436">i915#15436</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_hdr@invalid-hdr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498"=
>i915#17498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_hdr@static-toggle.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1749=
8">i915#17498</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_hdr@static-toggle.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_hdr@static-toggle-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16518">i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_joiner@basic-big-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15460">i915#15460</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_joiner@basic-big-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17512">i915#17512</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-16/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15459">i915#15459</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_joiner@invalid-modeset-force-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17678">i915#17678</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15459">i915#15459</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk8/igt@kms_joiner@invalid-modeset-force-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17678">i915#17678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_joiner@invalid-modeset-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17567">i915#17567</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_joiner@invalid-modeset-ultra-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17567">i915#17567</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_joiner@switch-modeset-ultra-jo=
iner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17617">i915#17617</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@kms_joiner@switch-modeset-ultra-j=
oiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_joiner@switch-modeset-ultra-j=
oiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_joiner@switch-modeset-ultra-jo=
iner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17617">i915#17617</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_mst@mst-suspend-read-crc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16451">i915#16451</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_mst@mst-suspend-read-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16451">i915#16451</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_mst@mst-suspend-read-crc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17579">i915#17579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off=
-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_pipe_stress@stress-xrgb8888-un=
tiled.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_plane@pixel-format-4-tiled-bm=
g-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17479">i915#17479</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-bm=
g-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_plane@pixel-format-4-tiled-dg2=
-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17479">i915#17479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-mo=
difier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_plane@pixel-format-y-tiled-gen=
12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_plane@pixel-format-y-tiled-mo=
difier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_plane@pixel-format-y-tiled-mod=
ifier@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-mo=
difier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_plane@planar-pixel-format-sett=
ings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17598">i915#17598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_plane@planar-pixel-format-sett=
ings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17700">i915#17700</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_plane@planar-pixel-format-set=
tings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_plane@planar-pixel-format-se=
ttings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic@=
pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_plane_alpha_blend@alpha-transp=
arent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_plane_alpha_blend@alpha-transp=
arent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_plane_alpha_blend@coverage-7ef=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17595">i915#17595</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_plane_lowres@tiling-4.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17509">i915#17509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_plane_multiple@2x-tiling-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_plane_multiple@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17542">i915#17542</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17832">i915#17832</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-4/igt@kms_plane_scaling@intel-max-src-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17832">i915#17832</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_plane_scaling@invalid-num-scal=
ers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17528">i915#17528</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_plane_scaling@invalid-paramete=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17626">i915#17626</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_plane_scaling@plane-downscal=
e-max-crc-rotation-180-4-tiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-=
c-hdmi-a-1-xyuv8888:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_plane_scaling@plane-downscale=
-max-crc-rotation-180-x-tiled@pipe-c-hdmi-a-1-xyuv8888.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17833">i915#=
17833</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@kms_plane_scaling@plane-downscal=
e-max-crc-rotation-90-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-a=
-hdmi-a-1-xv36:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@kms_plane_scaling@plane-downscal=
e-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-1-xv36.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#178=
43</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-c=
-hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_plane_scaling@plane-downscale=
-max-crc-rotation-90-y-tiled@pipe-c-hdmi-a-1-xrgb16161616f.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i=
915#17843</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-hdmi-a-1-yu=
yv:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk8/igt@kms_plane_scaling@plane-downscale-=
max-crc-x-tiled@pipe-a-hdmi-a-1-yuyv.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17833">i915#17833</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_plane_scaling@plane-downscale=
-max-crc-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17832">i915#17832</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-pixel-formats@pipe-a.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_plane_scaling@plane-upscale-ma=
x-crc-4-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17528">i915#17528</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-b-=
hdmi-a-1-rgb565:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_plane_scaling@plane-upscale-m=
ax-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-rgb565.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#178=
43</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12343">i915#12343</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12343">i915#12343</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@kms_pm_backlight@brightness-wit=
h-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_pm_backlight@fade-with-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_pm_backlight@fade-with-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17462">i915#17462</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_pm_backlight@fade-with-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17462">i915#17462</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_pm_dc@dc5-pageflip-negative.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_pm_dc@dc5-psr-suspend-resume.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703">=
i915#17703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17602">i=
915#17602</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_pm_dc@dc6-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">=
i915#17564</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17618=
">i915#17618</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_pm_lpsp@screens-disabled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17573">i915#17573</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-tglu-5/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@=
kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17764">i915#17764</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-dg1-18/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/sh=
ard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5073">i915#15073</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_pm_rpm@modeset-pc8-residency=
-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-caching:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_pm_rpm@pm-caching.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1747=
3">i915#17473</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/igt=
@kms_pm_rpm@system-suspend-idle.html">PASS</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_pm_rpm@syste=
m-suspend-idle.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_properties@colorop-properties-=
atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@kms_properties@colorop-properties-=
legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17481">i915#17481</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_psr2_sf@fbc-pr-overlay-primary=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@kms_psr2_sf@fbc-pr-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_psr2_sf@pr-overlay-plane-move=
-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</l=
i>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_psr2_sf@psr2-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-7/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4348">i915#4348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17546">i915#17546</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk4/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_psr@fbc-pr-cursor-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17480">i915#17480</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_psr@fbc-pr-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480"=
>i915#17480</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_psr@fbc-psr-cursor-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@kms_psr@fbc-psr-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9732">i915#9732</a>) +13 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@kms_psr@fbc-psr-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9688">i915#9688</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_psr@psr-cursor-plane-onoff.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_psr@psr-primary-mmap-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17480">i915#17480</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_psr@psr-sprite-blt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
480">i915#17480</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_psr@psr2-primary-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_psr@psr2-primary-mmap-gtt@ed=
p-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4077">i915#4077</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_psr_stress_test@flip-primary-i=
nvalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-bottom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-bottom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17634">i915#17634</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_rotation_crc@primary-rotation-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17488">i915#17488</a>) +7 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@kms_rotation_crc@primary-rotation=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_rotation_crc@primary-y-tiled-r=
eflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17488">i915#17488</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-1/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15867">i915#15867</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)=
 +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_scaling_modes@scaling-mode-cen=
ter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17501">i915#17501</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@kms_scaling_modes@scaling-mode-ce=
nter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-=
full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8809">i915#8809</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/8823">i915#8823</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk5/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10959">i915#10959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@kms_tiled_display@basic-test-patte=
rn-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17672">i915#17672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-8/igt@kms_vblank@ts-continuation-dpms-s=
uspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17844">i915#17844</a>) +12 other tests abort</li>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard=
-mtlp-7/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6=
/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#122=
76</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-=
edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_9197/shard-mtlp-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp=
-1.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16171/shard-mtlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe=
-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17209">i915#17209</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb4/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-b-vga-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17752">i915#17752</a>) +3 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) =
+3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_vblank@ts-continuation-suspend=
@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15840">i915#15840</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17752">i915#17752</a>) +1 ot=
her test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk9/igt@kms_vrr@flip-basic-fastset.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17520">i915#17520</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906">i915#9906</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@kms_vrr@flip-basic-fastset.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17520">i915#17520</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-19/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-mtlp-2/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8808">i915#8808</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_vrr@flipline.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i=
915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@kms_vrr@max-min.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i=
915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@perf@gen12-group-concurrent-oa-buf=
fer-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17592">i915#17592</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk5/igt@perf@gen12-mi-rpc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536">i=
915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@perf@gen12-oa-tlb-invalidate.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk8/igt@perf@per-context-mode-unprivileged=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17704">i915#17704</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-3/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17455">i915#17455</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@perf@per-context-mode-unprivileg=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17455">i915#17455</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@perf_pmu@busy.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@perf_pmu@=
busy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4349">i915#4349</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@perf_pmu@busy-accuracy-50@bcs0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17651">i915#17651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs0:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-2/igt@perf_pmu@busy-double-start@vcs0.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-8/=
igt@perf_pmu@busy-double-start@vcs0.html">PASS</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@perf_pmu@bu=
sy-double-start@vcs0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@perf_pmu@event-wait@rcs0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17416">i915#17416</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@perf_pmu@event-wait@rcs0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17416">i915#17416</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@perf_pmu@event-wait@rcs0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17698">i915#17698</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk3/igt@perf_pmu@rc6-all-gts.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583=
">i915#17583</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-6/igt@perf_pmu@rc6-all-gts.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516=
">i915#8516</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@perf_pmu@rc6-all-gts.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583=
">i915#17583</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-15/igt@perf_pmu@rc6-all-gts.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/851=
6">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@perf_pmu@rc6@runtime-pm-long-gt0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17687">i915#17687</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-wait-idle@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@perf_pmu@semaphore-wait-idle@bcs0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17648">i915#17648</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-wait-idle@vcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb1/igt@perf_pmu@semaphore-wait-idle@vcs0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17637">i915#17637</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-4/igt@prime_vgem@basic-fence-read.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@prime_vgem@basic-gtt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708=
">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4077">i915#4077</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-14/igt@prime_vgem@basic-gtt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/370=
8">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg2-7/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb6/igt@prime_vgem@fence-flip-hang.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17467">i915#17467</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-glk10/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17467">i915#17467</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@sysfs_preempt_timeout@timeout.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17631">i915#17631</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@idempotent@vcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-snb5/igt@sysfs_timeslice_duration@idempoten=
t@vcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17632">i915#17632</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17447">i915#17447</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-dg2-8/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt=
0-smem-lmem0.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_9197/shard-dg2-4/igt@gem_ccs@suspend-resume@xmajor-compressed-com=
pfmt0-smem-lmem0.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-dg2-5/igt@gem_ccs@s=
uspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/=
igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shar=
d-rkl-8/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-glk9/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk4/igt@=
gem_exec_suspend@basic-s3.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13196">i915#13196</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/=
shard-glk4/igt@gem_exec_suspend@basic-s3.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-tglu-10/igt@gem_partial_pwrite_pread@writes-after-reads-un=
cached.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_9197/shard-tglu-8/igt@gem_partial_pwrite_pread@writes-after-reads=
-uncached.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16171/shard-tglu-5/igt@gem_partial_pwrite_pread@writes-after=
-reads-uncached.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-tglu-9/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-8/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_9197/shard-tglu-4/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-4/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_9197/shard-tglu-8/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-t=
glu-9/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-5/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/=
shard-tglu-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-3/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_9197/shard-tglu-3/igt@i915_module_load@load.html">INCOMPLETE</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_9197/shard-tglu-8/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-4/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-t=
glu-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-10/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197=
/shard-tglu-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-5/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_9197/shard-tglu-9/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_9197/shard-tglu-7/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-4/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGT_9197/shard-tglu-2/igt@i915_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-=
7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGT_9197/shard-tglu-2/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shar=
d-tglu-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-2/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_91=
97/shard-tglu-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-5/igt@i915_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-tglu-9/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-3/igt@i915_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGT_9197/shard-tglu-10/igt@i915_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-7/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGT_9197/shard-tglu-2/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tgl=
u-9/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-5/igt@i915_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/sh=
ard-tglu-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-4/igt@i915_module_load@l=
oad.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16171/shard-tglu-5/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-9/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@i915_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/sh=
ard-tglu-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16171/shard-tglu-4/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-8/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-tglu-5/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard=
-tglu-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-3/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16171/shard-tglu-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-7/igt@i915_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16171/shard-tglu-9/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tgl=
u-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-10/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6171/shard-tglu-9/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-2/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16171/shard-tglu-8/igt@i915_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu-7/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16171/shard-tglu-4/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/=
shard-tglu-2/igt@i915_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-mtlp-5/igt@i915_pm_freq_api@freq-suspend@gt0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17828"=
>i915#17828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16171/shard-mtlp-1/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-mtlp-5/igt@i915_pm_freq_api@freq-suspend@gt1.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146=
">i915#17146</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16171/shard-mtlp-1/igt@i915_pm_freq_api@freq-suspend@gt1.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@i915_suspend@debugfs-reader.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@i9=
15_suspend@debugfs-reader.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@i9=
15_suspend@debugfs-reader.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-h=
dmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12761">i915#12761</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk1/igt@kms=
_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-6/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-fencing-internal-panels.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGT_9197/shard-mtlp-5/igt@kms_atomic_transition@plane-=
all-modeset-transition-fencing-internal-panels.html">PASS</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/sha=
rd-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-in=
ternal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-1=
80-hflip.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-1=
80-hflip.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@=
pipe-b-edp-1.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_9197/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-m=
tl-mc-ccs@pipe-b-edp-1.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15582">i915#15582</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtl=
p-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@p=
ipe-c-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_ccs@crc-pr=
imary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/135=
66">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16171/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">=
PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7=
/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rk=
l-8/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a></li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-tglu-7/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu=
-10/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard=
-tglu-8/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-8/igt@kms_flip@flip-vs-suspend.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_f=
lip@flip-vs-suspend.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rk=
l-2/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl=
-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#100=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_161=
71/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-suspend.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/172=
76">i915#17276</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16171/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-i=
ndfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk8/igt@kms_frontbuffer=
_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">PASS</a> +2 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffe=
r_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">PASS</a> +2 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-m=
sflip-blt.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGT_9197/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-=
msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_track=
ing@hdr-1p-primscrn-indfb-msflip-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-render.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_919=
7/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-render.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-=
render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_hdr@static-toggle.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-glk5/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16938">i915#16938</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16171/shard-glk2/igt@kms_pm_dc@dc5-dpms-suspend-r=
esume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/ig=
t@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_161=
71/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-dg2-=
6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-=
dg2-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8=
/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rk=
l-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_=
create.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13179">i915#13179</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_selftest@drm_framebuff=
er@drm_test_framebuffer_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-2/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-8/=
igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/i=
gt@perf_pmu@busy-double-start@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@vecs0.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349"=
>i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16171/shard-mtlp-2/igt@perf_pmu@busy-idle-check-all@vecs0.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@gt-awake:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-4/igt@perf_pmu@gt-awake.html">INCOMPLETE</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-1/igt@perf=
_pmu@gt-awake.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13520">i915#13520</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@perf_pmu@gt-awake=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-glk6/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-glk1/igt@perf_=
pmu@rc6-suspend.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14242">i915#14242</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236">i915#=
16236</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16171/shard-glk9/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">=
i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16171/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_c=
cs@ctrl-surf-copy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/sh=
ard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@gem_ccs@suspend-resume.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@gem_c=
cs@suspend-resume.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@=
gem_ccs@suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@gem_close_race@multigpu-basic-threads.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rk=
l-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697=
">i915#7697</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16171/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@gem_create@create-ext-set-pat.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@=
gem_create@create-ext-set-pat.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shar=
d-rkl-4/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-mtlp-1/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17244">i915#17244</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-5/igt@gem_ctx_isolation@preser=
vation-s3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17176">i915#17176</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl=
-2/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">=
i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16171/shard-rkl-2/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525=
">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl=
-5/igt@gem_exec_capture@capture-recoverable.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">=
i915#6344</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16171/shard-rkl-4/igt@gem_exec_capture@capture-recoverable.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344=
">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl=
-7/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-=
rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281=
">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-=
3/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i9=
15#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16171/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i=
915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@gem_huc_copy@huc-copy.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_huc_=
copy@huc-copy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@ge=
m_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/i=
gt@gem_lmem_swapping@random-engines.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#461=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1617=
1/shard-rkl-7/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-7/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-=
8/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rk=
l-6/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i=
915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429">i915#17429<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/=
shard-rkl-6/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429">i915#=
17429</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-7/igt@gem_pread@display.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@gem_pread@di=
splay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@gem_pread@display.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@gem_pread@snoop.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@gem_pread@snoo=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@gem_pread@snoop.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@=
gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/sh=
ard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-r=
kl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/84=
11">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16171/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2=
/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915=
#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16171/shard-rkl-5/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915=
#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-4/igt@gen7_exec_parse@basic-allocation.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/i=
gt@gen7_exec_parse@basic-allocation.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/=
igt@gen7_exec_parse@basic-allocation.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17=
455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@gen7_exec_parse@chained-batch.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@=
gen7_exec_parse@chained-batch.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/sh=
ard-rkl-3/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/ig=
t@gen9_exec_parse@valid-registers.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171=
/shard-rkl-3/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@gpu_buddy@gpu_buddy.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@gpu_buddy@=
gpu_buddy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@gpu_bu=
ddy@gpu_buddy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@i9=
15_module_load@resize-bar.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rk=
l-8/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPL=
ETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard=
-rkl-2/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/sh=
ard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@i915=
_query@hwconfig_table.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-3/=
igt@i915_query@hwconfig_table.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6=
/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shar=
d-rkl-6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#481=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/sh=
ard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i=
915#12454</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12712">i915#12712</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_addfb_basic@i=
nvalid-smem-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-=
d-edp-1.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-=
d-edp-1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17165">i915#17165</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_async_flips@async-f=
lip-suspend-resume@pipe-d-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17150">i915#17150</a>) +1 other tes=
t fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/=
shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9531">i915#9531</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_atomic@plane-primary-overla=
y-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">=
i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-=
hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_9197/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hfl=
ip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@k=
ms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#453=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5286">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp=
-rotate-180-hflip-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-r=
kl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/=
igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#=
17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_big_fb@linear-16bpp-rotate-90.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-h=
flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_9197/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-3=
2bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-h=
flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_9197/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_big_fb@linear=
-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431"=
>i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl=
-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">=
i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16171/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538=
">i915#4538</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">=
i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16171/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-=
hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-=
7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/140=
98">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-=
rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#123=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_161=
71/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i=
915#12313</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shar=
d-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#=
12313</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16171/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg=
-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.=
html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_9197/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.htm=
l">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16171/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-=
4-tiled-mtl-mc-ccs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197=
/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pi=
pe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_c=
cs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i9=
15#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard=
-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14=
098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_ccs@crc-primary-suspe=
nd-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +15 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-cc=
s@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@k=
ms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
095">i915#6095</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@p=
ipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_ccs@missing-ccs-=
buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i=
915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-=
b-hdmi-a-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGT_9197/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pip=
e-b-hdmi-a-2.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_c=
cs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-l=
ut1d:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-=
yuv-rgb-bt2020-lim-lut1d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i9=
15#17427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16171/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yu=
v-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard=
-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16471">i915#16471</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_chamelium_color_pip=
eline@plane-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-n=
on-4k.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_9197/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-=
4k.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_chamelium_e=
did@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2=
/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_chamelium_frames@hdmi-crc-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-8/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-for-=
each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard=
-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_content_protection@dp=
-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_919=
7/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_content_protection@dp=
-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@kms_content_protection@legacy-hdcp14.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1586=
5">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16171/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_content_protection@suspend-resume.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rk=
l-6/igt@kms_content_protection@suspend-resume.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1586=
5">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16171/shard-rkl-7/igt@kms_content_protection@suspend-resume.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-=
rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#130=
49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_161=
71/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i=
915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl=
-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16171/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@kms_cursor_crc@cursor-random-256x85.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-=
2/igt@kms_cursor_crc@cursor-random-256x85.html">FAIL</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-=
rkl-8/igt@kms_cursor_crc@cursor-random-256x85.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-256x85.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-t=
glu-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/s=
hard-tglu-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13=
566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-=
legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_9197/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-le=
gacy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_cursor_le=
gacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17428">i915#17428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb=
-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shar=
d-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17428">i915#17428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-le=
gacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17428">i915#17428</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@kms_dp_aux_dev@basic.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_dp_au=
x_dev@basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/1257">i915#1257</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/igt@kms_dp=
_aux_dev@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197=
/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17291">i915#17291</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_dp_link_training@non-uh=
br-mst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17291">i915#17291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/sha=
rd-rkl-4/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17285">i915#17285</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_dp_link_training@uhbr-mst-direc=
t-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@=
kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/sh=
ard-rkl-3/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard=
-rkl-3/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_dsc@dsc-with-bpc-formats-ultrajoine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-8/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361"=
>i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16171/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_feature_discovery@display-2x.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/i=
gt@kms_feature_discovery@display-2x.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16=
081</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
171/shard-rkl-3/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16=
081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@k=
ms_feature_discovery@dp-mst.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shar=
d-rkl-2/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-7/igt@kms_feature_discovery@dsc.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@kms_=
feature_discovery@dsc.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16600">i915#16600</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_featur=
e_discovery@dsc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_f=
lip@2x-flip-vs-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-2/ig=
t@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-=
5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rk=
l-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i=
915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4t=
iledg2rcccs-downscaling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915=
#15643</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16171/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiled=
g2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yf=
tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_flip_scaled_=
crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_force_connector_basic@force-load-detect.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/sh=
ard-rkl-2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17452">i915#17452</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_force_connector_basic@force-l=
oad-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-=
indfb-onoff.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_9197/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-c=
ur-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_frontbuffer_t=
racking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +=
29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-=
indfb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-sc=
ndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/sha=
rd-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mma=
p-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-m=
map-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_9197/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mma=
p-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/igt@kms_frontbu=
ffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) =
+58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard=
-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16171/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-s=
pr-indfb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGT_9197/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr=
-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6=
/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pg=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer_tracking=
@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGT_9197/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-=
spr-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#=
1825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6171/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_9197/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-=
shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_frontbuffer=
_tracking@psrhdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428=
">i915#17428</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.ht=
ml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197=
/shard-rkl-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/151=
32">i915#15132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17122">i915#17122</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17137">i915#17137</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_hdmi_aud=
io_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17122">i915#17122</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17137">i915#171=
37</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16=
644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15436">i915#15436</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-6/igt@=
kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shar=
d-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#=
12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16490">i915#16490</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms=
_hdr@static-toggle-dpms.html">PASS</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8=
228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
171/shard-rkl-3/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@=
kms_hdr@static-toggle-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">=
i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16171/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436=
">i915#15436</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-2/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#1=
5460</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6171/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-5/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/=
igt@kms_joiner@basic-force-big-joiner.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#=
15459</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16171/shard-rkl-3/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915=
#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16171/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-=
rkl-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14712">i915#14712</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16171/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_919=
7/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16171/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-mo=
difier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-=
source-clamping.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGT_9197/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-mo=
difier-source-clamping.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl=
-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15709">i915#15709</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/ig=
t@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_161=
71/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#139=
58</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-max-crc-rotation=
-180-4-tiled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_9197/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-max-crc-rota=
tion-180-4-tiled.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt=
@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832=
">i915#17832</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/ig=
t@kms_pm_backlight@bad-brightness.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171=
/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shar=
d-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-7/igt=
@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@=
kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-tglu-9/igt@kms_pm_rpm@pc8-residency.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-tglu-8/igt@kms=
_pm_rpm@pc8-residency.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-tglu=
-2/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17764">i915#17764</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-glk9/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLET=
E</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-g=
lk5/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#10553</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i=
915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16171/shard-glk8/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
553">i915#10553</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_prime@d3hot.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_prime@d3ho=
t.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_prime@d3hot.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-p=
rimary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rk=
l-7/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/sh=
ard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#115=
20</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous=
-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
_9197/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-5/igt@kms_psr2_sf@psr2-=
overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-4/ig=
t@kms_psr@fbc-psr-sprite-mmap-gtt.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/sh=
ard-rkl-6/igt@kms_psr@fbc-psr-sprite-mmap-gtt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@=
kms_psr@psr-sprite-plane-move.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">=
i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16171/shard-rkl-7/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#=
1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9732">i915#9732</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-4/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#=
1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16171/shard-rkl-6/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
72">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_919=
7/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@kms_rotatio=
n_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#528=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_=
free.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13179">i915#13179</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16171/shard-glk6/igt@kms_selftest@drm_frameb=
uffer@drm_test_framebuffer_free.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197=
/shard-rkl-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16171/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc-stealin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt=
@kms_tv_load_detect@load-detect.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445">i915#17445<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/=
shard-rkl-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445">i915#17445</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_vrr@flip=
-dpms.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-4/=
igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@kms_vrr@flip-suspend.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-3/igt@kms_vrr@f=
lip-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15243">i915#15243</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@kms_vr=
r@flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-6/igt@kms_vrr@lobf.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-2/igt@kms_vrr@lobf.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11920">i915#11920</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_vrr@lobf.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-5/igt@kms_vrr@max-min.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@kms_vrr@max-mi=
n.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-8/igt@kms_vrr@max-min.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@perf@mi-rpc.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@perf@mi-rpc.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2434">i915#2434</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-7/igt@perf@mi-rpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434=
">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-mtlp-2/igt@perf_pmu@busy-double-start.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-mtlp-8/igt@p=
erf_pmu@busy-double-start.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-mtlp-3/igt@perf_pm=
u@busy-double-start.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9197/shard-rkl-8/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#174=
16</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_161=
71/shard-rkl-6/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">=
i915#17416</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-5/igt@perf_pmu@=
rc6-all-gts.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8516">i915#8516</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-6/igt@perf_pmu@rc6-all-gts.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-2/igt@prime_vgem@basic-write.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-6/igt@prime=
_vgem@basic-write.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16171/shard-rkl-7/igt@prime_vgem@basic-write.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#1=
7448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9197/shard-rkl-3/igt@prime_vgem@fence-flip-hang.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9197/shard-rkl-8/igt@pri=
me_vgem@fence-flip-hang.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16171/shard-rkl-=
6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/37=
08">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9197 -&gt; IGTPW_16171</li>
<li>Linux: CI_DRM_19554 -&gt; CI_DRM_19560</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19554: e2f954ea951b668430703f19387784f203ad71d0 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  CI_DRM_19560: 48995c76e90141a4e72ceafeb3762d4a3580eeef @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_16171: 716e4d9c12f72bad9187e4777eb646f4d1b0e68c @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9197: 9197</p>

</body>
</html>

--===============2457668943804254147==--
