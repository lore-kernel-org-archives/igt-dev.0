Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84627606A33C
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 08:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1BE10E610;
	Fri, 20 Nov 2026 08:36:28 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770FB10E610;
 Fri, 20 Nov 2026 08:35:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8012197486954335690=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/i915=5Fhangm?=
 =?utf-8?q?an=3A_Add_engine-error-state-skipped-capture_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Nov 2026 08:35:29 -0000
Message-ID: <179516372945.57939.15695801608209714839@9ac1b63fe3ea>
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

--===============8012197486954335690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_hangman: Add engine-error-state-skipped-capture (rev2)
URL   : https://patchwork.freedesktop.org/series/178889/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19564_full -> IGTPW_16181_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16181_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16181_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/index.html

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): shard-glk11 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16181_full:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@read:
    - shard-dg2:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@fbdev@read.html
    - shard-dg1:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@fbdev@read.html

  * {igt@i915_hangman@engine-error-state-skipped-capture} (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@i915_hangman@engine-error-state-skipped-capture.html
    - shard-tglu:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@i915_hangman@engine-error-state-skipped-capture.html
    - shard-mtlp:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-3/igt@i915_hangman@engine-error-state-skipped-capture.html

  
New tests
---------

  New tests have been introduced between CI_DRM_19564_full and IGTPW_16181_full:

### New IGT tests (1) ###

  * igt@i915_hangman@engine-error-state-skipped-capture:
    - Statuses : 1 fail(s) 2 skip(s)
    - Exec time: [0.01, 6.59] s

  

Known issues
------------

  Here are the changes found in IGTPW_16181_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@execbuf-with-allocator:
    - shard-snb:          NOTRUN -> [SKIP][6] ([i915#17647])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@api_intel_allocator@execbuf-with-allocator.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#6230])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@delta-check:
    - shard-snb:          NOTRUN -> [SKIP][8] ([i915#17645])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@api_intel_bb@delta-check.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#14544] / [i915#7697])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_basic@multigpu-create-close.html
    - shard-snb:          NOTRUN -> [SKIP][10] ([i915#17675])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_basic@multigpu-create-close.html
    - shard-glk:          NOTRUN -> [SKIP][11] ([i915#17697])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#3936])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#3936])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-glk:          NOTRUN -> [SKIP][14] ([i915#17499])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk9/igt@gem_ccs@block-copy-compressed.html
    - shard-snb:          NOTRUN -> [SKIP][15] ([i915#17499]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-glk10:        NOTRUN -> [SKIP][16] ([i915#17499]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@gem_ccs@block-multicopy-inplace.html
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-snb:          NOTRUN -> [SKIP][18] ([i915#17568])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_close_race@multigpu-basic-process.html
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#7697]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#7697]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#7697])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_compute@compute-square:
    - shard-glk:          NOTRUN -> [SKIP][22] ([i915#17552])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@gem_compute@compute-square.html
    - shard-snb:          NOTRUN -> [SKIP][23] ([i915#17552])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_compute@compute-square.html

  * igt@gem_ctx_engines@independent:
    - shard-snb:          NOTRUN -> [SKIP][24] ([i915#17670])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_ctx_engines@independent.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [PASS][25] -> [INCOMPLETE][26] ([i915#13356] / [i915#16466])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_param@set-priority-range:
    - shard-snb:          NOTRUN -> [SKIP][27] ([i915#17646]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_ctx_param@set-priority-range.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#8555])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#8555]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#8555]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][31] ([i915#1099]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_shared@q-in-order:
    - shard-snb:          NOTRUN -> [SKIP][32] ([i915#17342]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_ctx_shared@q-in-order.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#14544] / [i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#280]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@gem_ctx_sseu@mmap-args.html
    - shard-snb:          NOTRUN -> [SKIP][36] ([i915#17496])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_ctx_sseu@mmap-args.html
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#280])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@gem_ctx_sseu@mmap-args.html
    - shard-glk:          NOTRUN -> [SKIP][38] ([i915#17496]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [PASS][39] -> [INCOMPLETE][40] ([i915#13390] / [i915#17327])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
    - shard-dg1:          NOTRUN -> [ABORT][41] ([i915#17844]) +13 other tests abort
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@suspend:
    - shard-mtlp:         [PASS][42] -> [TIMEOUT][43] ([i915#17038])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-6/igt@gem_eio@suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@gem_eio@suspend.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4812]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4771])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel:
    - shard-snb:          NOTRUN -> [SKIP][46] ([i915#17587]) +5 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_exec_balancer@parallel.html
    - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#4525]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-glk:          NOTRUN -> [SKIP][48] ([i915#17547]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk8/igt@gem_exec_balancer@parallel-out-fence.html
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#14544] / [i915#4525])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [PASS][50] -> [FAIL][51] ([i915#15816])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-tglu-4/igt@gem_exec_big@single.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][52] ([i915#16904]) +4 other tests fail
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_capture@pi:
    - shard-snb:          NOTRUN -> [SKIP][53] ([i915#17610]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_exec_capture@pi.html

  * igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines:
    - shard-snb:          NOTRUN -> [SKIP][54] ([i915#17599])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3539] / [i915#4852]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#3539] / [i915#4852]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3539])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_params@invalid-bsd2-flag-on-vebox:
    - shard-snb:          NOTRUN -> [SKIP][58] ([i915#17659]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_exec_params@invalid-bsd2-flag-on-vebox.html

  * igt@gem_exec_params@larger-than-life-batch:
    - shard-glk:          NOTRUN -> [SKIP][59] ([i915#16871])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@gem_exec_params@larger-than-life-batch.html
    - shard-snb:          NOTRUN -> [SKIP][60] ([i915#17662])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gem_exec_params@larger-than-life-batch.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#17453] / [i915#5107])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#17453])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#17416])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-glk:          NOTRUN -> [SKIP][64] ([i915#17523])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk9/igt@gem_exec_params@secure-non-root.html
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#17416])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_exec_params@secure-non-root.html
    - shard-snb:          NOTRUN -> [SKIP][66] ([i915#17523])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#3281]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3281]) +11 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-range-active:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#3281]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@gem_exec_reloc@basic-range-active.html

  * igt@gem_exec_reloc@basic-wc-gtt-active:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#14544] / [i915#3281]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_exec_reloc@basic-wc-gtt-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3281]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-user:
    - shard-snb:          NOTRUN -> [SKIP][72] ([i915#17590]) +11 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_exec_schedule@preempt-user.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4537] / [i915#4812])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@gem_exec_schedule@reorder-wide.html
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4812]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@gem_exec_schedule@reorder-wide.html
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4537] / [i915#4812])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-mtlp:         [PASS][76] -> [FAIL][77] ([i915#17160]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-2/igt@gem_exec_suspend@basic-s3@smem.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][78] ([i915#17844] / [i915#7975]) +1 other test abort
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-dg1:          NOTRUN -> [ABORT][79] ([i915#17844] / [i915#7975]) +1 other test abort
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-snb:          NOTRUN -> [SKIP][80] ([i915#17628])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-snb:          NOTRUN -> [SKIP][81] ([i915#17655]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_exec_whisper@basic-queues.html

  * igt@gem_exercise_blt@fast-copy-emit:
    - shard-snb:          NOTRUN -> [SKIP][82] ([i915#17622])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gem_exercise_blt@fast-copy-emit.html

  * igt@gem_gpgpu_fill@basic:
    - shard-snb:          NOTRUN -> [SKIP][83] ([i915#17608])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gem_gpgpu_fill@basic.html

  * igt@gem_huc_copy@huc-copy:
    - shard-snb:          NOTRUN -> [SKIP][84] ([i915#17468])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][85] ([i915#17456] / [i915#2190])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk9/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-glk:          NOTRUN -> [SKIP][86] ([i915#17605] / [i915#4613])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-snb:          NOTRUN -> [SKIP][87] ([i915#17605])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-glk10:        NOTRUN -> [SKIP][88] ([i915#17503])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][89] ([i915#17503] / [i915#4613]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-snb:          NOTRUN -> [SKIP][90] ([i915#17503]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#14544] / [i915#4613])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#4613]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#4613])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#4613])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_fill@media-fill:
    - shard-snb:          NOTRUN -> [SKIP][95] ([i915#17661])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_media_fill@media-fill.html
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#8289])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-3/igt@gem_media_fill@media-fill.html
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#8289])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-glk:          NOTRUN -> [SKIP][98] ([i915#17543])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-glk:          NOTRUN -> [SKIP][99] ([i915#17572])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@hang-user:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#4077]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@gem_mmap_gtt@hang-user.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4083]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@gem_mmap_wc@write-gtt-read-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4083]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#3282]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3282]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-snb:          NOTRUN -> [SKIP][105] ([i915#17635])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_ppgtt@shrink-vs-evict-pinned:
    - shard-snb:          NOTRUN -> [SKIP][106] ([i915#17615]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_ppgtt@shrink-vs-evict-pinned.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][107] ([i915#2658])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][108] ([i915#2658])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#3282]) +8 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@gem_pread@snoop.html
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3282]) +8 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@gem_pread@snoop.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4270]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@gem_pxp@display-protected-crc.html
    - shard-snb:          NOTRUN -> [SKIP][112] ([i915#17521]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_pxp@display-protected-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4270]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#13398])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-glk:          NOTRUN -> [SKIP][115] ([i915#17521]) +7 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_readwrite@read-write:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#14544] / [i915#3282])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_readwrite@read-write.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-glk10:        NOTRUN -> [SKIP][117] ([i915#17492])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][118] ([i915#17492]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-snb:          NOTRUN -> [SKIP][119] ([i915#17492]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#5190] / [i915#8428]) +8 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#8428]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-linear:
    - shard-snb:          NOTRUN -> [SKIP][122] ([i915#17591]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_render_copy@yf-tiled-ccs-to-linear.html

  * igt@gem_softpin@evict-snoop:
    - shard-glk:          NOTRUN -> [SKIP][123] ([i915#17551])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#4885]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4885])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4077]) +17 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#4879])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@gem_unfence_active_buffers.html
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4879])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#3297]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-glk:          NOTRUN -> [SKIP][130] ([i915#17507]) +5 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#3297])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#3281] / [i915#3297])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#3281] / [i915#3297])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-snb:          NOTRUN -> [SKIP][134] ([i915#17507]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_vm_create@create-ext:
    - shard-snb:          NOTRUN -> [SKIP][135] ([i915#17596])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_vm_create@create-ext.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [PASS][136] -> [INCOMPLETE][137] ([i915#13356] / [i915#14586])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk9/igt@gem_workarounds@suspend-resume.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk3/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [PASS][138] -> [INCOMPLETE][139] ([i915#13356] / [i915#17880])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-5/igt@gem_workarounds@suspend-resume-fd.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen3_mixed_blits:
    - shard-glk:          NOTRUN -> [SKIP][140] ([i915#17688])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@gen3_mixed_blits.html
    - shard-snb:          NOTRUN -> [SKIP][141] ([i915#17688])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gen3_mixed_blits.html

  * igt@gen3_render_linear_blits:
    - shard-glk10:        NOTRUN -> [SKIP][142] ([i915#17555])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@gen3_render_linear_blits.html

  * igt@gen3_render_tiledx_blits:
    - shard-glk:          NOTRUN -> [SKIP][143] ([i915#17511])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@gen3_render_tiledx_blits.html
    - shard-snb:          NOTRUN -> [SKIP][144] ([i915#17511])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#17455])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-glk:          NOTRUN -> [SKIP][146] ([i915#17505]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk3/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#17455]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gen7_exec_parse@basic-rejected.html
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#17455]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@gen7_exec_parse@basic-rejected.html
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#17455]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@gen7_exec_parse@basic-rejected.html
    - shard-snb:          NOTRUN -> [SKIP][150] ([i915#17505]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-glk10:        NOTRUN -> [SKIP][151] ([i915#17505])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@gen7_exec_parse@bitmasks.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#17455]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#2527])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#14544] / [i915#2527])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#2527] / [i915#2856])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#2856]) +6 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#2527]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-snb:          NOTRUN -> [SKIP][158] ([i915#17597]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gen9_exec_parse@valid-registers.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#15678])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@gpu_buddy@gpu_buddy.html
    - shard-snb:          NOTRUN -> [SKIP][160] ([i915#17514])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@memory-info-active:
    - shard-snb:          NOTRUN -> [SKIP][161] ([i915#17603]) +6 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@i915_drm_fdinfo@memory-info-active.html

  * igt@i915_drm_fdinfo@virtual-busy:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#14118])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@i915_drm_fdinfo@virtual-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#14118])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@i915_drm_fdinfo@virtual-busy.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#13786])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@i915_fb_tiling@basic-x-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#13786])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - shard-glk10:        NOTRUN -> [SKIP][166] ([i915#17580])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-snb:          NOTRUN -> [SKIP][167] ([i915#17526])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@i915_pm_freq_api@freq-suspend.html
    - shard-glk:          NOTRUN -> [SKIP][168] ([i915#17526])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#6590]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#6590]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          NOTRUN -> [FAIL][171] ([i915#12964]) +1 other test fail
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#14498])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk10:        NOTRUN -> [SKIP][173] ([i915#17706])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#11681] / [i915#6621])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#11681] / [i915#6621]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#11681])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@i915_pm_rps@thresholds-idle-park.html
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#11681])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#11681])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#6245])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@i915_query@hwconfig_table.html
    - shard-glk:          NOTRUN -> [SKIP][180] ([i915#17584])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk3/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#6245])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#16079])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-glk:          NOTRUN -> [SKIP][183] ([i915#17673])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][184] ([i915#4817])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][185] ([i915#13356] / [i915#16182] / [i915#4817])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk8/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-snb:          NOTRUN -> [ABORT][186] ([i915#15840]) +7 other tests abort
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@forcewake:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][187] ([i915#13356] / [i915#16182] / [i915#4817])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@i915_suspend@forcewake.html

  * igt@i915_suspend@sysfs-reader:
    - shard-mtlp:         [PASS][188] -> [FAIL][189] ([i915#17170] / [i915#17171])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-8/igt@i915_suspend@sysfs-reader.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-write:
    - shard-glk:          NOTRUN -> [SKIP][190] ([i915#11680])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@intel_hwmon@hwmon-write.html
    - shard-snb:          NOTRUN -> [SKIP][191] ([i915#17674])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#4212])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#5190]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#4212]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_addfb_basic@clobberred-modifier.html
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#4212])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-1/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-glk10:        NOTRUN -> [SKIP][196] ([i915#17485])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][197] ([i915#1769]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#1769] / [i915#3555]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#1769] / [i915#3555])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][200] ([i915#1769])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#1769] / [i915#3555])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-mtlp:         [PASS][202] -> [FAIL][203] ([i915#5956]) +1 other test fail
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-glk10:        NOTRUN -> [SKIP][204] ([i915#17478]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#14544] / [i915#4538] / [i915#5286])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#5286])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#5286])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-snb:          NOTRUN -> [SKIP][208] ([i915#17478]) +18 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#17432] / [i915#5286]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#4538] / [i915#5286]) +3 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#4538] / [i915#5286]) +7 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][212] ([i915#17500]) +13 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-snb:          NOTRUN -> [SKIP][213] ([i915#17500]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#14544] / [i915#17431] / [i915#3638])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-snb:          NOTRUN -> [SKIP][215] ([i915#17524])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#3828])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#17431]) +6 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#17431] / [i915#3638])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#17431])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#17431]) +5 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#17432]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-glk10:        NOTRUN -> [SKIP][222] ([i915#17500])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#3638]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#4538] / [i915#5190]) +12 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][225] ([i915#17478]) +10 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk9/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#14544] / [i915#4538])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-snb:          NOTRUN -> [SKIP][227] ([i915#17556])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#17432]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#17432]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#4538]) +4 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#4538]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#17432]) +5 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-glk:          [PASS][233] -> [DMESG-WARN][234] ([i915#118])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#10307] / [i915#6095]) +132 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#6095]) +117 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][237] ([i915#17491]) +16 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-snb:          NOTRUN -> [SKIP][238] ([i915#17594]) +33 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#12313]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#12313]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#12313])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][242] ([i915#17525])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][243] ([i915#17490] / [i915#17491]) +47 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][246] ([i915#17491]) +131 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-glk:          NOTRUN -> [SKIP][247] ([i915#17525]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#12805])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#12805])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#6095]) +79 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#6095]) +19 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#12805])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [PASS][253] -> [FAIL][254] ([i915#17158]) +1 other test fail
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][255] ([i915#13356] / [i915#15582]) +1 other test incomplete
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#6095]) +9 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][257] ([i915#13356] / [i915#15582]) +1 other test incomplete
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#6095]) +67 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#14098] / [i915#6095]) +46 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#14544] / [i915#6095]) +7 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][261] ([i915#17490] / [i915#17491]) +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#12313])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-glk:          NOTRUN -> [SKIP][263] ([i915#17550])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_cdclk@mode-rejected-max-dotclock.html
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#17099])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#13781]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#11151])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_chamelium_audio@dp-audio-after-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#11151])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-snb:          NOTRUN -> [SKIP][268] ([i915#17483]) +5 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-snb:          NOTRUN -> [SKIP][269] ([i915#17489])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#17427]) +4 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#17427]) +5 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#17427]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#17427]) +4 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html
    - shard-snb:          NOTRUN -> [SKIP][274] ([i915#17497]) +4 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-glk:          NOTRUN -> [SKIP][275] ([i915#17497]) +6 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#14544] / [i915#17427]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#17427])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][278] ([i915#17497])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#16471] / [i915#17427]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#16471] / [i915#17427]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#16471] / [i915#17427]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#16471] / [i915#17427])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-2/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#11151] / [i915#7828]) +6 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-glk10:        NOTRUN -> [SKIP][284] ([i915#17483]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-glk:          NOTRUN -> [SKIP][285] ([i915#17483]) +8 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#11151] / [i915#7828]) +5 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#11151] / [i915#7828]) +7 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#11151] / [i915#7828]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#11151] / [i915#7828]) +6 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][290] ([i915#17510]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-snb:          NOTRUN -> [SKIP][291] ([i915#17510]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][292] ([i915#17510])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-glk:          NOTRUN -> [SKIP][293] ([i915#17508]) +5 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#15330]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-glk:          NOTRUN -> [SKIP][295] ([i915#17502])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#15330])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#15330] / [i915#3299])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#15330] / [i915#3299])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_content_protection@dp-mst-type-1.html
    - shard-snb:          NOTRUN -> [SKIP][299] ([i915#17502])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_content_protection@dp-mst-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#15330] / [i915#3116] / [i915#3299])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-snb:          NOTRUN -> [SKIP][301] ([i915#17508]) +4 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#15865])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@lic-type-1:
    - shard-glk10:        NOTRUN -> [SKIP][303] ([i915#17508])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#15865]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#15865]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#15865]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#15865]) +4 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-glk:          NOTRUN -> [SKIP][308] ([i915#17533]) +4 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#13049])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-rkl:          [PASS][310] -> [FAIL][311] ([i915#13566]) +1 other test fail
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#13049]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#13049]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#13049]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-snb:          NOTRUN -> [SKIP][315] ([i915#17504]) +4 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#3555]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-snb:          NOTRUN -> [SKIP][317] ([i915#17533]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-glk:          NOTRUN -> [SKIP][318] ([i915#17504]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#8814])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#3555] / [i915#8814])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][321] ([i915#12358] / [i915#14152]) +1 other test incomplete
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#4103])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-glk10:        NOTRUN -> [SKIP][323] ([i915#17457]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#14544] / [i915#17428]) +15 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#17428] / [i915#17454]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][326] ([i915#17428] / [i915#9809]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#13046] / [i915#17454] / [i915#5354]) +7 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [FAIL][328] ([i915#15804])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#13691])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][330] ([i915#17487])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][331] ([i915#17486]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#3804])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-snb:          NOTRUN -> [SKIP][333] ([i915#17486]) +3 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#17287])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#17287])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-snb:          NOTRUN -> [SKIP][336] ([i915#17519])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-glk:          NOTRUN -> [SKIP][337] ([i915#17616])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][338] ([i915#17288])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-2/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-glk10:        NOTRUN -> [SKIP][339] ([i915#17506])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#13748]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_dp_link_training@uhbr-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#13748])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][342] ([i915#17477]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk9/igt@kms_dp_link_training@uhbr-mst-direct-train.html
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#17285])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_dp_link_training@uhbr-mst-direct-train.html
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#17285]) +1 other test skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#13748])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-mtlp:         NOTRUN -> [SKIP][346] ([i915#17297])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-1/igt@kms_dp_link_training@uhbr-sst-direct-train.html
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#17285])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#17285]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
    - shard-snb:          NOTRUN -> [SKIP][349] ([i915#17477]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
    - shard-glk10:        NOTRUN -> [SKIP][350] ([i915#17477])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#16867])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-glk:          NOTRUN -> [SKIP][352] ([i915#17548])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#14544] / [i915#16867])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-snb:          NOTRUN -> [SKIP][354] ([i915#17548])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#8812])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#8812])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#16361]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#16361]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][359] ([i915#16361]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-snb:          NOTRUN -> [SKIP][360] ([i915#17458]) +4 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
    - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#16361]) +6 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-glk:          NOTRUN -> [SKIP][362] ([i915#17458]) +5 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#14544] / [i915#16361]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-glk10:        NOTRUN -> [SKIP][364] ([i915#17458]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-dg2:          NOTRUN -> [SKIP][365] ([i915#16361]) +5 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#16680])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-mtlp:         [PASS][367] -> [FAIL][368] ([i915#4767])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-1/igt@kms_fbcon_fbt@psr-suspend.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-snb:          NOTRUN -> [SKIP][369] ([i915#17581])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#14544] / [i915#16084])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#16081])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dsc:
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#16600])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#658])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_feature_discovery@psr2.html
    - shard-snb:          NOTRUN -> [SKIP][374] ([i915#17585])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_feature_discovery@psr2.html
    - shard-tglu:         NOTRUN -> [SKIP][375] ([i915#658])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_feature_discovery@psr2.html
    - shard-glk:          NOTRUN -> [SKIP][376] ([i915#17585])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#658])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#658])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#4881])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_fence_pin_leak.html
    - shard-dg1:          NOTRUN -> [SKIP][380] ([i915#4881])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][381] ([i915#3637] / [i915#9934]) +7 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][382] ([i915#9934]) +5 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][383] ([i915#3637] / [i915#9934])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][384] ([i915#9934]) +4 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][385] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][386] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][387] ([i915#9934]) +4 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-glk:          [PASS][388] -> [FAIL][389] ([i915#13027]) +1 other test fail
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][390] ([i915#8381])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-1/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][391] ([i915#8381]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_flip@flip-vs-fences-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#8381])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2:          NOTRUN -> [ABORT][393] ([i915#17844]) +14 other tests abort
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_flip@flip-vs-suspend.html
    - shard-tglu:         [PASS][394] -> [ABORT][395] ([i915#15840]) +2 other tests abort
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-tglu-7/igt@kms_flip@flip-vs-suspend.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][396] ([i915#17484]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][397] ([i915#15643]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][398] ([i915#14544] / [i915#15643])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-snb:          NOTRUN -> [SKIP][399] ([i915#17593]) +5 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][400] ([i915#17522]) +9 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][401] ([i915#15643] / [i915#5190]) +2 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][402] ([i915#15643])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][403] ([i915#15643]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][404] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][405] ([i915#15643]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][406] ([i915#15643])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-glk10:        NOTRUN -> [SKIP][407] ([i915#17493])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-snb:          NOTRUN -> [SKIP][408] ([i915#17606]) +4 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][409] ([i915#17559])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-snb:          NOTRUN -> [SKIP][410] ([i915#17559])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][411] ([i915#5439])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][412] ([i915#10055])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-snb:          NOTRUN -> [SKIP][413] ([i915#17609])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][414] -> [SKIP][415] ([i915#17517]) +11 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][416] ([i915#15989]) +17 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][417] ([i915#15989]) +18 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][418] ([i915#17428]) +58 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][419] ([i915#15990]) +28 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][420] ([i915#15989]) +24 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][421] ([i915#15989]) +25 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][422] ([i915#17588]) +116 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][423] ([i915#14544] / [i915#17428] / [i915#1825]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][424] ([i915#17428] / [i915#1825]) +6 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][425] ([i915#15990] / [i915#8708])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-mtlp:         [PASS][426] -> [FAIL][427] ([i915#17276])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][428] ([i915#15990]) +36 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][429] ([i915#15102]) +26 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][430] ([i915#15102]) +32 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-mtlp:         NOTRUN -> [SKIP][431] ([i915#15989]) +10 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][432] ([i915#17428]) +54 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][433] ([i915#15990]) +3 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][434] ([i915#17517]) +65 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          NOTRUN -> [SKIP][435] ([i915#15991]) +47 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][436] ([i915#15991] / [i915#17428]) +9 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt:
    - shard-snb:          NOTRUN -> [SKIP][437] ([i915#17517]) +25 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu:
    - shard-rkl:          [PASS][438] -> [SKIP][439] ([i915#15989]) +5 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][440] ([i915#15104] / [i915#15990])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][441] ([i915#15104] / [i915#15990]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][442] ([i915#15990] / [i915#8708]) +16 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
    - shard-snb:          NOTRUN -> [SKIP][443] ([i915#17482]) +54 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][444] ([i915#15102]) +42 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][445] ([i915#17482]) +146 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][446] ([i915#14544] / [i915#15102]) +6 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][447] ([i915#15991] / [i915#5354]) +34 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][448] ([i915#17428]) +85 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
    - shard-mtlp:         NOTRUN -> [SKIP][449] ([i915#15991] / [i915#17428] / [i915#1825]) +8 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][450] ([i915#15990] / [i915#8708]) +24 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-mtlp:         NOTRUN -> [FAIL][451] ([i915#17276])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][452] ([i915#15102]) +50 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-glk10:        NOTRUN -> [SKIP][453] ([i915#17482]) +16 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-snb:          NOTRUN -> [FAIL][454] ([i915#17104])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
    - shard-mtlp:         NOTRUN -> [SKIP][455] ([i915#17103])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-tglu:         NOTRUN -> [FAIL][456] ([i915#17101] / [i915#17108] / [i915#17188])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@bpc-switch:
    - shard-glk:          NOTRUN -> [SKIP][457] ([i915#17498]) +2 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_hdr@bpc-switch.html
    - shard-dg2:          NOTRUN -> [SKIP][458] ([i915#16518] / [i915#3555] / [i915#8228]) +1 other test skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_hdr@bpc-switch.html
    - shard-dg1:          NOTRUN -> [SKIP][459] ([i915#3555] / [i915#8228]) +1 other test skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_hdr@bpc-switch.html
    - shard-snb:          NOTRUN -> [SKIP][460] ([i915#17498]) +1 other test skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][461] ([i915#16644] / [i915#3555] / [i915#8228]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][462] ([i915#17678])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][463] ([i915#15459])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][464] ([i915#15459])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_joiner@basic-force-big-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][465] ([i915#17678])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-glk:          NOTRUN -> [SKIP][466] ([i915#17575])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][467] ([i915#15458]) +1 other test skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-tglu:         NOTRUN -> [SKIP][468] ([i915#16451])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-glk:          NOTRUN -> [SKIP][469] ([i915#17540]) +1 other test skip
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-snb:          NOTRUN -> [SKIP][470] ([i915#17540])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][471] ([i915#17461])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][472] ([i915#17686]) +1 other test skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-snb:          NOTRUN -> [SKIP][473] ([i915#17601])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][474] ([i915#118])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         NOTRUN -> [SKIP][475] ([i915#14712]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-snb:          NOTRUN -> [SKIP][476] ([i915#17479]) +4 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][477] ([i915#16386]) +3 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][478] ([i915#15709]) +3 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][479] ([i915#15709]) +4 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][480] ([i915#16386]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - shard-glk:          NOTRUN -> [SKIP][481] ([i915#17479]) +8 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][482] ([i915#16386]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][483] ([i915#15709]) +2 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_plane@pixel-format-yf-tiled-modifier.html
    - shard-tglu:         NOTRUN -> [SKIP][484] ([i915#15709]) +2 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - shard-snb:          NOTRUN -> [SKIP][485] ([i915#17595]) +2 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_plane_alpha_blend@alpha-7efc.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][486] ([i915#12178])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][487] ([i915#7862]) +1 other test fail
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][488] ([i915#3555] / [i915#8821])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html
    - shard-dg1:          NOTRUN -> [SKIP][489] ([i915#3555]) +6 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_plane_lowres@tiling-yf.html
    - shard-snb:          NOTRUN -> [SKIP][490] ([i915#17509])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_plane_lowres@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][491] ([i915#3555]) +4 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          NOTRUN -> [SKIP][492] ([i915#13958]) +1 other test skip
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          NOTRUN -> [SKIP][493] ([i915#13958])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-snb:          NOTRUN -> [SKIP][494] ([i915#17586])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg1:          NOTRUN -> [SKIP][495] ([i915#13958])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][496] ([i915#14259])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][497] ([i915#14259])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:
    - shard-glk:          NOTRUN -> [SKIP][498] ([i915#17528]) +1 other test skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled.html
    - shard-dg1:          NOTRUN -> [SKIP][499] ([i915#17832]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-a-hdmi-a-1-xv36:
    - shard-rkl:          NOTRUN -> [SKIP][500] ([i915#17843]) +8 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-a-hdmi-a-1-xv36.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][501] ([i915#17832]) +3 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-yuyv:
    - shard-glk:          NOTRUN -> [SKIP][502] ([i915#17833]) +8 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-yuyv.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][503] ([i915#17832])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html
    - shard-snb:          NOTRUN -> [SKIP][504] ([i915#17528]) +8 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html
    - shard-tglu:         NOTRUN -> [SKIP][505] ([i915#17832])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][506] ([i915#17529])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-a-hdmi-a-1-xrgb16161616f:
    - shard-tglu:         NOTRUN -> [SKIP][507] ([i915#17843]) +11 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-a-hdmi-a-1-xrgb16161616f.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-1-rgb565:
    - shard-glk:          NOTRUN -> [SKIP][508] ([i915#17843]) +2 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-1-rgb565.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][509] ([i915#17832])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][510] ([i915#12343] / [i915#9812]) +1 other test skip
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][511] ([i915#12343] / [i915#5354])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-glk:          NOTRUN -> [SKIP][512] ([i915#17462]) +1 other test skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][513] ([i915#12343] / [i915#5354]) +1 other test skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][514] ([i915#12343] / [i915#5354]) +1 other test skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-snb:          NOTRUN -> [SKIP][515] ([i915#17462]) +1 other test skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-snb:          NOTRUN -> [SKIP][516] ([i915#17602]) +2 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-glk:          NOTRUN -> [SKIP][517] ([i915#17495])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_pm_dc@dc5-pageflip-negative.html
    - shard-dg2:          NOTRUN -> [SKIP][518] ([i915#9685])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_pm_dc@dc5-pageflip-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][519] ([i915#9685])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2:          NOTRUN -> [SKIP][520] ([i915#15948])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_pm_dc@dc5-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][521] ([i915#15948])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][522] ([i915#3828])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-glk:          NOTRUN -> [SKIP][523] ([i915#17564]) +1 other test skip
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][524] ([i915#15948])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg1:          NOTRUN -> [SKIP][525] ([i915#4077]) +9 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-glk10:        NOTRUN -> [SKIP][526] ([i915#15073])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-snb:          NOTRUN -> [SKIP][527] ([i915#17473]) +6 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][528] -> [SKIP][529] ([i915#15073]) +2 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][530] ([i915#15073])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-glk:          NOTRUN -> [SKIP][531] ([i915#17710])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk9/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][532] ([i915#11520]) +11 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - shard-dg2:          NOTRUN -> [SKIP][533] ([i915#11520]) +11 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][534] ([i915#11520]) +9 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][535] ([i915#12316]) +1 other test skip
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][536] ([i915#11520]) +1 other test skip
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][537] ([i915#11520]) +7 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][538] ([i915#11520]) +8 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][539] ([i915#11520] / [i915#14544]) +1 other test skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][540] ([i915#11520]) +11 other tests skip
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          NOTRUN -> [SKIP][541] ([i915#9683])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][542] ([i915#9683]) +1 other test skip
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-mtlp:         NOTRUN -> [SKIP][543] ([i915#9688]) +3 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-snb:          NOTRUN -> [SKIP][544] ([i915#17480]) +22 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-glk:          NOTRUN -> [SKIP][545] ([i915#17480]) +29 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-glk10:        NOTRUN -> [SKIP][546] ([i915#17480]) +4 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][547] ([i915#9732]) +18 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-glk:          NOTRUN -> [SKIP][548] ([i915#17480] / [i915#9732])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][549] ([i915#1072] / [i915#9732]) +12 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][550] ([i915#1072] / [i915#9732]) +26 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][551] ([i915#1072] / [i915#9732]) +17 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-suspend@edp-1:
    - shard-mtlp:         [PASS][552] -> [FAIL][553] ([i915#17226]) +1 other test fail
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-3/igt@kms_psr@psr2-suspend@edp-1.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@kms_psr@psr2-suspend@edp-1.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][554] ([i915#15949]) +1 other test skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][555] ([i915#15949])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-snb:          NOTRUN -> [SKIP][556] ([i915#17554])
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-glk:          NOTRUN -> [SKIP][557] ([i915#17554])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][558] ([i915#15949])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][559] ([i915#4235])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][560] ([i915#5289])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-snb:          NOTRUN -> [SKIP][561] ([i915#17488]) +5 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][562] ([i915#15867])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-glk10:        NOTRUN -> [SKIP][563] ([i915#17488])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-glk:          NOTRUN -> [SKIP][564] ([i915#17488]) +2 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][565] ([i915#12755] / [i915#15867] / [i915#5190])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][566] ([i915#17432] / [i915#5289])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][567] ([i915#12755] / [i915#15867]) +1 other test skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-glk:          NOTRUN -> [SKIP][568] ([i915#17501])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
    - shard-rkl:          NOTRUN -> [SKIP][569] ([i915#3555]) +1 other test skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html
    - shard-snb:          NOTRUN -> [SKIP][570] ([i915#17501])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-dg1:          NOTRUN -> [ABORT][571] ([i915#13179]) +1 other test abort
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-glk:          NOTRUN -> [SKIP][572] ([i915#17463])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][573] ([i915#8623])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][574] ([i915#17445])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [PASS][575] -> [INCOMPLETE][576] ([i915#12276]) +1 other test incomplete
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][577] ([i915#12276] / [i915#13356]) +3 other tests incomplete
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][578] ([i915#17752]) +3 other tests dmesg-warn
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][579] ([i915#15840] / [i915#17752]) +1 other test dmesg-warn
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic:
    - shard-dg2:          NOTRUN -> [SKIP][580] ([i915#15243] / [i915#3555]) +1 other test skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_vrr@flip-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][581] ([i915#15243] / [i915#3555])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_vrr@flip-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][582] ([i915#3555] / [i915#8808])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-4/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-glk:          NOTRUN -> [SKIP][583] ([i915#17561])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_vrr@lobf.html
    - shard-dg2:          NOTRUN -> [SKIP][584] ([i915#11920])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][585] ([i915#11920])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-glk:          NOTRUN -> [SKIP][586] ([i915#17520]) +4 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_vrr@max-min.html
    - shard-rkl:          NOTRUN -> [SKIP][587] ([i915#9906])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][588] ([i915#3555] / [i915#9906])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][589] ([i915#9906]) +2 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-dg1:          NOTRUN -> [SKIP][590] ([i915#9906]) +2 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-snb:          NOTRUN -> [SKIP][591] ([i915#17520]) +3 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-glk:          NOTRUN -> [SKIP][592] ([i915#17536])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][593] ([i915#9100]) +1 other test fail
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@stress-open-close:
    - shard-snb:          NOTRUN -> [SKIP][594] ([i915#17592]) +6 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@perf@stress-open-close.html

  * igt@perf_pmu@busy-accuracy-50:
    - shard-snb:          NOTRUN -> [SKIP][595] ([i915#17637]) +1 other test skip
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@perf_pmu@busy-accuracy-50.html

  * igt@perf_pmu@busy-accuracy-50@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][596] ([i915#17651]) +1 other test skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@perf_pmu@busy-accuracy-50@bcs0.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-mtlp:         [PASS][597] -> [FAIL][598] ([i915#4349]) +3 other tests fail
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-1/igt@perf_pmu@busy-double-start@vcs1.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-4/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          NOTRUN -> [FAIL][599] ([i915#4349]) +4 other tests fail
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-glk10:        NOTRUN -> [SKIP][600] ([i915#17698]) +1 other test skip
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk10/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          NOTRUN -> [SKIP][601] ([i915#8516]) +1 other test skip
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-mtlp:         [PASS][602] -> [FAIL][603] ([i915#17245])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-2/igt@perf_pmu@rc6-suspend.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-glk:          NOTRUN -> [SKIP][604] ([i915#17583])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-snb:          NOTRUN -> [SKIP][605] ([i915#17583])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][606] ([i915#8516])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt0:
    - shard-snb:          NOTRUN -> [SKIP][607] ([i915#17687]) +1 other test skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@perf_pmu@rc6@runtime-pm-long-gt0.html

  * igt@prime_udl@share-import-addfb:
    - shard-glk:          NOTRUN -> [SKIP][608] ([i915#16420])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@prime_udl@share-import-addfb.html
    - shard-dg2:          NOTRUN -> [SKIP][609] ([i915#16420])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@prime_udl@share-import-addfb.html
    - shard-dg1:          NOTRUN -> [SKIP][610] ([i915#16420])
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-glk:          NOTRUN -> [SKIP][611] ([i915#17467])
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@prime_vgem@fence-flip-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][612] ([i915#3708]) +1 other test skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@prime_vgem@fence-flip-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][613] ([i915#3708]) +1 other test skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@prime_vgem@fence-flip-hang.html
    - shard-snb:          NOTRUN -> [SKIP][614] ([i915#17467]) +1 other test skip
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb4/igt@prime_vgem@fence-flip-hang.html

  * igt@sw_sync@sync_busy_fork:
    - shard-glk:          NOTRUN -> [DMESG-WARN][615] ([i915#118])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@sw_sync@sync_busy_fork.html

  * igt@sysfs_heartbeat_interval@precise:
    - shard-snb:          NOTRUN -> [SKIP][616] ([i915#17642]) +1 other test skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@sysfs_heartbeat_interval@precise.html

  * igt@sysfs_heartbeat_interval@precise@vcs0:
    - shard-snb:          NOTRUN -> [SKIP][617] ([i915#17643]) +1 other test skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb6/igt@sysfs_heartbeat_interval@precise@vcs0.html

  * igt@sysfs_timeslice_duration@timeout:
    - shard-snb:          NOTRUN -> [SKIP][618] ([i915#17632]) +3 other tests skip
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-snb5/igt@sysfs_timeslice_duration@timeout.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-glk:          NOTRUN -> [SKIP][619] ([i915#17545])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk1/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][620] ([i915#4818])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@tools_test@sysfs_l3_parity.html
    - shard-rkl:          NOTRUN -> [SKIP][621] ([i915#17447])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - shard-mtlp:         [FAIL][622] ([i915#17160]) -> [PASS][623] +1 other test pass
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-1/igt@gem_exec_suspend@basic-s0.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          [FAIL][624] ([i915#17879]) -> [PASS][625] +1 other test pass
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-mtlp:         [FAIL][626] ([i915#17879]) -> [PASS][627] +1 other test pass
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-1/igt@gem_exec_suspend@basic-s4-devices.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-tglu:         [ABORT][628] ([i915#15840]) -> [PASS][629]
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-tglu-7/igt@gem_workarounds@suspend-resume-fd.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-4/igt@gem_workarounds@suspend-resume-fd.html
    - shard-glk:          [INCOMPLETE][630] ([i915#13356] / [i915#14586]) -> [PASS][631]
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk4/igt@gem_workarounds@suspend-resume-fd.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_selftest@live@late_gt_pm:
    - shard-tglu:         [ABORT][632] ([i915#17027]) -> [PASS][633] +1 other test pass
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-tglu-3/igt@i915_selftest@live@late_gt_pm.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_3d@basic:
    - shard-mtlp:         [SKIP][634] ([i915#15726]) -> [PASS][635]
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-1/igt@kms_3d@basic.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_3d@basic.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][636] ([i915#15733] / [i915#5138]) -> [PASS][637]
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          [DMESG-WARN][638] ([i915#13363]) -> [PASS][639]
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - shard-rkl:          [DMESG-WARN][640] ([i915#17147]) -> [PASS][641]
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-rkl:          [FAIL][642] ([i915#13566]) -> [PASS][643] +4 other tests pass
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-mtlp:         [FAIL][644] ([i915#17157]) -> [PASS][645] +1 other test pass
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-5/igt@kms_cursor_crc@cursor-suspend.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-mtlp:         [DMESG-FAIL][646] ([i915#16175]) -> [PASS][647]
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-2/igt@kms_flip_tiling@flip-change-tiling.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-mc-ccs-to-linear:
    - shard-mtlp:         [FAIL][648] ([i915#15733]) -> [PASS][649] +6 other tests pass
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-mc-ccs-to-linear.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-mc-ccs-to-linear.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-cc-to-4-mc-ccs:
    - shard-mtlp:         [DMESG-WARN][650] ([i915#16175]) -> [PASS][651]
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-cc-to-4-mc-ccs.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-cc-to-4-mc-ccs.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [INCOMPLETE][652] ([i915#10056]) -> [PASS][653]
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-gtt:
    - shard-glk:          [SKIP][654] ([i915#17517]) -> [PASS][655] +5 other tests pass
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-gtt.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
    - shard-rkl:          [SKIP][656] ([i915#15989]) -> [PASS][657] +10 other tests pass
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-glk:          [SKIP][658] ([i915#17528]) -> [PASS][659]
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk6/igt@kms_plane_scaling@intel-max-src-size.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-tglu:         [SKIP][660] ([i915#17832] / [i915#6953]) -> [PASS][661]
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-mtlp:         [INCOMPLETE][662] ([i915#17032]) -> [PASS][663]
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-6/igt@kms_pm_backlight@fade-with-suspend.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [SKIP][664] ([i915#9340]) -> [PASS][665]
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg1:          [SKIP][666] ([i915#15073]) -> [PASS][667]
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:
    - shard-glk:          [ABORT][668] ([i915#13179]) -> [PASS][669]
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-mtlp:         [FAIL][670] ([i915#17209]) -> [PASS][671] +1 other test pass
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          [INCOMPLETE][672] ([i915#12276]) -> [PASS][673] +1 other test pass
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@perf@gen12-oa-tlb-invalidate@0-rcs0:
    - shard-rkl:          [FAIL][674] -> [PASS][675] +1 other test pass
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-8/igt@perf@gen12-oa-tlb-invalidate@0-rcs0.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@perf@gen12-oa-tlb-invalidate@0-rcs0.html

  * igt@perf_pmu@busy-hang:
    - shard-tglu:         [FAIL][676] -> [PASS][677] +1 other test pass
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-tglu-9/igt@perf_pmu@busy-hang.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@perf_pmu@busy-hang.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          [SKIP][678] ([i915#8411]) -> [SKIP][679] ([i915#14544] / [i915#8411]) +1 other test skip
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          [SKIP][680] ([i915#3281]) -> [SKIP][681] ([i915#14544] / [i915#3281]) +1 other test skip
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][682] ([i915#14544] / [i915#3281]) -> [SKIP][683] ([i915#3281]) +2 other tests skip
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_lmem_swapping@basic:
    - shard-rkl:          [SKIP][684] ([i915#14544] / [i915#4613]) -> [SKIP][685] ([i915#4613])
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@gem_lmem_swapping@basic.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-rkl:          [SKIP][686] ([i915#4613]) -> [SKIP][687] ([i915#14544] / [i915#4613]) +1 other test skip
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          [SKIP][688] ([i915#3282]) -> [SKIP][689] ([i915#14544] / [i915#3282]) +3 other tests skip
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-7/igt@gem_partial_pwrite_pread@reads.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          [SKIP][690] ([i915#14544] / [i915#3282]) -> [SKIP][691] ([i915#3282])
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_softpin@evict-snoop:
    - shard-rkl:          [SKIP][692] ([i915#17430]) -> [SKIP][693] ([i915#14544] / [i915#17430])
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-2/igt@gem_softpin@evict-snoop.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          [SKIP][694] ([i915#3297]) -> [SKIP][695] ([i915#14544] / [i915#3297])
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-2/igt@gem_userptr_blits@coherency-unsync.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          [SKIP][696] ([i915#3281] / [i915#3297]) -> [SKIP][697] ([i915#14544] / [i915#3281] / [i915#3297])
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-5/igt@gem_userptr_blits@relocations.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          [SKIP][698] ([i915#14544] / [i915#3297]) -> [SKIP][699] ([i915#3297])
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_render_linear_blits:
    - shard-rkl:          [SKIP][700] ([i915#14544] / [i915#17455]) -> [SKIP][701] ([i915#17455]) +1 other test skip
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@gen3_render_linear_blits.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-rkl:          [SKIP][702] ([i915#17455]) -> [SKIP][703] ([i915#14544] / [i915#17455]) +1 other test skip
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-7/igt@gen7_exec_parse@batch-without-end.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gen7_exec_parse@batch-without-end.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          [SKIP][704] ([i915#14544] / [i915#15479]) -> [SKIP][705] ([i915#15479]) +4 other tests skip
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          [SKIP][706] ([i915#14544] / [i915#6412]) -> [SKIP][707] ([i915#6412])
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@i915_module_load@resize-bar.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][708] ([i915#8399]) -> [SKIP][709] ([i915#14544] / [i915#8399])
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-3/igt@i915_pm_freq_api@freq-suspend.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          [SKIP][710] ([i915#14544] / [i915#16080] / [i915#16166]) -> [SKIP][711] ([i915#16080] / [i915#16166])
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][712] ([i915#5723]) -> [SKIP][713] ([i915#14544] / [i915#5723])
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-3/igt@i915_query@test-query-geometry-subslices.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          [SKIP][714] ([i915#12454] / [i915#12712]) -> [SKIP][715] ([i915#12454] / [i915#12712] / [i915#14544])
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][716] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][717] ([i915#4538] / [i915#5286]) +1 other test skip
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][718] ([i915#5286]) -> [SKIP][719] ([i915#14544] / [i915#5286])
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-rkl:          [SKIP][720] ([i915#4538] / [i915#5286]) -> [SKIP][721] ([i915#14544] / [i915#4538] / [i915#5286]) +1 other test skip
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          [SKIP][722] ([i915#17431] / [i915#3638]) -> [SKIP][723] ([i915#14544] / [i915#17431] / [i915#3638]) +2 other tests skip
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-5/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][724] ([i915#3828]) -> [SKIP][725] ([i915#14544] / [i915#3828])
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][726] ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][727] ([i915#17431] / [i915#3638])
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          [SKIP][728] ([i915#4538]) -> [SKIP][729] ([i915#14544] / [i915#4538]) +2 other tests skip
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-rkl:          [SKIP][730] ([i915#14544] / [i915#17432]) -> [SKIP][731] ([i915#17432])
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][732] ([i915#14544] / [i915#4538]) -> [SKIP][733] ([i915#4538]) +1 other test skip
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][734] ([i915#14098] / [i915#6095]) -> [SKIP][735] ([i915#14098] / [i915#14544] / [i915#6095]) +8 other tests skip
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][736] ([i915#14544] / [i915#6095]) -> [SKIP][737] ([i915#6095]) +4 other tests skip
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][738] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][739] ([i915#14098] / [i915#6095]) +7 other tests skip
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][740] ([i915#12313]) -> [SKIP][741] ([i915#12313] / [i915#14544])
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][742] ([i915#6095]) -> [SKIP][743] ([i915#14544] / [i915#6095]) +5 other tests skip
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          [SKIP][744] ([i915#3742]) -> [SKIP][745] ([i915#14544] / [i915#3742])
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-4/igt@kms_cdclk@plane-scaling.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-rkl:          [SKIP][746] ([i915#14544] / [i915#17427]) -> [SKIP][747] ([i915#17427])
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_chamelium_color@ctm-green-to-red.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@degamma:
    - shard-rkl:          [SKIP][748] ([i915#17427]) -> [SKIP][749] ([i915#14544] / [i915#17427]) +1 other test skip
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-2/igt@kms_chamelium_color@degamma.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          [SKIP][750] ([i915#11151] / [i915#7828]) -> [SKIP][751] ([i915#11151] / [i915#14544] / [i915#7828]) +5 other tests skip
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-read.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-rkl:          [SKIP][752] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][753] ([i915#11151] / [i915#7828]) +2 other tests skip
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-rkl:          [SKIP][754] ([i915#11151] / [i915#14544]) -> [SKIP][755] ([i915#11151])
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          [SKIP][756] ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][757] ([i915#15330] / [i915#3116])
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-rkl:          [SKIP][758] ([i915#15330]) -> [SKIP][759] ([i915#14544] / [i915#15330])
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          [SKIP][760] ([i915#15330] / [i915#3116]) -> [SKIP][761] ([i915#14544] / [i915#15330] / [i915#3116])
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          [SKIP][762] ([i915#14544] / [i915#3555]) -> [SKIP][763] ([i915#3555]) +5 other tests skip
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          [SKIP][764] ([i915#13049]) -> [SKIP][765] ([i915#13049] / [i915#14544])
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          [SKIP][766] ([i915#14544] / [i915#17428]) -> [SKIP][767] ([i915#17428]) +25 other tests skip
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          [SKIP][768] ([i915#4103]) -> [SKIP][769] ([i915#14544] / [i915#4103])
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][770] ([i915#14544] / [i915#9723]) -> [SKIP][771] ([i915#9723])
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev@basic:
    - shard-rkl:          [SKIP][772] ([i915#1257] / [i915#14544]) -> [SKIP][773] ([i915#1257])
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_dp_aux_dev@basic.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          [SKIP][774] ([i915#16867]) -> [SKIP][775] ([i915#14544] / [i915#16867])
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          [SKIP][776] ([i915#14544] / [i915#16361]) -> [SKIP][777] ([i915#16361])
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-rkl:          [SKIP][778] ([i915#16361]) -> [SKIP][779] ([i915#14544] / [i915#16361])
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-4/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-rkl:          [SKIP][780] ([i915#14544] / [i915#9934]) -> [SKIP][781] ([i915#9934]) +1 other test skip
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          [SKIP][782] ([i915#9934]) -> [SKIP][783] ([i915#14544] / [i915#9934]) +4 other tests skip
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-4/igt@kms_flip@2x-plain-flip-interruptible.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][784] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][785] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113])
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk5/igt@kms_flip@flip-vs-suspend.html
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][786] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#6113]) -> [INCOMPLETE][787] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#6113])
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][788] ([i915#14544] / [i915#15643]) -> [SKIP][789] ([i915#15643])
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][790] ([i915#15643]) -> [SKIP][791] ([i915#14544] / [i915#15643]) +1 other test skip
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-rte:
    - shard-rkl:          [SKIP][792] ([i915#17428]) -> [SKIP][793] ([i915#14544] / [i915#17428]) +35 other tests skip
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          [SKIP][794] ([i915#14544] / [i915#15102]) -> [SKIP][795] ([i915#15102]) +16 other tests skip
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          [SKIP][796] ([i915#14544] / [i915#9766]) -> [SKIP][797] ([i915#9766])
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][798] ([i915#17428] / [i915#1825]) -> [SKIP][799] ([i915#14544] / [i915#17428] / [i915#1825]) +4 other tests skip
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - shard-rkl:          [SKIP][800] ([i915#15102]) -> [SKIP][801] ([i915#14544] / [i915#15102]) +25 other tests skip
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][802] ([i915#1187] / [i915#12713] / [i915#16490]) -> [SKIP][803] ([i915#12713] / [i915#16490])
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          [SKIP][804] ([i915#15458]) -> [SKIP][805] ([i915#14544] / [i915#15458])
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-7/igt@kms_joiner@basic-ultra-joiner.html
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          [SKIP][806] ([i915#14544] / [i915#15460]) -> [SKIP][807] ([i915#15460])
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][808] ([i915#14544] / [i915#15815]) -> [SKIP][809] ([i915#15815])
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][810] ([i915#14544] / [i915#6301]) -> [SKIP][811] ([i915#6301])
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          [SKIP][812] ([i915#14544] / [i915#15709]) -> [SKIP][813] ([i915#15709]) +1 other test skip
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-rkl:          [SKIP][814] ([i915#15709]) -> [SKIP][815] ([i915#14544] / [i915#15709]) +3 other tests skip
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          [SKIP][816] ([i915#13958] / [i915#14544]) -> [SKIP][817] ([i915#13958])
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:
    - shard-rkl:          [SKIP][818] ([i915#17832]) -> [SKIP][819] ([i915#14544] / [i915#17832]) +1 other test skip
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled.html
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:
    - shard-rkl:          [SKIP][820] ([i915#14544] / [i915#17832]) -> [SKIP][821] ([i915#17832])
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          [SKIP][822] ([i915#12343] / [i915#5354]) -> [SKIP][823] ([i915#12343] / [i915#14544] / [i915#5354])
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.html
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-rkl:          [SKIP][824] ([i915#16914]) -> [SKIP][825] ([i915#14544] / [i915#16914])
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-7/igt@kms_pm_dc@dc5-psr-suspend-resume.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][826] ([i915#15739]) -> [SKIP][827] ([i915#14544] / [i915#15739])
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [ABORT][828] ([i915#17844]) -> [INCOMPLETE][829] ([i915#14419])
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-dg2-8/igt@kms_pm_rpm@system-suspend-idle.html
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][830] ([i915#11520] / [i915#14544]) -> [SKIP][831] ([i915#11520]) +2 other tests skip
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][832] ([i915#11520]) -> [SKIP][833] ([i915#11520] / [i915#14544]) +3 other tests skip
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          [SKIP][834] ([i915#1072] / [i915#9732]) -> [SKIP][835] ([i915#1072] / [i915#14544] / [i915#9732]) +11 other tests skip
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-8/igt@kms_psr@fbc-psr2-primary-blt.html
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          [SKIP][836] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][837] ([i915#1072] / [i915#9732]) +7 other tests skip
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          [SKIP][838] ([i915#17432] / [i915#5289]) -> [SKIP][839] ([i915#14544] / [i915#17432] / [i915#5289])
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-glk:          [DMESG-FAIL][840] ([i915#13179]) -> [ABORT][841] ([i915#13179])
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          [SKIP][842] ([i915#3555]) -> [SKIP][843] ([i915#14544] / [i915#3555]) +2 other tests skip
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-3/igt@kms_setmode@basic-clone-single-crtc.html
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-glk:          [SKIP][844] ([i915#17672]) -> [SKIP][845] ([i915#17705])
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-glk6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][846] ([i915#14544] / [i915#2436]) -> [SKIP][847] ([i915#2436])
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][848] ([i915#14544] / [i915#17448] / [i915#3291] / [i915#3708]) -> [SKIP][849] ([i915#17448] / [i915#3291] / [i915#3708])
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19564/shard-rkl-6/igt@prime_vgem@basic-write.html
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@prime_vgem@basic-write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15726
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16175]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16175
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#17027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17027
  [i915#17032]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17032
  [i915#17038]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17038
  [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17103
  [i915#17104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17104
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17147]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17147
  [i915#17157]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17157
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17160]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17160
  [i915#17170]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17170
  [i915#17171]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17171
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
  [i915#17209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17209
  [i915#17226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17226
  [i915#17245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17245
  [i915#17276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17276
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17288]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288
  [i915#17297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17297
  [i915#17327]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327
  [i915#17342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17342
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
  [i915#17447]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17447
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17456]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17461]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17461
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17468]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17468
  [i915#17473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473
  [i915#17477]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477
  [i915#17478]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
  [i915#17479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
  [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
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
  [i915#17506]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17506
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17509]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17511]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511
  [i915#17514]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17514
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17519
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17523]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17543]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543
  [i915#17545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17545
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17548
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
  [i915#17552]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17552
  [i915#17554]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554
  [i915#17555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555
  [i915#17556]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17556
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561
  [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
  [i915#17568]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568
  [i915#17572]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17572
  [i915#17575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17575
  [i915#17580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580
  [i915#17581]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17581
  [i915#17583]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583
  [i915#17584]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17584
  [i915#17585]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17585
  [i915#17586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586
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
  [i915#17599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17599
  [i915#17601]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17601
  [i915#17602]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17602
  [i915#17603]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17603
  [i915#17605]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17605
  [i915#17606]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17606
  [i915#17608]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17608
  [i915#17609]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17609
  [i915#17610]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610
  [i915#17615]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17615
  [i915#17616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17616
  [i915#17622]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17622
  [i915#17628]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17628
  [i915#17632]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17632
  [i915#17635]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17635
  [i915#17637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17637
  [i915#17642]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17642
  [i915#17643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17643
  [i915#17645]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17645
  [i915#17646]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17646
  [i915#17647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17647
  [i915#17651]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17651
  [i915#17655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17655
  [i915#17659]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17659
  [i915#17661]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17661
  [i915#17662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17662
  [i915#17670]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17670
  [i915#17672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17672
  [i915#17673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17673
  [i915#17674]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17674
  [i915#17675]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17675
  [i915#17678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17678
  [i915#17686]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17686
  [i915#17687]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17687
  [i915#17688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17697
  [i915#17698]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17698
  [i915#17705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17705
  [i915#17706]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17706
  [i915#17710]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17710
  [i915#17752]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752
  [i915#17832]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832
  [i915#17833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17833
  [i915#17843]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843
  [i915#17844]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844
  [i915#17879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17879
  [i915#17880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17880
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
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
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
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
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9198 -> IGTPW_16181
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_19564: 84508686117ca3be5756049acdf15e3e47fd2683 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16181: 267c5871fc69854bd8a1808993f5e6c18c3ef1b9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9198: 9198
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/index.html

--===============8012197486954335690==
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
tate-skipped-capture (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/178889/">https://patchwork.freedesktop.org/series/178889/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16181/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16181/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19564_full -&gt; IGTPW_16181_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16181_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_16181_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/index=
.html</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): shard-glk11 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1618=
1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@fbdev@read.html">FAIL</a></li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@fbdev@read.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@i915_hangman@engine-error-state-skipped-capture} (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@i915_hangman@engine-error-state-s=
kipped-capture.html">SKIP</a></li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@i915_hangman@engine-error-state-=
skipped-capture.html">SKIP</a></li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-3/igt@i915_hangman@engine-error-state-=
skipped-capture.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19564_full and IGTPW_16181=
_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@i915_hangman@engine-error-state-skipped-capture:<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.01, 6.59] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16181_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_allocator@execbuf-with-allocator:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@api_intel_allocator@execbuf-with-a=
llocator.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17647">i915#17647</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@api_intel_bb@crc32.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">=
i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@delta-check:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@api_intel_bb@delta-check.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7645">i915#17645</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_basic@multigpu-create-close.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17675">i915#17675</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk2/igt@gem_basic@multigpu-create-close.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17697">i915#17697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@gem_busy@semaphore.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">=
i915#3936</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@gem_busy@semaphore.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936"=
>i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk9/igt@gem_ccs@block-copy-compressed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17499">i915#17499</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_ccs@block-copy-compressed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17499">i915#17499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@gem_ccs@block-multicopy-inplace.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17499">i915#17499</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@gem_ccs@block-multicopy-inplace.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_close_race@multigpu-basic-proc=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17568">i915#17568</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@gem_close_race@multigpu-basic-pr=
ocess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@gem_close_race@multigpu-basic-pro=
cess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@gem_close_race@multigpu-basic-pr=
ocess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@gem_compute@compute-square.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17552">i915#17552</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_compute@compute-square.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17552">i915#17552</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_ctx_engines@independent.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17670">i915#17670</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_161=
81/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1335=
6">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16466">i915#16466</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-range:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_ctx_param@set-priority-range.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17646">i915#17646</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-ho=
stile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-sto=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8555">i915#8555</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-st=
op.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_ctx_persistence@hostile.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1099">i915#1099</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-in-order:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_ctx_shared@q-in-order.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17342">i915#17342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/28=
0">i915#280</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@gem_ctx_sseu@mmap-args.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/28=
0">i915#280</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_ctx_sseu@mmap-args.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
96">i915#17496</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
80">i915#280</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@gem_ctx_sseu@mmap-args.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
96">i915#17496</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl=
-3/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327">i915#=
17327</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@gem_eio@in-flight-suspend.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17844">i915#17844</a>) +13 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-6/igt@gem_eio@suspend.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@g=
em_eio@suspend.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17038">i915#17038</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@gem_exec_balancer@bonded-false-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_exec_balancer@parallel.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17587">i915#17587</a>) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-4/igt@gem_exec_balancer@parallel.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk8/igt@gem_exec_balancer@parallel-out-fen=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17547">i915#17547</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fe=
nce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-tglu-4/igt@gem_exec_big@single.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-10/=
igt@gem_exec_big@single.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_exec_capture@capture@vecs0-lm=
em0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16904">i915#16904</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_exec_capture@pi.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610"=
>i915#17610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_exec_fence@syncobj-stationary-=
timeline-chain-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17599">i915#17599</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@gem_exec_flush@basic-batch-kerne=
l-default-wb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_exec_flush@basic-uc-rw-defaul=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_exec_flush@basic-uc-set-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@invalid-bsd2-flag-on-vebox:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_exec_params@invalid-bsd2-flag-=
on-vebox.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17659">i915#17659</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@larger-than-life-batch:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@gem_exec_params@larger-than-life-b=
atch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16871">i915#16871</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gem_exec_params@larger-than-life-b=
atch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17662">i915#17662</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_exec_params@rsvd2-dirt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17453">i915#17453</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5107">i915#5107</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@gem_exec_params@rsvd2-dirt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17453">i915#17453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@gem_exec_params@secure-non-maste=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk9/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17523">i915#17523</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_exec_params@secure-non-root.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17416">i915#17416</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17523">i915#17523</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-noreloc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@gem_exec_reloc@basic-gtt-cpu-acti=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@gem_exec_reloc@basic-range-activ=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_exec_reloc@basic-wc-gtt-activ=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@gem_exec_reloc@basic-write-read-=
noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_exec_schedule@preempt-user.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17590">i915#17590</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@gem_exec_schedule@reorder-wide.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4812">i915#4812</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@gem_exec_schedule@reorder-wide.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@gem_exec_schedule@reorder-wide.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-2/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/sha=
rd-mtlp-5/igt@gem_exec_suspend@basic-s3@smem.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17160">i915#17160</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_exec_suspend@basic-s4-devices=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17844">i915#17844</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7975">i915#7975</a>) +1 other test abort</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@gem_exec_suspend@basic-s4-device=
s.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17844">i915#17844</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7975">i915#7975</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gem_exec_whisper@basic-contexts-pr=
iority-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17628">i915#17628</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_exec_whisper@basic-queues.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17655">i915#17655</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gem_exercise_blt@fast-copy-emit.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17622">i915#17622</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_gpgpu_fill@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gem_gpgpu_fill@basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17608=
">i915#17608</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_huc_copy@huc-copy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1746=
8">i915#17468</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk9/igt@gem_huc_copy@huc-copy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1745=
6">i915#17456</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@gem_lmem_evict@dontneed-evict-race=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17605">i915#17605</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_lmem_evict@dontneed-evict-race=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17605">i915#17605</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@gem_lmem_swapping@heavy-random.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@gem_lmem_swapping@heavy-verify-mul=
ti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17503">i915#17503</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_lmem_swapping@heavy-verify-mul=
ti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17503">i915#17503</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_lmem_swapping@parallel-random=
-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@gem_lmem_swapping@verify-random-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_media_fill@media-fill.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17661">i915#17661</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-3/igt@gem_media_fill@media-fill.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8289">i915#8289</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk6/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543">i915#=
17543</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-cpu-read-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk2/igt@gem_mmap_gtt@basic-write-cpu-read-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17572">i915#17572</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-user:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@gem_mmap_gtt@hang-user.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@gem_mmap_wc@write-gtt-read-wc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4083">i915#4083</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@gem_mmap_wc@write-gtt-read-wc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@gem_partial_pwrite_pread@reads-d=
isplay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_ppgtt@flink-and-close-vma-leak=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17635">i915#17635</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@shrink-vs-evict-pinned:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_ppgtt@shrink-vs-evict-pinned.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17615">i915#17615</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@gem_pread@snoop.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i91=
5#3282</a>) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@gem_pread@snoop.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i9=
15#3282</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@gem_pxp@display-protected-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4270">i915#4270</a>) +6 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_pxp@display-protected-crc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17521">i915#17521</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@gem_pxp@display-protected-crc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-context.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@gem_pxp@verify-pxp-stale-ctx-execu=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17521">i915#17521</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_readwrite@read-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@gem_render_copy@linear-to-vebox-y=
f-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-yf-=
tiled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17492">i915#17492</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gem_render_copy@y-tiled-to-vebox-x=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17492">i915#17492</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-=
y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +8 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@gem_render_copy@y-tiled-to-vebox=
-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-linear:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@gem_render_copy@yf-tiled-ccs-to-li=
near.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17591">i915#17591</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk2/igt@gem_softpin@evict-snoop.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
551">i915#17551</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@gem_softpin@evict-snoop-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4885">i915#4885</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@gem_softpin@evict-snoop-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@gem_tiled_swapping@non-threaded.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4077">i915#4077</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@gem_unfence_active_buffers.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4879">i915#4879</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@gem_unfence_active_buffers.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gem_userptr_blits@dmabuf-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk6/igt@gem_userptr_blits@readonly-pwrite-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17507">i915#17507</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@gem_userptr_blits@readonly-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@gem_userptr_blits@relocations.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@gem_userptr_blits@relocations.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gem_userptr_blits@unsync-overlap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17507">i915#17507</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@create-ext:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gem_vm_create@create-ext.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7596">i915#17596</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk9/igt@gem_workarounds@suspend-resume.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard=
-glk3/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1458=
6">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-5/igt@gem_workarounds@suspend-resume-fd.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/s=
hard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17880">i915#17880</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk5/igt@gen3_mixed_blits.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688">i9=
15#17688</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gen3_mixed_blits.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688">i9=
15#17688</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@gen3_render_linear_blits.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17555">i915#17555</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk2/igt@gen3_render_tiledx_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7511">i915#17511</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@gen3_render_tiledx_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7511">i915#17511</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@gen7_exec_parse@basic-allocation=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk3/igt@gen7_exec_parse@basic-offset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17505">i915#17505</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@gen7_exec_parse@basic-rejected.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17455">i915#17455</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@gen7_exec_parse@basic-rejected.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17455">i915#17455</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@gen7_exec_parse@basic-rejected.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17455">i915#17455</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gen7_exec_parse@basic-rejected.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17505">i915#17505</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@gen7_exec_parse@bitmasks.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@gen7_exec_parse@load-register-re=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17455">i915#17455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@gen9_exec_parse@allowed-all.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@gen9_exec_parse@basic-rejected.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-pag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2856">i915#2856</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@gen9_exec_parse@shadow-peek.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@gen9_exec_parse@valid-registers.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17597">i915#17597</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@gpu_buddy@gpu_buddy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678=
">i915#15678</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@gpu_buddy@gpu_buddy.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17514"=
>i915#17514</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-active:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@i915_drm_fdinfo@memory-info-active=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17603">i915#17603</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@i915_drm_fdinfo@virtual-busy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14118">i915#14118</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@i915_drm_fdinfo@virtual-busy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@i915_fb_tiling@basic-x-tiling.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13786">i915#13786</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@i915_fb_tiling@basic-x-tiling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@i915_hangman@engine-engine-error@=
bcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17580">i915#17580</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@i915_pm_freq_api@freq-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17526">i915#17526</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@i915_pm_freq_api@freq-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17526">i915#17526</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6590">i915#6590</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@i915_pm_freq_mult@media-freq@gt0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@i915_pm_rc6_residency@rc6-accurac=
y.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12964">i915#12964</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@i915_pm_rc6_residency@rc6-idle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@i915_pm_rpm@gem-execbuf-stress-pc=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17706">i915#17706</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@i915_pm_rps@basic-api.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@i915_pm_rps@min-max-config-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@i915_pm_rps@thresholds-idle-park.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11681">i915#11681</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@i915_pm_rps@thresholds-idle-park=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@i915_pm_rps@thresholds-park.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@i915_query@hwconfig_table.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6245">i915#6245</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk3/igt@i915_query@hwconfig_table.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17584">i915#17584</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@i915_query@hwconfig_table.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@i915_query@query-topology-unsuppo=
rted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@i915_query@test-query-geometry-sub=
slices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17673">i915#17673</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@i915_suspend@basic-s3-without-i=
915.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk8/igt@i915_suspend@debugfs-reader.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@i915_suspend@fence-restore-tiled2u=
ntiled.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15840">i915#15840</a>) +7 other tests abort</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@i915_suspend@forcewake.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-8/igt@i915_suspend@sysfs-reader.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mt=
lp-8/igt@i915_suspend@sysfs-reader.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17170">i915#17170</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17171">i915#171=
71</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk2/igt@intel_hwmon@hwmon-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
680">i915#11680</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@intel_hwmon@hwmon-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
674">i915#17674</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_addfb_basic@addfb25-framebuf=
fer-vs-set-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-s=
mall-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_addfb_basic@clobberred-modifi=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4212">i915#4212</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-1/igt@kms_addfb_basic@clobberred-modif=
ier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_atomic@plane-primary-overlay-=
mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17485">i915#17485</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 ot=
her test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_atomic_transition@plane-all-m=
odeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_atomic_transition@plane-all-m=
odeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-tran=
sition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-1/igt@kms_atomic_t=
ransition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5956">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_big_fb@4-tiled-8bpp-rotate-0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17478">i915#17478</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb-size-ove=
rflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +18 other tests s=
kip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) =
+3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other =
tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_big_fb@linear-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17500">i915#17500</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_big_fb@linear-32bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17500">i915#17500</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_big_fb@linear-max-hw-stride-32=
bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-8/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-7/igt@kms_big_fb@x-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_big_fb@x-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-3/igt@kms_big_fb@y-tiled-32bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17432">i915#17432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_big_fb@y-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17500">i915#17500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>=
) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk9/igt@kms_big_fb@yf-tiled-64bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17478">i915#17478</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_big_fb@yf-tiled-addfb.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17556">i915#17556</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17432">i915#17432</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17432">i915#17432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4538">i915#4538</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate=
-180.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16181/shard-glk5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotat=
e-180.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_ccs@bad-pixel-format-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +132 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@kms_ccs@bad-pixel-format-4-tiled=
-mtl-mc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +117 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_ccs@bad-rotation-90-yf-tiled-=
ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17491">i915#17491</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_ccs@ccs-on-another-bo-yf-tiled=
-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17594">i915#17594</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled=
-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled=
-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:=
</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_ccs@crc-primary-rotation-180-4=
-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#174=
91</a>) +47 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#104=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-=
1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_ccs@crc-primary-rotation-180-y=
-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +131 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk9/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17525">i915#17525</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +79 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-c=
cs@pipe-d-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs@pipe-d-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) +1 other test fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tile=
d-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test =
incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +67 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-y=
-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +46=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y=
f-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_cdclk@mode-rejected-max-dotclo=
ck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17550">i915#17550</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_cdclk@mode-rejected-max-dotcl=
ock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17099">i915#17099</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-c-hd=
mi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_chamelium_audio@dp-audio-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_chamelium_audio@dp-audio-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_chamelium_audio@hdmi-audio-edi=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17483">i915#17483</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_chamelium_color@ctm-0-50.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_chamelium_color@ctm-limited-=
range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17427">i915#17427</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_chamelium_color@degamma.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17427">i915#17427</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_chamelium_color@gamma.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17427">i915#17427</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +4 othe=
r tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +6 other tests s=
kip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)=
 +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-6/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lu=
t1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 othe=
r tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 othe=
r test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 oth=
er test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-2/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_chamelium_edid@dp-edid-change=
-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_chamelium_frames@hdmi-frame-d=
ump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17483">i915#17483</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_chamelium_hpd@dp-hpd-after-run=
time-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17483">i915#17483</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-enable-=
disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_chamelium_hpd@dp-hpd-storm.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enabl=
e-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-for-eac=
h-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_color_pipeline@plane-fixed-mat=
rix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_color_pipeline@plane-lut1d.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17510">i915#17510</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_color_pipeline@plane-lut1d-ct=
m3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_content_protection@atomic-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17508">i915#17508</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_content_protection@dp-mst-type=
-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17502">i915#17502</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_content_protection@dp-mst-typ=
e-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17502">i915#17502</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@kms_content_protection@dp-mst-t=
ype-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_content_protection@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17508">i915#17508</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@kms_content_protection@legacy-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_content_protection@lic-type-1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_content_protection@mei-interf=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_content_protection@mei-interf=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-8/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15865">i915#15865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_cursor_crc@cursor-offscreen-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17533">i915#17533</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_cursor_crc@cursor-offscreen-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1618=
1/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#=
13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x=
170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17504">i915#17504</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movem=
ent-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17533">i915#17533</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17504">i915#17504</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_cursor_crc@cursor-suspend@pip=
e-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>) +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flip=
b-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +15 other tes=
ts skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_cursor_legacy@cursora-vs-fli=
pb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +1 other tes=
t skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-4/igt@kms_cursor_legacy@cursora-vs-fli=
pb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flip=
a-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic-transitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_display_modes@extended-mode-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17487">i915#17487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17486">i915#17486</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17486">i915#17486</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_dp_link_training@non-uhbr-mst-=
direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17519">i915#17519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_dp_link_training@non-uhbr-mst-=
tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17616">i915#17616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-2/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17288">i915#17288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_dp_link_training@non-uhbr-sst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17506">i915#17506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_dp_link_training@uhbr-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk9/igt@kms_dp_link_training@uhbr-mst-dire=
ct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_dp_link_training@uhbr-mst-di=
rect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_dp_link_training@uhbr-mst-di=
rect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-1/igt@kms_dp_link_training@uhbr-sst-di=
rect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17297">i915#17297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_dp_link_training@uhbr-sst-dir=
ect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_dp_link_training@uhbr-sst-tbt=
alt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_dp_link_training@uhbr-sst-tbta=
lt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_dp_link_training@uhbr-sst-tbt=
alt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17477">i915#17477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_dp_linktrain_fallback@uhbr-to-=
hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17548">i915#17548</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to=
-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_dp_linktrain_fallback@uhbr-to-=
hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17548">i915#17548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_draw_crc@draw-method-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8812">i915#8812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-gtt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_dsc@dsc-basic-ultrajoiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16361">i915#16361</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_dsc@dsc-basic-ultrajoiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16361">i915#16361</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_dsc@dsc-basic-ultrajoiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_dsc@dsc-fractional-bpp-bigjoin=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17458">i915#17458</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp-bigjo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_dsc@dsc-with-bpc-formats-ultra=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17458">i915#17458</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-ultrajoiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_dsc@dsc-with-output-formats-b=
igjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17458">i915#17458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">=
i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-1/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mt=
lp-6/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_feature_discovery@chamelium.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17581">i915#17581</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_feature_discovery@chamelium.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16084">i915#16084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-2/igt@kms_feature_discovery@display-2x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_feature_discovery@dsc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_feature_discovery@psr2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17585">i915#17585</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_feature_discovery@psr2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17585">i915#17585</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_feature_discovery@psr2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_feature_discovery@psr2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_fence_pin_leak.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">=
i915#4881</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_fence_pin_leak.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881"=
>i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@kms_flip@2x-flip-vs-absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-=
modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_flip@2x-flip-vs-panning-vs-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interr=
uptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183=
">i915#17183</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interr=
uptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16181/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1302=
7">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-1/igt@kms_flip@flip-vs-fences.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_flip@flip-vs-fences-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_flip@flip-vs-fences-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_flip@flip-vs-suspend.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17844">i915#17844</a>) +14 other tests abort</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-tglu-7/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tgl=
u-10/igt@kms_flip@flip-vs-suspend.html">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a>) +2 other =
tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +1 other test sk=
ip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#156=
43</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17593">i915#17593</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +9 other te=
sts skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190=
</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-=
4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i=
915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_frontbuffer_tracking@fbc-shrfb=
-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17606">i915#17606</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_frontbuffer_tracking@fbc-tilin=
g-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17559">i915#17559</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_frontbuffer_tracking@fbc-tilin=
g-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17559">i915#17559</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-tili=
ng-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10055">i915#10055</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_frontbuffer_tracking@fbc-tilin=
g-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17609">i915#17609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pr=
i-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_frontbuffer_tracking@fbch=
dr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +11 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +17 other tests =
skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-=
1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +18 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-=
2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +58 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-=
farfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +28 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-r=
gb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15989">i915#15989</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15989">i915#15989</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17588">i915#17588</a>) +116 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#174=
28</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16181/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1727=
6">i915#17276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-=
gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +36 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +26 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +32 ot=
her tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +10 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +54 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-pr=
imscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +65 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-p=
rimscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +47 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_frontbuffer_tracking@hdr-2p-=
scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_frontbuffer_tracking@hdr-farfr=
omfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17517">i915#17517</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap=
-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16181/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mma=
p-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15989">i915#15989</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</=
a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>=
) +16 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_frontbuffer_tracking@psr-1p-pr=
imscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +54 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +42 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-pr=
imscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +146 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</=
a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +34=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +85 other te=
sts skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/182=
5">i915#1825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb1=
01010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +24 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-sus=
pend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17276">i915#17276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_frontbuffer_tracking@psrhdr-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +50 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2=
p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +16 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_hdmi_audio_bw@audio-bw-hblank8=
0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17104">i915#17104</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_hdmi_audio_bw@audio-bw-hblan=
k80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17103">i915#17103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-8/igt@kms_hdmi_audio_bw@suspend-disk-a=
udio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17101">i915#17101</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188">i915#17188</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_hdr@bpc-switch.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">=
i915#17498</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_hdr@bpc-switch.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518"=
>i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_hdr@bpc-switch.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_hdr@bpc-switch.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">=
i915#17498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_hdr@static-toggle.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/166=
44">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_joiner@basic-force-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17678">i915#17678</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15459">i915#15459</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15459">i915#15459</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_joiner@basic-force-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17678">i915#17678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_joiner@basic-max-non-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17575">i915#17575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15458">i915#15458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_mst@mst-suspend-read-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_pipe_b_c_ivb@disable-pipe-b-en=
able-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17540">i915#17540</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_pipe_b_c_ivb@disable-pipe-b-en=
able-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_pipe_crc_basic@compare-crc-san=
itycheck-nv12@pipe-a-vga-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17461">i915#17461</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_pipe_crc_basic@compare-crc-san=
itycheck-nv12@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17686">i915#17686</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_pipe_stress@stress-xrgb8888-4t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17601">i915#17601</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-xt=
iled.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14712">i915#14712</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_plane@pixel-format-4-tiled-dg2=
-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17479">i915#17479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg=
2-mc-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_plane@pixel-format-y-tiled-cc=
s-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_plane@pixel-format-y-tiled-gen=
12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:=
</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-2/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_plane@pixel-format-yf-tiled-m=
odifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_plane@pixel-format-yf-tiled-=
modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_plane_alpha_blend@alpha-7efc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17595">i915#17595</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@=
pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8821">i915#8821</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a>) +6 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17509">i915#17509</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_plane_multiple@2x-tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17586">i915#17586</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_plane_scaling@plane-downscale-=
max-crc-4-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_plane_scaling@plane-downscal=
e-max-crc-4-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17832">i915#17832</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-=
a-hdmi-a-1-xv36:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_plane_scaling@plane-downscale=
-max-crc-rotation-270-y-tiled@pipe-a-hdmi-a-1-xv36.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#178=
43</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-3/igt@kms_plane_scaling@plane-downscale=
-max-crc-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17832">i915#17832</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-b-hdmi-a-1-yu=
yv:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_plane_scaling@plane-downscale-=
max-crc-y-tiled@pipe-b-hdmi-a-1-yuyv.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17833">i915#17833</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_plane_scaling@plane-downscale=
-max-crc-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_plane_scaling@plane-downscale-=
max-crc-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17528">i915#17528</a>) +8 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_plane_scaling@plane-downscal=
e-max-crc-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-pixel-formats@pipe-a.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-a-=
hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-9/igt@kms_plane_scaling@plane-upscale-=
max-crc-rotation-270-y-tiled@pipe-a-hdmi-a-1-xrgb16161616f.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i=
915#17843</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-=
hdmi-a-1-rgb565:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_plane_scaling@plane-upscale-ma=
x-crc-rotation-270-y-tiled@pipe-c-hdmi-a-1-rgb565.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#178=
43</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_plane_scaling@plane-upscale-=
max-crc-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9812">i915#9812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_pm_backlight@fade-with-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17462">i915#17462</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_pm_backlight@fade-with-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17462">i915#17462</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_pm_dc@dc5-dpms-negative.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17602">i915#17602</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_pm_dc@dc5-pageflip-negative.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17495">i915#17495</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_pm_dc@dc5-pageflip-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9685">i915#9685</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_pm_dc@dc5-pageflip-negative.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">=
i915#15948</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_pm_dc@dc5-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_pm_dc@dc5-retention-flops.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">i=
915#17564</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_pm_rpm@cursor.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">=
i915#4077</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_pm_rpm@drm-resources-equal.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17473">i915#17473</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shar=
d-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk9/igt@kms_pm_rpm@pc8-residency.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7710">i915#17710</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_psr2_sf@fbc-pr-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-18/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other te=
st skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_psr2_sf@psr2-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_psr2_su@page_flip-nv12.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-7/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_psr@fbc-psr-sprite-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9688">i915#9688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@kms_psr@fbc-psr2-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17480">i915#17480</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_psr@fbc-psr2-no-drrs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7480">i915#17480</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_psr@pr-cursor-mmap-cpu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17480">i915#17480</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@kms_psr@pr-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i9=
15#9732</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk2/igt@kms_psr@psr-cursor-plane-move.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17480">i915#17480</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_psr@psr-sprite-plane-move.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_psr@psr2-primary-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend@edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-3/igt@kms_psr@psr2-suspend@edp-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-m=
tlp-8/igt@kms_psr@psr2-suspend@edp-1.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17226">i915#17226</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15949">i915#15949</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_psr_stress_test@invalidate-pri=
mary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_psr_stress_test@invalidate-pri=
mary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_psr_stress_test@invalidate-pr=
imary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-8/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-19/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_rotation_crc@primary-rotation-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17488">i915#17488</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@kms_rotation_crc@primary-x-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_rotation_crc@primary-y-tiled-r=
eflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17488">i915#17488</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-5/igt@kms_rotation_crc@sprite-rotation-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk6/igt@kms_scaling_modes@scaling-mode-ful=
l-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17501">i915#17501</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_scaling_modes@scaling-mode-fu=
ll-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_scaling_modes@scaling-mode-ful=
l-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_setmode@basic-clone-single-crt=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17463">i915#17463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-15/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@kms_tv_load_detect@load-detect.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6181/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) =
+3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-b-vga-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17752">i915#17752</a>) +3 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@kms_vblank@ts-continuation-suspend=
@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15840">i915#15840</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17752">i915#17752</a>) +1 ot=
her test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-mtlp-4/igt@kms_vrr@flip-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8808">i915#8808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_vrr@lobf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561">i915#1=
7561</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-7/igt@kms_vrr@lobf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#=
11920</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-3/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@kms_vrr@max-min.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i91=
5#17520</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_vrr@max-min.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i91=
5#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_vrr@negative-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9906">i915#9906</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb1/igt@kms_vrr@seamless-rr-switch-vrr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17520">i915#17520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@perf@gen12-oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-4/igt@perf@non-zero-reason@0-rcs0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9100">i915#9100</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@perf@stress-open-close.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/175=
92">i915#17592</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@perf_pmu@busy-accuracy-50.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17637">i915#17637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@perf_pmu@busy-accuracy-50@bcs0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17651">i915#17651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-1/igt@perf_pmu@busy-double-start@vcs1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/sh=
ard-mtlp-4/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)=
 +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@perf_pmu@busy-double-start@vecs1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk10/igt@perf_pmu@event-wait@rcs0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17698">i915#17698</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516=
">i915#8516</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-2/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/=
igt@perf_pmu@rc6-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17245">i915#17245</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk4/igt@perf_pmu@rc6@other-idle-gt0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17583">i915#17583</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@perf_pmu@rc6@other-idle-gt0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17583">i915#17583</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-tglu-5/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@perf_pmu@rc6@runtime-pm-long-gt0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17687">i915#17687</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk2/igt@prime_udl@share-import-addfb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16420">i915#16420</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@prime_udl@share-import-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16420">i915#16420</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-16/igt@prime_udl@share-import-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@prime_vgem@fence-flip-hang.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17467">i915#17467</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg1-14/igt@prime_vgem@fence-flip-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb4/igt@prime_vgem@fence-flip-hang.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17467">i915#17467</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sw_sync@sync_busy_fork:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@sw_sync@sync_busy_fork.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@sysfs_heartbeat_interval@precise.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17642">i915#17642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb6/igt@sysfs_heartbeat_interval@precise@v=
cs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17643">i915#17643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-snb5/igt@sysfs_timeslice_duration@timeout.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17632">i915#17632</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-glk1/igt@tools_test@sysfs_l3_parity.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17545">i915#17545</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-dg2-8/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4818">i915#4818</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17447">i915#17447</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-1/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17160">i91=
5#17160</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16181/shard-mtlp-5/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/178=
79">i915#17879</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16181/shard-rkl-6/igt@gem_exec_suspend@basic-s4-devices.html">PASS=
</a> +1 other test pass</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-1/igt@gem_exec_suspend@basic-s4-devices.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
879">i915#17879</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16181/shard-mtlp-6/igt@gem_exec_suspend@basic-s4-devices.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-tglu-7/igt@gem_workarounds@suspend-resume-fd.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5840">i915#15840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16181/shard-tglu-4/igt@gem_workarounds@suspend-resume-fd.html">P=
ASS</a></li>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk4/igt@gem_workarounds@suspend-resume-fd.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14586">i915#14586</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk6/igt@gem_workarounds@suspend-=
resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-tglu-3/igt@i915_selftest@live@late_gt_pm.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17027=
">i915#17027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16181/shard-tglu-9/igt@i915_selftest@live@late_gt_pm.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-1/igt@kms_3d@basic.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15726">i915#15726</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard=
-mtlp-5/igt@kms_3d@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-3/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-res=
et.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13363">i915#13363</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_busy@extended-modese=
t-hang-newfb-with-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-res=
et@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17147">i915#17147</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_busy@extended=
-modeset-hang-newfb-with-reset@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-128x42.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16181/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42.html=
">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-5/igt@kms_cursor_crc@cursor-suspend.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17157"=
>i915#17157</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16181/shard-mtlp-3/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-2/igt@kms_flip_tiling@flip-change-tiling.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16175">i915#16175</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_flip_tiling@flip-change-tiling.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-mc-ccs-to-linear:<=
/p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-ed=
p-1-4-mc-ccs-to-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15733">i915#15733</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/igt@kms_flip_=
tiling@flip-change-tiling@pipe-a-edp-1-4-mc-ccs-to-linear.html">PASS</a> +6=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-cc-to-4-mc-=
ccs:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-ed=
p-1-4-rc-ccs-cc-to-4-mc-ccs.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16175">i915#16175</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-2/ig=
t@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-cc-to-4-mc-ccs.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/10056">i915#10056</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-suspen=
d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mm=
ap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16181/shard-glk8/igt@kms_frontbuffer_tracking@fb=
chdr-rgb565-draw-mmap-gtt.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-p=
write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_frontbuffer_tracking@hd=
r-rgb101010-draw-pwrite.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk6/igt@kms_plane_scaling@intel-max-src-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7528">i915#17528</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16181/shard-glk6/igt@kms_plane_scaling@intel-max-src-size.html">=
PASS</a></li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17832">i915#17832</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6953">i915#6953</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-4/igt@kms_plane_scaling@intel-m=
ax-src-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-6/igt@kms_pm_backlight@fade-with-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17032">i915#17032</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16181/shard-mtlp-6/igt@kms_pm_backlight@fade-with-suspend.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181=
/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16181/shard-dg1-17/igt@kms_pm_rpm@modeset-non-lpsp-stres=
s-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuf=
fer_create.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13179">i915#13179</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_selftest@drm_frame=
buffer@drm_test_framebuffer_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17209">i915#17209</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16181/shard-mtlp-6/igt@kms_vblank@ts-continuation-dpms-susp=
end.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdm=
i-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12276">i915#12276</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_vblank@ts-continu=
ation-suspend@pipe-a-hdmi-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate@0-rcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-8/igt@perf@gen12-oa-tlb-invalidate@0-rcs0.html">FAI=
L</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181=
/shard-rkl-4/igt@perf@gen12-oa-tlb-invalidate@0-rcs0.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-hang:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-tglu-9/igt@perf_pmu@busy-hang.html">FAIL</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-tglu-9/ig=
t@perf_pmu@busy-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16181/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i=
915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16181/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-=
noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16181/shard-rkl-3/igt@gem_lmem_swapping@basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i9=
15#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-7/igt@gem_partial_pwrite_pread@reads.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">=
i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16181/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-u=
ncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@gem_partial=
_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-2/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430">i915#1=
7430</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6181/shard-rkl-6/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430"=
>i915#17430</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-2/igt@gem_userptr_blits@coherency-unsync.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
97">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16181/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-5/igt@gem_userptr_blits@relocations.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i=
915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16181/shard-rkl-6/igt@gem_userptr_blits@relocations.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@gem_userptr_blits@unsync-u=
nmap-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@gen3_render_linear_blits.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17455">i915#17455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16181/shard-rkl-5/igt@gen3_render_linear_blits.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1745=
5">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-7/igt@gen7_exec_parse@batch-without-end.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
55">i915#17455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16181/shard-rkl-6/igt@gen7_exec_parse@batch-without-end.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15479">i915#15479</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@i915_module_load@fa=
ult-injection@__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6412">i915#6412</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16181/shard-rkl-5/igt@i915_module_load@resize-bar.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-3/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i=
915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16181/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@i915_=
pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#161=
66</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-3/igt@i915_query@test-query-geometry-subslices.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5723">i915#5723</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16181/shard-rkl-6/igt@i915_query@test-query-geometry-subslice=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12454">i915#12454</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12712">i915#12712</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_addfb_basic@in=
valid-smem-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_big_fb@4-ti=
led-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5=
286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
181/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">=
i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@4-til=
ed-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5=
286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-5/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
31">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@linear-max-hw-=
stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_big_fb@x=
-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16181/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflo=
w.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17432">i915#17432</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_big_fb@yf-t=
iled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotat=
e-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@km=
s_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i=
915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@=
pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@km=
s_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i=
915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-cc=
s@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@k=
ms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-cc=
s@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181=
/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi=
-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-c=
cs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_ccs@missing-=
ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/609=
5">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#37=
42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_161=
81/shard-rkl-6/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i9=
15#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_chamelium_color@ctm-green-to-red.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17427">i915#17427</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_chamelium_color@ctm-g=
reen-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i9=
15#17427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16181/shard-rkl-6/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/111=
51">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-r=
ead.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_chamelium=
_frames@hdmi-crc-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-susp=
end-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_cha=
melium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_con=
tent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_content_protection@dp-mst-=
lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_content_protection@=
dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_cursor_crc@cursor-onscr=
een-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-8/igt@kms_cursor_legacy@2=
x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +25 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_cursor_legacy@short-b=
usy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9723">i915#9723</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16181/shard-rkl-5/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#12=
57</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16867">i915#16867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16181/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-4/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16181/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_flip@2x-blocking-wf_vblank.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-4/igt@kms_flip@2x-plain-flip-interruptible.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16181/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk5/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">=
i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113=
">i915#6113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16181/shard-glk2/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i9=
15#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk5/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i9=
15#6113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16181/shard-glk2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/127=
45">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rk=
l-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscali=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bp=
p-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_flip_scale=
d_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-rte:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17428">i915#17428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17428">i915#17428</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-=
multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_fro=
ntbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</=
a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9766">i915#9766</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_frontbuffer_tracking@p=
ipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@=
kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-s=
pr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_frontbuffer_tra=
cking@psrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915=
#15102</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i9=
15#1187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16490">i915#16490</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-mtlp-5/igt@kms_hdr@brightness=
-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">=
i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16181/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15460">i915#15460</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_joiner@invalid-modes=
et-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-chec=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15815">i915#15815</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@kms_multipipe_m=
odeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6301">i915#6301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_panel_fitting@atomic-fastse=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-mod=
ifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@kms_plane@p=
ixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs=
-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-max-crc-4-t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17832">i915#17832</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_plane_scaling@plane-down=
scale-max-crc-4-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-max-crc-yf-ti=
led.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17832">i915#17832</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-7/igt@kms_plane_sca=
ling@plane-upscale-max-crc-yf-tiled.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343=
">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-7/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1691=
4">i915#16914</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16181/shard-rkl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/=
shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#157=
39</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-dg2-8/igt@kms_pm_rpm@system-suspend-idle.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844=
">i915#17844</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16181/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-3/igt@kms_psr2_sf@=
pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continu=
ous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-p=
lane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-8/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-2/igt@kms_psr@psr2-cursor-m=
map-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-6/igt@kms_rotation_crc@=
primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289"=
>i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk6/igt@kms_selftest@drm_framebuffer@drm_test_framebuf=
fer_free.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13179">i915#13179</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-glk5/igt@kms_selftest@drm_fr=
amebuffer@drm_test_framebuffer_free.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-3/igt@kms_setmode@basic-clone-single-crtc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16181/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-glk6/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17672">i915#17672</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16181/shard-glk4/igt@kms_tiled_display@basic-test=
-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17705">i915#17705</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2436">i915#2436</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-5/igt@perf@gen8-unprivilege=
d-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19564/shard-rkl-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16181/shard-rkl-4/igt@prime_vgem@=
basic-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9198 -&gt; IGTPW_16181</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19564: 84508686117ca3be5756049acdf15e3e47fd2683 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_16181: 267c5871fc69854bd8a1808993f5e6c18c3ef1b9 @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9198: 9198<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8012197486954335690==--
