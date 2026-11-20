Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F60A606A529
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 06:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7694112540;
	Fri, 20 Nov 2026 06:10:03 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781C310F075;
 Fri, 20 Nov 2026 06:09:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0500980475893320135=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_starting_with_=5B?=
 =?utf-8?q?i-g-t=2Cv3=2C01/11=5D_tests/amdgpu=3A_Add_SLTH_validation_tests_f?=
 =?utf-8?q?or_trap_handling_and_trap_return=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhang, Jesse(Jie)" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Nov 2026 06:09:01 -0000
Message-ID: <179515494145.57398.6659778528280551618@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
In-Reply-To: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
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

--===============0500980475893320135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,01/11] tests/amdgpu: Add SLTH validation tests for trap handling and trap return.
URL   : https://patchwork.freedesktop.org/series/179011/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9198_full -> IGTPW_16180_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16180_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16180_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16180_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_softpin@noreloc-s3:
    - shard-mtlp:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@gem_softpin@noreloc-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@gem_softpin@noreloc-s3.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled.html

  
Known issues
------------

  Here are the changes found in IGTPW_16180_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-glk11:        NOTRUN -> [SKIP][4] ([i915#17576])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#6230])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@delta-check:
    - shard-snb:          NOTRUN -> [SKIP][6] ([i915#17645])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@api_intel_bb@delta-check.html

  * igt@api_intel_bb@render-ccs:
    - shard-snb:          NOTRUN -> [SKIP][7] ([i915#17685])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@api_intel_bb@render-ccs.html

  * igt@dmabuf@dma-buf-fence-chain:
    - shard-glk:          NOTRUN -> [SKIP][8] ([i915#17712])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@dmabuf@dma-buf-fence-chain.html

  * igt@gem_basic@multigpu-create-close:
    - shard-snb:          NOTRUN -> [SKIP][9] ([i915#17675])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_basic@multigpu-create-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#7697])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@gem_basic@multigpu-create-close.html
    - shard-glk:          NOTRUN -> [SKIP][11] ([i915#17697])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk9/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-glk10:        NOTRUN -> [SKIP][12] ([i915#17499])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-glk11:        NOTRUN -> [SKIP][13] ([i915#17499])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-glk:          NOTRUN -> [SKIP][14] ([i915#17499])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@gem_ccs@ctrl-surf-copy.html
    - shard-snb:          NOTRUN -> [SKIP][15] ([i915#17499]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9323]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-snb:          NOTRUN -> [SKIP][17] ([i915#17568])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#7697]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#7697])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-glk11:        NOTRUN -> [SKIP][20] ([i915#17513])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_engines@independent:
    - shard-snb:          NOTRUN -> [SKIP][21] ([i915#17670])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_ctx_engines@independent.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          ([PASS][22], [PASS][23]) -> [INCOMPLETE][24] ([i915#13356] / [i915#16466])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_param@set-priority-invalid-size:
    - shard-snb:          NOTRUN -> [SKIP][25] ([i915#17646])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_ctx_param@set-priority-invalid-size.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-glk10:        NOTRUN -> [SKIP][26] ([i915#17535])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#8555])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#8555]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hostile.html
    - shard-snb:          NOTRUN -> [SKIP][29] ([i915#17621])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@gem_ctx_persistence@heartbeat-hostile.html
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#8555])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hang@blt:
    - shard-glk:          NOTRUN -> [SKIP][31] ([i915#17527])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@gem_ctx_persistence@legacy-engines-hang@blt.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][32] ([i915#1099]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_shared@q-in-order:
    - shard-snb:          NOTRUN -> [SKIP][33] ([i915#17342]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_ctx_shared@q-in-order.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#280])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_ctx_sseu@invalid-args.html
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#280])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gem_ctx_sseu@invalid-args.html
    - shard-glk:          NOTRUN -> [SKIP][36] ([i915#17496])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][37] ([i915#13356] / [i915#13390])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4812]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@gem_exec_balancer@bonded-false-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4812]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel:
    - shard-snb:          NOTRUN -> [SKIP][40] ([i915#17587]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#4525])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#4525])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-10/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-glk:          NOTRUN -> [SKIP][43] ([i915#17547]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#6334]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_exec_capture@capture-invisible@lmem0.html
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#6334]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][46] ([i915#6334]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#6334]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-glk:          NOTRUN -> [SKIP][48] ([i915#17711])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][49] ([i915#16904]) +4 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@gem_exec_capture@capture@vecs0-lmem0.html
    - shard-dg1:          NOTRUN -> [FAIL][50] ([i915#16904]) +2 other tests fail
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-glk10:        NOTRUN -> [SKIP][51] ([i915#17571])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fence@submit3:
    - shard-snb:          NOTRUN -> [SKIP][52] ([i915#17599]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_exec_fence@submit3.html
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4812]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3539] / [i915#4852]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@gem_exec_flush@basic-wb-prw-default.html
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3539] / [i915#4852]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_params@invalid-bsd1-flag-on-vebox:
    - shard-snb:          NOTRUN -> [SKIP][56] ([i915#17659])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_exec_params@invalid-bsd1-flag-on-vebox.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#17453] / [i915#5107])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#17453])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#17416])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_exec_params@secure-non-master.html
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#17416])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gem_exec_params@secure-non-master.html
    - shard-snb:          NOTRUN -> [SKIP][61] ([i915#17523])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_exec_params@secure-non-master.html
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#17416])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@gem_exec_params@secure-non-master.html
    - shard-glk:          NOTRUN -> [SKIP][63] ([i915#17523])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3281]) +10 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3281]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3281]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#3281]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-user:
    - shard-snb:          NOTRUN -> [SKIP][68] ([i915#17590]) +9 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_exec_schedule@preempt-user.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4537] / [i915#4812])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][70] ([i915#13356]) +1 other test incomplete
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][71] ([i915#17844] / [i915#7975]) +1 other test abort
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-dg1:          NOTRUN -> [ABORT][72] ([i915#17844] / [i915#7975]) +1 other test abort
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-snb:          NOTRUN -> [SKIP][73] ([i915#17628])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-snb:          NOTRUN -> [SKIP][74] ([i915#17655]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_exec_whisper@basic-queues.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4860]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4860]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_gpgpu_fill@basic:
    - shard-snb:          NOTRUN -> [SKIP][77] ([i915#17608])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@gem_gpgpu_fill@basic.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#4613] / [i915#7582])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-snb:          NOTRUN -> [SKIP][79] ([i915#17605])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][80] ([i915#17503] / [i915#4613]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@random:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#4613]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify:
    - shard-glk10:        NOTRUN -> [SKIP][82] ([i915#17503]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#12193]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-snb:          NOTRUN -> [SKIP][84] ([i915#17503]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#4613]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-9/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4613])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4565]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#8289])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#284])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#284])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@gem_media_vme.html
    - shard-glk:          NOTRUN -> [SKIP][91] ([i915#17543])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4083]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_mmap@big-bo.html
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#4083]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#4077]) +14 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@hang-user:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#4077]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@gem_mmap_gtt@hang-user.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4083]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#3282]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#3282]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-snb:          NOTRUN -> [SKIP][99] ([i915#17635])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_ppgtt@shrink-vs-evict-pinned:
    - shard-snb:          NOTRUN -> [SKIP][100] ([i915#17615]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_ppgtt@shrink-vs-evict-pinned.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][101] ([i915#2658])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][102] ([i915#2658]) +1 other test warn
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4270]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_pxp@display-protected-crc.html
    - shard-snb:          NOTRUN -> [SKIP][104] ([i915#17521]) +6 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_pxp@display-protected-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#4270]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-glk:          NOTRUN -> [SKIP][106] ([i915#17521]) +4 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-glk11:        NOTRUN -> [SKIP][107] ([i915#17521]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-glk10:        NOTRUN -> [SKIP][108] ([i915#17521]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_readwrite@read-write:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#3282]) +6 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@gem_readwrite@read-write.html
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3282]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@gem_readwrite@read-write.html

  * igt@gem_render_copy@y-tiled-ccs-to-x-tiled:
    - shard-snb:          NOTRUN -> [SKIP][111] ([i915#17591]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][112] ([i915#17492]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#5190] / [i915#8428]) +10 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk11:        NOTRUN -> [SKIP][114] ([i915#17492])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#8428])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-snb:          NOTRUN -> [SKIP][116] ([i915#17492]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-glk10:        NOTRUN -> [SKIP][117] ([i915#17492]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#4079])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@gem_render_tiled_blits@basic.html

  * igt@gem_softpin@allocator-basic-reserve:
    - shard-snb:          NOTRUN -> [SKIP][119] ([i915#17471])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@gem_softpin@allocator-basic-reserve.html

  * igt@gem_softpin@evict-snoop:
    - shard-glk:          NOTRUN -> [SKIP][120] ([i915#17551])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4885])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_softpin@noreloc-s3:
    - shard-rkl:          [PASS][122] -> [INCOMPLETE][123] ([i915#13809] / [i915#16226])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_softpin@noreloc-s3.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#15657])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4879])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#3297]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_userptr_blits@coherency-sync.html
    - shard-glk10:        NOTRUN -> [SKIP][127] ([i915#16871])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-glk10:        NOTRUN -> [SKIP][128] ([i915#17507])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-glk:          NOTRUN -> [SKIP][129] ([i915#17507]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk2/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#3281] / [i915#3297])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#3297]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@gem_userptr_blits@unsync-overlap.html
    - shard-snb:          NOTRUN -> [SKIP][132] ([i915#17507]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_vm_create@execbuf:
    - shard-snb:          NOTRUN -> [SKIP][133] ([i915#17596]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@gem_vm_create@execbuf.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          ([PASS][134], [PASS][135]) -> [INCOMPLETE][136] ([i915#13356] / [i915#17880])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_workarounds@suspend-resume-context.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_mixed_blits:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#17455]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@gen3_mixed_blits.html

  * igt@gen3_render_linear_blits:
    - shard-glk11:        NOTRUN -> [SKIP][138] ([i915#17555])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#17455]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#17455]) +4 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gen7_exec_parse@basic-rejected.html
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#17455]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gen7_exec_parse@basic-rejected.html
    - shard-snb:          NOTRUN -> [SKIP][142] ([i915#17505]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#17455]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-9/igt@gen7_exec_parse@load-register-reg.html
    - shard-glk:          NOTRUN -> [SKIP][144] ([i915#17505]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#14544] / [i915#2527])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-snb:          NOTRUN -> [SKIP][146] ([i915#17597]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#2527] / [i915#2856])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-2/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#2856]) +5 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gen9_exec_parse@secure-batches.html
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#2527]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#14123])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@i915_drm_fdinfo@all-busy-idle-check-all.html
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#14123])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@busy@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#14073]) +5 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@i915_drm_fdinfo@busy@rcs0.html
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#14073]) +6 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@i915_drm_fdinfo@busy@rcs0.html

  * igt@i915_drm_fdinfo@busy@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#14073]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@i915_drm_fdinfo@busy@vecs1.html

  * igt@i915_drm_fdinfo@memory-info-active:
    - shard-snb:          NOTRUN -> [SKIP][155] ([i915#17603]) +6 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@i915_drm_fdinfo@memory-info-active.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#13786])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_hangman@engine-engine-hang:
    - shard-snb:          NOTRUN -> [SKIP][157] ([i915#17610]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@i915_hangman@engine-engine-hang.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-glk10:        NOTRUN -> [SKIP][158] ([i915#17526])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#6590]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          NOTRUN -> [FAIL][160] ([i915#12964]) +1 other test fail
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          NOTRUN -> [INCOMPLETE][161] ([i915#13356] / [i915#15172])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#11681] / [i915#6621]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#11681] / [i915#6621]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@reset:
    - shard-mtlp:         ([PASS][164], [PASS][165]) -> [FAIL][166] ([i915#15365])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@i915_pm_rps@reset.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@i915_pm_rps@reset.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#11681]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@i915_pm_rps@thresholds.html
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#11681]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#11681])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#7984])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#6245])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@i915_query@hwconfig_table.html
    - shard-glk:          NOTRUN -> [SKIP][172] ([i915#17584])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt@i915_query@hwconfig_table.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][173] ([i915#13356] / [i915#16182] / [i915#4817])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk2/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-tglu:         ([PASS][174], [PASS][175]) -> [ABORT][176] ([i915#15840])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-glk:          NOTRUN -> [SKIP][177] ([i915#11680])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@intel_hwmon@hwmon-write.html
    - shard-snb:          NOTRUN -> [SKIP][178] ([i915#17674])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#4212]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#5190])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#4212]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_addfb_basic@clobberred-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#4212]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][183] ([i915#17150])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [INCOMPLETE][184] ([i915#17037])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-snb:          NOTRUN -> [SKIP][185] ([i915#17562])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
    - shard-glk11:        NOTRUN -> [SKIP][186] ([i915#17562])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][187] ([i915#17614]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][188] ([i915#17613]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][189] ([i915#1769]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#1769] / [i915#3555])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][191] ([i915#1769])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-rkl:          ([PASS][192], [PASS][193]) -> [FAIL][194] ([i915#15662]) +1 other test fail
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#4538] / [i915#5286]) +2 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#4538] / [i915#5286]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#17432] / [i915#5286]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-glk10:        NOTRUN -> [SKIP][198] ([i915#17557])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-snb:          NOTRUN -> [SKIP][199] ([i915#17557])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-glk11:        NOTRUN -> [SKIP][200] ([i915#17478]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-glk10:        NOTRUN -> [SKIP][201] ([i915#17500]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#17431] / [i915#3638]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-snb:          NOTRUN -> [SKIP][203] ([i915#17500]) +5 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#3638]) +3 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#17431]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#17431]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#3828])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-glk11:        NOTRUN -> [SKIP][208] ([i915#17524])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#3828])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3828])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-snb:          NOTRUN -> [SKIP][211] ([i915#17524])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-glk:          NOTRUN -> [SKIP][212] ([i915#17524])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#17431]) +6 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][214] ([i915#17500]) +6 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#4538] / [i915#5190]) +15 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-snb:          NOTRUN -> [SKIP][216] ([i915#17478]) +18 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-glk10:        NOTRUN -> [SKIP][217] ([i915#17478]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#4538]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#4538])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglu:         NOTRUN -> [SKIP][220] ([i915#17432]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#17432]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][222] ([i915#17478]) +8 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][223] ([i915#17491]) +79 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][224] ([i915#17490] / [i915#17491]) +27 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-glk:          NOTRUN -> [SKIP][226] ([i915#17525]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][227] ([i915#17490] / [i915#17491]) +11 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-snb:          NOTRUN -> [SKIP][228] ([i915#17594]) +22 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#14544] / [i915#6095]) +7 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#12313]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#12313])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#6095]) +39 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#14098] / [i915#14544] / [i915#6095]) +5 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [SKIP][234] ([i915#17491]) +29 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#6095]) +44 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#12805])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [PASS][237] -> [FAIL][238] ([i915#17158]) +1 other test fail
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#6095]) +9 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#10307] / [i915#6095]) +110 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#6095]) +55 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#6095]) +111 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][243] ([i915#17490] / [i915#17491]) +7 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][244] ([i915#17525])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#14098] / [i915#6095]) +35 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#12313])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][247] ([i915#17491]) +19 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#17099])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_cdclk@mode-rejected-max-dotclock.html
    - shard-snb:          NOTRUN -> [SKIP][249] ([i915#17550])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_cdclk@mode-rejected-max-dotclock.html
    - shard-glk10:        NOTRUN -> [SKIP][250] ([i915#17550])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-glk:          NOTRUN -> [SKIP][251] ([i915#17550])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#16017])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#3742])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#11151])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#11151] / [i915#7828]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-snb:          NOTRUN -> [SKIP][256] ([i915#17483]) +7 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#11151] / [i915#7828]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-10/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#11151] / [i915#7828]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-snb:          NOTRUN -> [SKIP][259] ([i915#17489])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#17427]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#17427]) +4 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#17427]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html
    - shard-snb:          NOTRUN -> [SKIP][263] ([i915#17497]) +5 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][264] ([i915#17497]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#17427]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#17427])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][267] ([i915#17497]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#16471] / [i915#17427]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#16471] / [i915#17427])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#16471] / [i915#17427])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-3/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-glk11:        NOTRUN -> [SKIP][271] ([i915#17497]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#11151] / [i915#7828])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#11151] / [i915#7828]) +10 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-glk10:        NOTRUN -> [SKIP][274] ([i915#17483])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_chamelium_frames@dp-crc-multiple.html
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#11151] / [i915#14544] / [i915#7828])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-glk:          NOTRUN -> [SKIP][276] ([i915#17483]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-glk11:        NOTRUN -> [SKIP][277] ([i915#17483]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-glk11:        NOTRUN -> [SKIP][278] ([i915#17510])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][279] ([i915#17510]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-snb:          NOTRUN -> [SKIP][280] ([i915#17510]) +5 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_color_pipeline@plane-lut1d.html
    - shard-glk10:        NOTRUN -> [SKIP][281] ([i915#17510])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#16990]) +15 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#16990]) +15 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#15865])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#15330]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#15330])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-glk10:        NOTRUN -> [SKIP][287] ([i915#17502]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-glk:          NOTRUN -> [SKIP][288] ([i915#17502]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#15330] / [i915#3299])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#15330] / [i915#3299])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_content_protection@dp-mst-type-1.html
    - shard-snb:          NOTRUN -> [SKIP][291] ([i915#17502]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-glk:          NOTRUN -> [SKIP][292] ([i915#17508]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_content_protection@legacy.html
    - shard-snb:          NOTRUN -> [SKIP][293] ([i915#17508]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#15865]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-5/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#15865]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][296] ([i915#15865])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-9/igt@kms_content_protection@srm.html
    - shard-glk11:        NOTRUN -> [SKIP][297] ([i915#17508]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-snb:          NOTRUN -> [SKIP][298] ([i915#17504]) +5 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#8814]) +2 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          ([PASS][300], [PASS][301]) -> [FAIL][302] ([i915#13566]) +1 other test fail
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-tglu:         ([PASS][303], [PASS][304]) -> [FAIL][305] ([i915#13566]) +1 other test fail
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [PASS][306] -> [FAIL][307] ([i915#13566]) +1 other test fail
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][308] -> [FAIL][309] ([i915#13566]) +1 other test fail
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-glk:          NOTRUN -> [SKIP][310] ([i915#17533]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-glk11:        NOTRUN -> [SKIP][311] ([i915#17504])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#14544] / [i915#3555]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#13049]) +3 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-snb:          NOTRUN -> [SKIP][314] ([i915#17533]) +3 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#13049]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#3555]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#3555]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#3555] / [i915#8814])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-32x32.html
    - shard-glk:          NOTRUN -> [SKIP][319] ([i915#17504])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-glk11:        NOTRUN -> [SKIP][320] ([i915#17533])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-snb:          NOTRUN -> [ABORT][321] ([i915#15840]) +13 other tests abort
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_cursor_crc@cursor-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][322] ([i915#12358] / [i915#13356] / [i915#14152] / [i915#7882])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][323] ([i915#12358] / [i915#13356] / [i915#14152])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#4103])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#4103])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#17428] / [i915#17454]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#17428] / [i915#9809]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#13046] / [i915#17454] / [i915#5354]) +5 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][329] ([i915#15804])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-snb:          NOTRUN -> [SKIP][330] ([i915#17457])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-glk10:        NOTRUN -> [SKIP][331] ([i915#17457])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#13691])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-5/igt@kms_display_modes@extended-mode-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#13691])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][334] ([i915#17487])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][335] ([i915#17486]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-snb:          NOTRUN -> [SKIP][336] ([i915#17486]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#17289])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-glk10:        NOTRUN -> [SKIP][338] ([i915#17560])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#17287])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-mtlp:         NOTRUN -> [SKIP][340] ([i915#17287])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-glk:          NOTRUN -> [SKIP][341] ([i915#17519])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#17287])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#17287])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-dg1:          NOTRUN -> [SKIP][344] ([i915#17287])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-snb:          NOTRUN -> [SKIP][345] ([i915#17519])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][346] ([i915#17477])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#17285]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#17285]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
    - shard-snb:          NOTRUN -> [SKIP][349] ([i915#17477]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#13748])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-15/igt@kms_dp_link_training@uhbr-sst.html
    - shard-glk10:        NOTRUN -> [SKIP][351] ([i915#17477])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#13748])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-mtlp:         NOTRUN -> [SKIP][353] ([i915#17297])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_dp_link_training@uhbr-sst-direct-train.html
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#17285])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_dp_link_training@uhbr-sst-direct-train.html
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#17285])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#14544] / [i915#17285])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-glk:          NOTRUN -> [SKIP][357] ([i915#17680])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-glk:          NOTRUN -> [SKIP][358] ([i915#17548])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#16867])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-snb:          NOTRUN -> [SKIP][360] ([i915#17548])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#16867])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#16867] / [i915#16870])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#8812])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          NOTRUN -> [SKIP][364] ([i915#16361]) +5 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#16361]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-glk10:        NOTRUN -> [SKIP][366] ([i915#17458])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-snb:          NOTRUN -> [SKIP][367] ([i915#17458]) +5 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][368] ([i915#16361]) +4 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-glk11:        NOTRUN -> [SKIP][369] ([i915#17458]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-glk:          NOTRUN -> [SKIP][370] ([i915#17458]) +3 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#16361]) +3 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#16361]) +5 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][373] ([i915#13356] / [i915#9878])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][374] ([i915#16680])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_fbcon_fbt@psr.html
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#16680])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_fbcon_fbt@psr.html
    - shard-glk:          NOTRUN -> [SKIP][376] ([i915#17516])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-snb:          NOTRUN -> [SKIP][377] ([i915#17581])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-glk:          NOTRUN -> [SKIP][378] ([i915#17666])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dsc:
    - shard-glk10:        NOTRUN -> [SKIP][379] ([i915#17539])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_feature_discovery@dsc.html
    - shard-tglu:         NOTRUN -> [SKIP][380] ([i915#16600])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@hdr:
    - shard-glk:          NOTRUN -> [SKIP][381] ([i915#17539])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_feature_discovery@hdr.html
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#16600])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_feature_discovery@hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#16600])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_feature_discovery@hdr.html
    - shard-snb:          NOTRUN -> [SKIP][384] ([i915#17539])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][385] ([i915#658])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_feature_discovery@psr2.html
    - shard-snb:          NOTRUN -> [SKIP][386] ([i915#17585])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_feature_discovery@psr2.html
    - shard-tglu:         NOTRUN -> [SKIP][387] ([i915#658])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-10/igt@kms_feature_discovery@psr2.html
    - shard-glk:          NOTRUN -> [SKIP][388] ([i915#17585])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#658])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#14544] / [i915#658])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][391] ([i915#3637] / [i915#9934]) +2 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][392] ([i915#3637] / [i915#9934])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][393] ([i915#9934]) +6 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-dg1:          NOTRUN -> [SKIP][394] ([i915#9934]) +4 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-15/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][395] ([i915#9934]) +2 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a1:
    - shard-rkl:          ([PASS][396], [PASS][397]) -> [FAIL][398] ([i915#10826]) +1 other test fail
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a1.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a1.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][399] ([i915#8381])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][400] ([i915#8381])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_flip@flip-vs-fences-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][401] ([i915#8381])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-mtlp:         ([PASS][402], [PASS][403]) -> [FAIL][404] ([i915#17214]) +1 other test fail
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][405] ([i915#15643])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-glk11:        NOTRUN -> [SKIP][406] ([i915#17484])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][407] ([i915#15643]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#15643] / [i915#5190]) +3 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][409] ([i915#15643])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][410] ([i915#15643])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-snb:          NOTRUN -> [SKIP][411] ([i915#17593]) +11 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][412] ([i915#17522]) +3 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-glk10:        NOTRUN -> [SKIP][413] ([i915#17522]) +3 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][414] ([i915#3555] / [i915#8810] / [i915#8813]) +3 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][415] ([i915#17484])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][416] ([i915#15643])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-glk:          NOTRUN -> [SKIP][417] ([i915#17493])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-glk:          NOTRUN -> [SKIP][418] ([i915#17465])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_force_connector_basic@force-load-detect.html
    - shard-dg2:          NOTRUN -> [SKIP][419] ([i915#17452])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_force_connector_basic@force-load-detect.html
    - shard-dg1:          NOTRUN -> [SKIP][420] ([i915#17452])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][421] ([i915#15990] / [i915#8708]) +16 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][422] ([i915#5439])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][423] ([i915#5439])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][424] ([i915#10055])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-dg2:          NOTRUN -> [SKIP][425] ([i915#10055])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-snb:          NOTRUN -> [SKIP][426] ([i915#17609])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][427] ([i915#15989]) +9 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][428] ([i915#17517]) +38 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][429] ([i915#15989]) +8 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][430] ([i915#15989]) +8 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-9/igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-mtlp:         NOTRUN -> [SKIP][431] ([i915#15991] / [i915#17428]) +19 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-msflip-blt:
    - shard-glk11:        [PASS][432] -> [SKIP][433] ([i915#17517]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-msflip-blt.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:
    - shard-glk:          [PASS][434] -> [SKIP][435] ([i915#17517]) +2 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          [PASS][436] -> [SKIP][437] ([i915#15989]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][438] ([i915#15102]) +46 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
    - shard-glk10:        NOTRUN -> [SKIP][439] ([i915#17482]) +33 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][440] ([i915#15991] / [i915#5354]) +38 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][441] ([i915#17428]) +77 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][442] ([i915#14544] / [i915#17428]) +3 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][443] ([i915#15990]) +22 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][444] ([i915#17482]) +94 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][445] ([i915#15102]) +33 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][446] ([i915#15102]) +23 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-snb:          NOTRUN -> [SKIP][447] ([i915#17588]) +122 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][448] ([i915#15990]) +27 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][449] ([i915#15990]) +5 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][450] ([i915#17559]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
    - shard-snb:          NOTRUN -> [SKIP][451] ([i915#17559]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][452] ([i915#15989]) +26 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
    - shard-snb:          NOTRUN -> [SKIP][453] ([i915#17517]) +26 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][454] ([i915#15989]) +18 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          NOTRUN -> [SKIP][455] ([i915#15991]) +59 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-onoff:
    - shard-glk11:        NOTRUN -> [SKIP][456] ([i915#17517]) +5 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:
    - shard-snb:          NOTRUN -> [SKIP][457] ([i915#17606]) +1 other test skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][458] ([i915#15104] / [i915#15990]) +1 other test skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][459] ([i915#15104] / [i915#15990]) +1 other test skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-glk11:        NOTRUN -> [SKIP][460] ([i915#17482]) +30 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][461] ([i915#15990] / [i915#8708]) +21 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][462] ([i915#15991] / [i915#17428] / [i915#1825]) +13 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][463] ([i915#17428] / [i915#1825]) +3 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][464] ([i915#17428]) +37 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][465] ([i915#15102]) +19 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][466] ([i915#17482]) +42 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][467] ([i915#17428]) +35 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-glk11:        NOTRUN -> [FAIL][468] ([i915#17102])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-snb:          NOTRUN -> [FAIL][469] ([i915#17104])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
    - shard-mtlp:         NOTRUN -> [SKIP][470] ([i915#17103])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-tglu:         NOTRUN -> [FAIL][471] ([i915#17101] / [i915#17108] / [i915#17188])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          NOTRUN -> [SKIP][472] ([i915#16518] / [i915#3555] / [i915#8228]) +1 other test skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_hdr@bpc-switch.html
    - shard-snb:          NOTRUN -> [SKIP][473] ([i915#17498]) +1 other test skip
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_hdr@bpc-switch.html
    - shard-glk10:        NOTRUN -> [SKIP][474] ([i915#17498])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-glk11:        NOTRUN -> [SKIP][475] ([i915#17498])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg1:          NOTRUN -> [SKIP][476] ([i915#3555] / [i915#8228])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-glk:          NOTRUN -> [SKIP][477] ([i915#17498])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][478] ([i915#17678])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][479] ([i915#15459])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][480] ([i915#15459])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_joiner@basic-force-big-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][481] ([i915#17678])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][482] ([i915#15458])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][483] ([i915#17567])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-glk10:        NOTRUN -> [SKIP][484] ([i915#17512])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][485] ([i915#15458])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-glk11:        NOTRUN -> [SKIP][486] ([i915#17567])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-snb:          NOTRUN -> [SKIP][487] ([i915#17617])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-glk:          NOTRUN -> [SKIP][488] ([i915#17540])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-snb:          NOTRUN -> [SKIP][489] ([i915#17540]) +1 other test skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-glk11:        NOTRUN -> [SKIP][490] ([i915#17540])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][491] ([i915#17461])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][492] ([i915#17686]) +1 other test skip
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-dg1:          NOTRUN -> [SKIP][493] ([i915#14712])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
    - shard-snb:          NOTRUN -> [SKIP][494] ([i915#17601])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
    - shard-tglu:         NOTRUN -> [SKIP][495] ([i915#14712])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][496] ([i915#15709])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-glk11:        NOTRUN -> [SKIP][497] ([i915#17479])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-glk:          NOTRUN -> [SKIP][498] ([i915#17479]) +2 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][499] ([i915#16386]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-glk10:        NOTRUN -> [SKIP][500] ([i915#17479])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][501] ([i915#16386]) +1 other test skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][502] ([i915#15709]) +5 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][503] ([i915#16386]) +1 other test skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-snb:          NOTRUN -> [SKIP][504] ([i915#17479]) +7 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_plane@pixel-format-yf-tiled-modifier.html
    - shard-mtlp:         NOTRUN -> [SKIP][505] ([i915#15709])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][506] ([i915#15709]) +3 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
    - shard-rkl:          NOTRUN -> [SKIP][507] ([i915#15709])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][508] ([i915#17494]) +1 other test skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg1:          NOTRUN -> [ABORT][509] ([i915#17844]) +12 other tests abort
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_plane@plane-panning-bottom-right-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][510] ([i915#13026] / [i915#13356]) +1 other test incomplete
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][511] ([i915#13026] / [i915#13356])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][512] ([i915#13356]) +1 other test incomplete
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - shard-snb:          NOTRUN -> [SKIP][513] ([i915#17595]) +2 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_plane_alpha_blend@alpha-7efc.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][514] ([i915#12178])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][515] ([i915#7862]) +1 other test fail
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][516] ([i915#3555] / [i915#8821])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html
    - shard-dg1:          NOTRUN -> [SKIP][517] ([i915#3555]) +5 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_plane_lowres@tiling-yf.html
    - shard-snb:          NOTRUN -> [SKIP][518] ([i915#17509])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][519] ([i915#13958])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-snb:          NOTRUN -> [SKIP][520] ([i915#17586])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg1:          NOTRUN -> [SKIP][521] ([i915#13958])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][522] ([i915#14259])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][523] ([i915#13046] / [i915#17454] / [i915#5354] / [i915#9423])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-p010:
    - shard-glk:          NOTRUN -> [SKIP][524] ([i915#17833]) +17 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-p010.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled:
    - shard-glk11:        NOTRUN -> [SKIP][525] ([i915#17528])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-hdmi-a-1-p010:
    - shard-glk10:        NOTRUN -> [SKIP][526] ([i915#17833]) +8 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a-hdmi-a-1-p010.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][527] ([i915#17832])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][528] ([i915#17832]) +4 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled.html
    - shard-snb:          NOTRUN -> [SKIP][529] ([i915#17528]) +5 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xyuv8888:
    - shard-glk11:        NOTRUN -> [SKIP][530] ([i915#17833]) +8 other tests skip
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xyuv8888.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-1-rgb565:
    - shard-glk:          NOTRUN -> [SKIP][531] ([i915#17843]) +2 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-1-rgb565.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f:
    - shard-rkl:          NOTRUN -> [SKIP][532] ([i915#17843]) +17 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][533] ([i915#17832])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-glk11:        NOTRUN -> [SKIP][534] ([i915#17462])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_pm_backlight@basic-brightness.html
    - shard-rkl:          NOTRUN -> [SKIP][535] ([i915#12343] / [i915#5354])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_pm_backlight@basic-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][536] ([i915#12343] / [i915#9812])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-10/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-glk:          NOTRUN -> [SKIP][537] ([i915#17462])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][538] ([i915#12343] / [i915#5354]) +1 other test skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][539] ([i915#12343] / [i915#5354]) +1 other test skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-snb:          NOTRUN -> [SKIP][540] ([i915#17462]) +1 other test skip
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-snb:          NOTRUN -> [SKIP][541] ([i915#17602]) +3 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-rkl:          [PASS][542] -> [INCOMPLETE][543] ([i915#16943])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-glk:          NOTRUN -> [SKIP][544] ([i915#17495])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_pm_dc@dc5-pageflip-negative.html
    - shard-dg2:          NOTRUN -> [SKIP][545] ([i915#9685])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-glk10:        NOTRUN -> [SKIP][546] ([i915#17564])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][547] ([i915#15751])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][548] ([i915#3361])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-glk:          NOTRUN -> [SKIP][549] ([i915#17564])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][550] ([i915#15948]) +1 other test skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_pm_dc@dc6-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][551] ([i915#15948]) +1 other test skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          [PASS][552] -> [SKIP][553] ([i915#15073])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][554] ([i915#15073])
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-rkl:          [PASS][555] -> [SKIP][556] ([i915#15073])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          ([PASS][557], [PASS][558]) -> [SKIP][559] ([i915#15073])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg1:          ([PASS][560], [PASS][561]) -> [SKIP][562] ([i915#15073])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg1-19/igt@kms_pm_rpm@dpms-non-lpsp.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg1-17/igt@kms_pm_rpm@dpms-non-lpsp.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][563] ([i915#4077]) +10 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_pm_rpm@fences.html
    - shard-snb:          NOTRUN -> [SKIP][564] ([i915#17473]) +5 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-glk:          NOTRUN -> [SKIP][565] ([i915#15073]) +1 other test skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][566] ([i915#6524] / [i915#6805])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html
    - shard-glk10:        NOTRUN -> [SKIP][567] ([i915#17569])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_properties@colorop-properties-atomic:
    - shard-glk:          NOTRUN -> [SKIP][568] ([i915#17481])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_properties@colorop-properties-atomic.html
    - shard-snb:          NOTRUN -> [SKIP][569] ([i915#17481])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_properties@colorop-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][570] ([i915#11520]) +9 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][571] ([i915#11520]) +6 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][572] ([i915#9808])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][573] ([i915#12316]) +3 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][574] ([i915#11520]) +3 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][575] ([i915#11520]) +11 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][576] ([i915#11520]) +3 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][577] ([i915#11520]) +11 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][578] ([i915#11520]) +6 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][579] ([i915#11520] / [i915#14544])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-glk10:        NOTRUN -> [SKIP][580] ([i915#11520]) +2 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][581] ([i915#9683]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][582] ([i915#9683])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-snb:          NOTRUN -> [SKIP][583] ([i915#17546])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-glk:          NOTRUN -> [SKIP][584] ([i915#17546])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][585] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][586] ([i915#1072] / [i915#9732]) +26 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][587] ([i915#9732]) +8 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-glk11:        NOTRUN -> [SKIP][588] ([i915#17480]) +3 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-mtlp:         NOTRUN -> [SKIP][589] ([i915#9688]) +7 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg1:          NOTRUN -> [SKIP][590] ([i915#1072] / [i915#9732]) +17 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-snb:          NOTRUN -> [SKIP][591] ([i915#17480]) +23 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-glk10:        NOTRUN -> [SKIP][592] ([i915#17480]) +8 other tests skip
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-glk:          NOTRUN -> [SKIP][593] ([i915#17480]) +18 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][594] ([i915#1072] / [i915#9732]) +6 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-glk11:        NOTRUN -> [SKIP][595] ([i915#17480] / [i915#9732])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-snb:          NOTRUN -> [SKIP][596] ([i915#17554])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-glk:          NOTRUN -> [SKIP][597] ([i915#17554])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][598] ([i915#15949])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-snb:          NOTRUN -> [SKIP][599] ([i915#17488]) +6 other tests skip
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][600] ([i915#4235])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][601] ([i915#5289])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][602] ([i915#15867]) +1 other test skip
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-glk:          NOTRUN -> [SKIP][603] ([i915#17488]) +2 other tests skip
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-glk11:        NOTRUN -> [SKIP][604] ([i915#17488])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][605] ([i915#17432] / [i915#5289])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][606] ([i915#12755] / [i915#15867]) +2 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][607] ([i915#17445])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2:          NOTRUN -> [ABORT][608] ([i915#17844]) +13 other tests abort
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][609] ([i915#17752]) +4 other tests dmesg-warn
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][610] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][611] ([i915#15840] / [i915#17752]) +1 other test dmesg-warn
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic:
    - shard-dg2:          NOTRUN -> [SKIP][612] ([i915#15243] / [i915#3555]) +2 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_vrr@flip-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][613] ([i915#15243] / [i915#3555])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_vrr@flip-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][614] ([i915#3555] / [i915#8808])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-1/igt@kms_vrr@flip-basic.html
    - shard-glk11:        NOTRUN -> [SKIP][615] ([i915#17520])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@max-min:
    - shard-glk:          NOTRUN -> [SKIP][616] ([i915#17520]) +2 other tests skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][617] ([i915#3555] / [i915#9906])
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-glk10:        NOTRUN -> [SKIP][618] ([i915#17520])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][619] ([i915#9906])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-dg1:          NOTRUN -> [SKIP][620] ([i915#9906])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-snb:          NOTRUN -> [SKIP][621] ([i915#17520]) +2 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@gen12-mi-rpc:
    - shard-glk10:        NOTRUN -> [SKIP][622] ([i915#17536])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@perf@gen12-mi-rpc.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-glk:          NOTRUN -> [SKIP][623] ([i915#17536])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk5/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@whitelisted-registers-userspace-config:
    - shard-snb:          NOTRUN -> [SKIP][624] ([i915#17592]) +2 other tests skip
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb6/igt@perf@whitelisted-registers-userspace-config.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-mtlp:         [PASS][625] -> [FAIL][626] ([i915#17785])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-accuracy-50:
    - shard-snb:          NOTRUN -> [SKIP][627] ([i915#17637]) +1 other test skip
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@perf_pmu@busy-accuracy-50.html

  * igt@perf_pmu@busy-accuracy-50@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][628] ([i915#17651]) +1 other test skip
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@perf_pmu@busy-accuracy-50@bcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-snb:          NOTRUN -> [SKIP][629] ([i915#17583])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][630] ([i915#8516])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_udl@share-import:
    - shard-glk11:        NOTRUN -> [SKIP][631] ([i915#16420])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@prime_udl@share-import.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][632] ([i915#3708]) +1 other test skip
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@prime_vgem@fence-flip-hang.html
    - shard-snb:          NOTRUN -> [SKIP][633] ([i915#17467]) +1 other test skip
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@prime_vgem@fence-flip-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][634] ([i915#3708])
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@prime_vgem@fence-flip-hang.html
    - shard-glk10:        NOTRUN -> [SKIP][635] ([i915#17467])
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk10/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-glk:          NOTRUN -> [SKIP][636] ([i915#17467])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@prime_vgem@fence-write-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][637] ([i915#3708])
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_timeslice_duration@timeout:
    - shard-snb:          NOTRUN -> [SKIP][638] ([i915#17632]) +3 other tests skip
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb4/igt@sysfs_timeslice_duration@timeout.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-glk11:        NOTRUN -> [SKIP][639] ([i915#17545])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk11/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][640] ([i915#4818])
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][641] ([i915#17447] / [i915#4818])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          ([PASS][642], [INCOMPLETE][643]) ([i915#13356]) -> [PASS][644] +1 other test pass
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_ctx_isolation@preservation-s3.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_eio@in-flight-suspend:
    - shard-mtlp:         [ABORT][645] ([i915#17217]) -> [PASS][646]
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@gem_eio@in-flight-suspend.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-mtlp:         ([ABORT][647], [FAIL][648]) ([i915#17146] / [i915#17160]) -> [PASS][649] +1 other test pass
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-5/igt@gem_exec_suspend@basic-s0.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@gem_exec_suspend@basic-s0.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          [FAIL][650] ([i915#17879]) -> [PASS][651] +1 other test pass
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-mtlp:         [FAIL][652] ([i915#17879]) -> [PASS][653] +1 other test pass
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@gem_exec_suspend@basic-s4-devices.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         ([PASS][654], [ABORT][655]) ([i915#16996]) -> [PASS][656]
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-7/igt@i915_module_load@reload-no-display.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-3/igt@i915_module_load@reload-no-display.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-2/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          ([INCOMPLETE][657], [INCOMPLETE][658]) ([i915#13356]) -> [PASS][659]
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk2/igt@i915_pm_rpm@system-suspend.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk8/igt@i915_pm_rpm@system-suspend.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - shard-mtlp:         ([PASS][660], [INCOMPLETE][661]) ([i915#16229]) -> [PASS][662] +1 other test pass
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-3/igt@i915_selftest@live@guc_multi_lrc.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@i915_selftest@live@guc_multi_lrc.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          ([INCOMPLETE][663], [PASS][664]) ([i915#4817]) -> [PASS][665]
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@i915_suspend@forcewake.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@i915_suspend@forcewake.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@i915_suspend@forcewake.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - shard-mtlp:         ([DMESG-WARN][666], [PASS][667]) ([i915#12935]) -> [PASS][668] +1 other test pass
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][669] ([i915#17150]) -> [PASS][670]
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
    - shard-mtlp:         [INCOMPLETE][671] ([i915#17037]) -> [PASS][672]
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-snb:          ([INCOMPLETE][673], [PASS][674]) ([i915#9878]) -> [PASS][675] +1 other test pass
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][676] ([i915#15733] / [i915#5138]) -> [PASS][677]
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          ([DMESG-WARN][678], [DMESG-WARN][679]) ([i915#13363]) -> [PASS][680]
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
    - shard-tglu:         [DMESG-WARN][681] ([i915#13363]) -> [PASS][682]
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-9/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - shard-tglu:         [DMESG-WARN][683] ([i915#17147]) -> [PASS][684]
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-9/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
    - shard-rkl:          ([DMESG-WARN][685], [DMESG-WARN][686]) ([i915#17147]) -> [PASS][687]
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [INCOMPLETE][688] ([i915#14694] / [i915#15582]) -> [PASS][689]
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          [INCOMPLETE][690] ([i915#14694]) -> [PASS][691]
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          ([FAIL][692], [PASS][693]) ([i915#13566]) -> [PASS][694] +1 other test pass
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
    - shard-tglu:         ([FAIL][695], [FAIL][696]) ([i915#13566]) -> [PASS][697] +1 other test pass
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          [FAIL][698] ([i915#13566]) -> [PASS][699] +1 other test pass
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_cursor_crc@cursor-random-64x21.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_cursor_crc@cursor-random-64x21.html
    - shard-tglu:         ([FAIL][700], [PASS][701]) ([i915#13566]) -> [PASS][702] +1 other test pass
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-3/igt@kms_cursor_crc@cursor-random-64x21.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-5/igt@kms_cursor_crc@cursor-random-64x21.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-3/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-rkl:          ([FAIL][703], [FAIL][704]) ([i915#13566]) -> [PASS][705]
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-mtlp:         [FAIL][706] ([i915#17157]) -> [PASS][707] +1 other test pass
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-2/igt@kms_cursor_crc@cursor-suspend.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-rkl:          ([INCOMPLETE][708], [PASS][709]) ([i915#16276] / [i915#6113]) -> [PASS][710]
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-to-linear:
    - shard-mtlp:         ([PASS][711], [FAIL][712]) ([i915#15733]) -> [PASS][713] +1 other test pass
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-to-linear.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-to-linear.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-to-linear.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-glk:          ([SKIP][714], [PASS][715]) ([i915#17517]) -> [PASS][716] +1 other test pass
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-rkl:          [SKIP][717] ([i915#15989]) -> [PASS][718]
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          ([SKIP][719], [SKIP][720]) ([i915#15989]) -> [PASS][721] +11 other tests pass
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-glk:          [SKIP][722] ([i915#17517]) -> [PASS][723] +2 other tests pass
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          ([PASS][724], [SKIP][725]) ([i915#15989]) -> [PASS][726]
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt:
    - shard-glk:          ([SKIP][727], [SKIP][728]) ([i915#17517]) -> [PASS][729]
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-mtlp:         ([SKIP][730], [PASS][731]) ([i915#15725]) -> [PASS][732]
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-4/igt@kms_hdmi_inject@inject-audio.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          [SKIP][733] ([i915#16644] / [i915#3555] / [i915#8228]) -> [PASS][734]
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_hdr@bpc-switch.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_hdr@bpc-switch.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-tglu:         [DMESG-WARN][735] ([i915#16696] / [i915#16772]) -> [PASS][736]
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-mtlp:         [FAIL][737] ([i915#15733]) -> [PASS][738] +2 other tests pass
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [INCOMPLETE][739] ([i915#14412]) -> [PASS][740] +1 other test pass
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-glk:          ([SKIP][741], [SKIP][742]) ([i915#17528]) -> [PASS][743]
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk5/igt@kms_plane_scaling@intel-max-src-size.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk2/igt@kms_plane_scaling@intel-max-src-size.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-tglu:         ([SKIP][744], [SKIP][745]) ([i915#17832] / [i915#6953]) -> [PASS][746]
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-10/igt@kms_plane_scaling@intel-max-src-size.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-mtlp:         [INCOMPLETE][747] ([i915#17032]) -> [PASS][748]
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_pm_backlight@fade-with-suspend.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-mtlp:         ([FAIL][749], [FAIL][750]) ([i915#17173]) -> [PASS][751]
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          ([SKIP][752], [SKIP][753]) ([i915#15073]) -> [PASS][754]
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_pm_rpm@dpms-non-lpsp.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          ([SKIP][755], [PASS][756]) ([i915#15073]) -> [PASS][757]
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          ([PASS][758], [INCOMPLETE][759]) ([i915#14419]) -> [PASS][760]
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_pm_rpm@system-suspend-modeset.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:
    - shard-glk:          ([ABORT][761], [PASS][762]) ([i915#13179]) -> [PASS][763]
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-mtlp:         [FAIL][764] ([i915#17209]) -> [PASS][765] +1 other test pass
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         ([FAIL][766], [PASS][767]) ([i915#4349]) -> [PASS][768]
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@perf_pmu@busy-double-start@ccs0.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@perf_pmu@busy-double-start@ccs0.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@gt-awake:
    - shard-mtlp:         ([PASS][769], [FAIL][770]) ([i915#17696]) -> [PASS][771]
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-4/igt@perf_pmu@gt-awake.html
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-8/igt@perf_pmu@gt-awake.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@perf_pmu@gt-awake.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          ([INCOMPLETE][772], [PASS][773]) ([i915#13520]) -> [PASS][774]
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@perf_pmu@rc6-suspend.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@perf_pmu@rc6-suspend.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          ([SKIP][775], [SKIP][776]) ([i915#14544] / [i915#8411]) -> [SKIP][777] ([i915#8411])
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@api_intel_bb@blit-reloc-purge-cache.html
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          ([SKIP][778], [SKIP][779]) ([i915#11078]) -> [SKIP][780] ([i915#11078] / [i915#14544])
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@device_reset@unbind-cold-reset-rebind.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          [SKIP][781] ([i915#14544] / [i915#3281]) -> [SKIP][782] ([i915#3281]) +2 other tests skip
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][783] ([i915#3555] / [i915#9323]) -> [SKIP][784] ([i915#14544] / [i915#3555] / [i915#9323])
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_ccs@block-copy-compressed.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          ([SKIP][785], [SKIP][786]) ([i915#14544] / [i915#9323]) -> [SKIP][787] ([i915#9323])
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          [SKIP][788] ([i915#14544] / [i915#6335]) -> [SKIP][789] ([i915#6335])
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          ([SKIP][790], [SKIP][791]) ([i915#14544] / [i915#8562]) -> [SKIP][792] ([i915#8562])
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_create@create-ext-set-pat.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_create@create-ext-set-pat.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-mtlp:         ([PASS][793], [FAIL][794]) ([i915#17176]) -> [FAIL][795] ([i915#17176]) +1 other test fail
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3.html
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-rkl:          ([SKIP][796], [SKIP][797]) ([i915#17444]) -> [SKIP][798] ([i915#14544] / [i915#17444])
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@gem_ctx_param@set-priority-not-supported.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@gem_ctx_param@set-priority-not-supported.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          ([INCOMPLETE][799], [PASS][800]) ([i915#13390] / [i915#17327]) -> [INCOMPLETE][801] ([i915#13390] / [i915#17327])
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@gem_eio@in-flight-suspend.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          ([SKIP][802], [SKIP][803]) ([i915#4525]) -> [SKIP][804] ([i915#14544] / [i915#4525]) +2 other tests skip
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_exec_balancer@parallel-balancer.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-rkl:          ([SKIP][805], [SKIP][806]) ([i915#14544] / [i915#3281]) -> [SKIP][807] ([i915#3281]) +3 other tests skip
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_exec_reloc@basic-concurrent16.html
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_exec_reloc@basic-concurrent16.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          ([SKIP][808], [SKIP][809]) ([i915#3281]) -> [SKIP][810] ([i915#14544] / [i915#3281])
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          [SKIP][811] ([i915#3281]) -> [SKIP][812] ([i915#14544] / [i915#3281]) +1 other test skip
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          ([SKIP][813], [SKIP][814]) ([i915#14544] / [i915#4613]) -> [SKIP][815] ([i915#4613]) +2 other tests skip
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-rkl:          ([SKIP][816], [SKIP][817]) ([i915#4613]) -> [SKIP][818] ([i915#14544] / [i915#4613]) +1 other test skip
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@gem_lmem_swapping@random-engines.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@gem_lmem_swapping@random-engines.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify:
    - shard-rkl:          [SKIP][819] ([i915#4613]) -> [SKIP][820] ([i915#14544] / [i915#4613])
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_lmem_swapping@verify.html
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_lmem_swapping@verify.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          [SKIP][821] ([i915#3282]) -> [SKIP][822] ([i915#14544] / [i915#3282])
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_partial_pwrite_pread@reads.html
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          ([SKIP][823], [SKIP][824]) ([i915#14544] / [i915#3282]) -> [SKIP][825] ([i915#3282]) +5 other tests skip
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          [SKIP][826] ([i915#14544] / [i915#3282]) -> [SKIP][827] ([i915#3282])
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          ([SKIP][828], [SKIP][829]) ([i915#3282]) -> [SKIP][830] ([i915#14544] / [i915#3282]) +1 other test skip
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@gem_pwrite@basic-self.html
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_pwrite@basic-self.html
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          ([SKIP][831], [SKIP][832]) ([i915#13717] / [i915#14544]) -> [SKIP][833] ([i915#13717])
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-rkl:          ([SKIP][834], [SKIP][835]) ([i915#15656]) -> [SKIP][836] ([i915#14544] / [i915#15656])
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@gem_tiled_pread_basic@basic.html
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@gem_tiled_pread_basic@basic.html
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          ([SKIP][837], [SKIP][838]) ([i915#17433] / [i915#3297]) -> [SKIP][839] ([i915#14544] / [i915#17433] / [i915#3297])
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@gem_userptr_blits@coherency-sync.html
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@gem_userptr_blits@coherency-sync.html
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          ([SKIP][840], [SKIP][841]) ([i915#14544] / [i915#3297] / [i915#3323]) -> [SKIP][842] ([i915#3297] / [i915#3323])
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-rkl:          [SKIP][843] ([i915#3297]) -> [SKIP][844] ([i915#14544] / [i915#3297])
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          ([SKIP][845], [SKIP][846]) ([i915#14544] / [i915#3297]) -> [SKIP][847] ([i915#3297]) +1 other test skip
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_render_linear_blits:
    - shard-rkl:          ([SKIP][848], [SKIP][849]) ([i915#14544] / [i915#17455]) -> [SKIP][850] ([i915#17455]) +2 other tests skip
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gen3_render_linear_blits.html
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gen3_render_linear_blits.html
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@gen3_render_linear_blits.html

  * igt@gen3_render_mixed_blits:
    - shard-rkl:          [SKIP][851] ([i915#14544] / [i915#17455]) -> [SKIP][852] ([i915#17455])
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gen3_render_mixed_blits.html
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gen3_render_mixed_blits.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-rkl:          ([SKIP][853], [SKIP][854]) ([i915#17455]) -> [SKIP][855] ([i915#14544] / [i915#17455])
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gen7_exec_parse@load-register-reg.html
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@gen7_exec_parse@load-register-reg.html
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          ([SKIP][856], [SKIP][857]) ([i915#2527]) -> [SKIP][858] ([i915#14544] / [i915#2527])
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@gen9_exec_parse@batch-without-end.html
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          ([SKIP][859], [SKIP][860]) ([i915#14544] / [i915#2527]) -> [SKIP][861] ([i915#2527]) +2 other tests skip
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gen9_exec_parse@bb-start-far.html
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          [SKIP][862] ([i915#14544] / [i915#2527]) -> [SKIP][863] ([i915#2527])
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          ([SKIP][864], [SKIP][865]) ([i915#14544] / [i915#6412]) -> [SKIP][866] ([i915#6412])
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@i915_module_load@resize-bar.html
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@i915_module_load@resize-bar.html
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@i915_module_load@resize-bar.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          ([SKIP][867], [SKIP][868]) ([i915#5723]) -> [SKIP][869] ([i915#14544] / [i915#5723])
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@i915_query@test-query-geometry-subslices.html
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][870] ([i915#1769] / [i915#3555]) -> [SKIP][871] ([i915#14544] / [i915#1769] / [i915#3555])
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][872] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][873] ([i915#4538] / [i915#5286])
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          ([SKIP][874], [SKIP][875]) ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][876] ([i915#4538] / [i915#5286]) +1 other test skip
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-rkl:          ([SKIP][877], [SKIP][878]) ([i915#4538] / [i915#5286]) -> [SKIP][879] ([i915#14544] / [i915#4538] / [i915#5286])
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          ([SKIP][880], [SKIP][881]) ([i915#3828]) -> [SKIP][882] ([i915#14544] / [i915#3828])
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          ([SKIP][883], [SKIP][884]) ([i915#14544] / [i915#3828]) -> [SKIP][885] ([i915#3828])
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][886] ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][887] ([i915#17431] / [i915#3638])
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          ([SKIP][888], [SKIP][889]) ([i915#17431] / [i915#3638]) -> [SKIP][890] ([i915#14544] / [i915#17431] / [i915#3638]) +1 other test skip
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][891] ([i915#17431] / [i915#3638]) -> [SKIP][892] ([i915#14544] / [i915#17431] / [i915#3638])
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          ([SKIP][893], [SKIP][894]) ([i915#14544] / [i915#4538]) -> [SKIP][895] ([i915#4538]) +5 other tests skip
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-rkl:          ([SKIP][896], [SKIP][897]) ([i915#4538]) -> [SKIP][898] ([i915#14544] / [i915#4538])
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][899] ([i915#4538]) -> [SKIP][900] ([i915#14544] / [i915#4538])
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][901] ([i915#14544] / [i915#4538]) -> [SKIP][902] ([i915#4538])
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-rkl:          ([SKIP][903], [SKIP][904]) ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][905] ([i915#14098] / [i915#6095]) +9 other tests skip
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [904]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [905]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-rkl:          [SKIP][906] ([i915#14098] / [i915#6095]) -> [SKIP][907] ([i915#14098] / [i915#14544] / [i915#6095]) +5 other tests skip
   [906]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [907]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][908] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][909] ([i915#14098] / [i915#6095]) +6 other tests skip
   [908]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html
   [909]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][910] ([i915#14544] / [i915#6095]) -> [SKIP][911] ([i915#6095]) +11 other tests skip
   [910]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [911]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
    - shard-rkl:          ([SKIP][912], [SKIP][913]) ([i915#14098] / [i915#6095]) -> [SKIP][914] ([i915#14098] / [i915#14544] / [i915#6095]) +3 other tests skip
   [912]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [913]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html
   [914]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][915] ([i915#17158]) -> [INCOMPLETE][916] ([i915#15582]) +3 other tests incomplete
   [915]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html
   [916]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          ([SKIP][917], [SKIP][918]) ([i915#12313] / [i915#14544]) -> [SKIP][919] ([i915#12313]) +2 other tests skip
   [917]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [918]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [919]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][920] ([i915#6095]) -> [SKIP][921] ([i915#14544] / [i915#6095]) +7 other tests skip
   [920]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [921]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-rkl:          ([SKIP][922], [SKIP][923]) ([i915#14544] / [i915#17427]) -> [SKIP][924] ([i915#17427]) +1 other test skip
   [922]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_chamelium_color@ctm-green-to-red.html
   [923]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_chamelium_color@ctm-green-to-red.html
   [924]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-rkl:          ([SKIP][925], [SKIP][926]) ([i915#17427]) -> [SKIP][927] ([i915#14544] / [i915#17427])
   [925]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_chamelium_color@ctm-red-to-blue.html
   [926]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_chamelium_color@ctm-red-to-blue.html
   [927]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:
    - shard-rkl:          [SKIP][928] ([i915#14544] / [i915#17427]) -> [SKIP][929] ([i915#17427])
   [928]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html
   [929]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-rkl:          [SKIP][930] ([i915#16471] / [i915#17427]) -> [SKIP][931] ([i915#14544] / [i915#16471] / [i915#17427])
   [930]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d.html
   [931]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-rkl:          [SKIP][932] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][933] ([i915#11151] / [i915#7828]) +1 other test skip
   [932]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [933]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-rkl:          [SKIP][934] ([i915#11151] / [i915#7828]) -> [SKIP][935] ([i915#11151] / [i915#14544] / [i915#7828])
   [934]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [935]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-rkl:          ([SKIP][936], [SKIP][937]) ([i915#11151] / [i915#7828]) -> [SKIP][938] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [936]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [937]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [938]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          ([SKIP][939], [SKIP][940]) ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][941] ([i915#11151] / [i915#7828]) +4 other tests skip
   [939]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [940]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [941]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-rkl:          ([SKIP][942], [SKIP][943]) ([i915#14544] / [i915#15865]) -> [SKIP][944] ([i915#15865])
   [942]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_content_protection@atomic-hdcp14.html
   [943]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_content_protection@atomic-hdcp14.html
   [944]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          ([SKIP][945], [SKIP][946]) ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][947] ([i915#15330] / [i915#3116])
   [945]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [946]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [947]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-rkl:          [SKIP][948] ([i915#15330]) -> [SKIP][949] ([i915#14544] / [i915#15330])
   [948]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [949]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          [SKIP][950] ([i915#15330] / [i915#3116]) -> [SKIP][951] ([i915#14544] / [i915#15330] / [i915#3116])
   [950]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html
   [951]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          ([SKIP][952], [SKIP][953]) ([i915#14544] / [i915#3555]) -> [SKIP][954] ([i915#3555]) +7 other tests skip
   [952]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [953]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [954]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          [SKIP][955] ([i915#14544] / [i915#3555]) -> [SKIP][956] ([i915#3555]) +1 other test skip
   [955]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [956]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          ([SKIP][957], [SKIP][958]) ([i915#14544] / [i915#17428]) -> [SKIP][959] ([i915#17428]) +40 other tests skip
   [957]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [958]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [959]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          ([SKIP][960], [SKIP][961]) ([i915#14544] / [i915#9723]) -> [SKIP][962] ([i915#9723]) +1 other test skip
   [960]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [961]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [962]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          [SKIP][963] ([i915#17289]) -> [SKIP][964] ([i915#14544] / [i915#17289])
   [963]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-mst.html
   [964]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-rkl:          ([SKIP][965], [SKIP][966]) ([i915#14544] / [i915#17291]) -> [SKIP][967] ([i915#17291])
   [965]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
   [966]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
   [967]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-rkl:          [SKIP][968] ([i915#14544] / [i915#17290]) -> [SKIP][969] ([i915#17290])
   [968]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
   [969]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-rkl:          ([SKIP][970], [SKIP][971]) ([i915#14544] / [i915#16361]) -> [SKIP][972] ([i915#16361]) +1 other test skip
   [970]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [971]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [972]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          ([SKIP][973], [SKIP][974]) ([i915#14544] / [i915#16081]) -> [SKIP][975] ([i915#16081])
   [973]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_feature_discovery@display-3x.html
   [974]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_feature_discovery@display-3x.html
   [975]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          ([SKIP][976], [SKIP][977]) ([i915#14544] / [i915#16599]) -> [SKIP][978] ([i915#16599])
   [976]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html
   [977]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_feature_discovery@dp-mst.html
   [978]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-rkl:          ([SKIP][979], [SKIP][980]) ([i915#16600]) -> [SKIP][981] ([i915#14544] / [i915#16600])
   [979]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_feature_discovery@dsc.html
   [980]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_feature_discovery@dsc.html
   [981]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-rkl:          ([SKIP][982], [SKIP][983]) ([i915#14544] / [i915#9934]) -> [SKIP][984] ([i915#9934]) +5 other tests skip
   [982]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_flip@2x-blocking-wf_vblank.html
   [983]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html
   [984]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          [SKIP][985] ([i915#9934]) -> [SKIP][986] ([i915#14544] / [i915#9934])
   [985]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [986]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          ([SKIP][987], [SKIP][988]) ([i915#9934]) -> [SKIP][989] ([i915#14544] / [i915#9934]) +2 other tests skip
   [987]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [988]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [989]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          ([INCOMPLETE][990], [INCOMPLETE][991]) ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][992] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [990]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html
   [991]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk6/igt@kms_flip@2x-flip-vs-suspend.html
   [992]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][993] ([i915#14544] / [i915#15643]) -> [SKIP][994] ([i915#15643])
   [993]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [994]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          ([SKIP][995], [SKIP][996]) ([i915#14544] / [i915#15643]) -> [SKIP][997] ([i915#15643]) +5 other tests skip
   [995]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [996]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [997]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-rkl:          [SKIP][998] ([i915#14544] / [i915#17428]) -> [SKIP][999] ([i915#17428]) +12 other tests skip
   [998]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html
   [999]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-rkl:          ([SKIP][1000], [SKIP][1001]) ([i915#14544] / [i915#5439]) -> [SKIP][1002] ([i915#5439]) +1 other test skip
   [1000]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
   [1001]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
   [1002]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][1003] ([i915#15102]) -> [SKIP][1004] ([i915#14544] / [i915#15102]) +9 other tests skip
   [1003]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html
   [1004]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          ([SKIP][1005], [SKIP][1006]) ([i915#14544] / [i915#15102]) -> [SKIP][1007] ([i915#15102]) +21 other tests skip
   [1005]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [1006]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [1007]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][1008] ([i915#14544] / [i915#15102]) -> [SKIP][1009] ([i915#15102]) +3 other tests skip
   [1008]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html
   [1009]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          ([SKIP][1010], [SKIP][1011]) ([i915#17428] / [i915#1825]) -> [SKIP][1012] ([i915#14544] / [i915#17428] / [i915#1825]) +2 other tests skip
   [1010]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [1011]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [1012]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-move:
    - shard-rkl:          ([SKIP][1013], [SKIP][1014]) ([i915#15102]) -> [SKIP][1015] ([i915#14544] / [i915#15102]) +16 other tests skip
   [1013]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-move.html
   [1014]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-move.html
   [1015]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          ([SKIP][1016], [SKIP][1017]) ([i915#17428]) -> [SKIP][1018] ([i915#14544] / [i915#17428]) +26 other tests skip
   [1016]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html
   [1017]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html
   [1018]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          [SKIP][1019] ([i915#5439]) -> [SKIP][1020] ([i915#14544] / [i915#5439])
   [1019]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
   [1020]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          ([SKIP][1021], [PASS][1022]) ([i915#15989]) -> [SKIP][1023] ([i915#15989]) +12 other tests skip
   [1021]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [1022]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [1023]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-msflip-blt:
    - shard-glk:          ([SKIP][1024], [PASS][1025]) ([i915#17517]) -> [SKIP][1026] ([i915#17517]) +9 other tests skip
   [1024]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-msflip-blt.html
   [1025]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-msflip-blt.html
   [1026]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-rkl:          ([SKIP][1027], [SKIP][1028]) ([i915#15989]) -> [INCOMPLETE][1029] ([i915#16056])
   [1027]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [1028]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [1029]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          ([SKIP][1030], [SKIP][1031]) ([i915#14544] / [i915#9766]) -> [SKIP][1032] ([i915#9766])
   [1030]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [1031]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [1032]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          ([SKIP][1033], [SKIP][1034]) ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][1035] ([i915#17428] / [i915#1825])
   [1033]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [1034]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [1035]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-rkl:          [SKIP][1036] ([i915#17428]) -> [SKIP][1037] ([i915#14544] / [i915#17428]) +13 other tests skip
   [1036]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
   [1037]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         ([SKIP][1038], [SKIP][1039]) ([i915#1187] / [i915#12713] / [i915#16490]) -> [SKIP][1040] ([i915#12713] / [i915#16490])
   [1038]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [1039]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html
   [1040]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          ([SKIP][1041], [SKIP][1042]) ([i915#1187] / [i915#12713] / [i915#16644]) -> [SKIP][1043] ([i915#12713] / [i915#16644])
   [1041]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html
   [1042]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html
   [1043]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          ([SKIP][1044], [PASS][1045]) ([i915#16644] / [i915#3555] / [i915#8228]) -> [SKIP][1046] ([i915#16644] / [i915#3555] / [i915#8228])
   [1044]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_hdr@invalid-metadata-sizes.html
   [1045]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html
   [1046]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          [SKIP][1047] ([i915#15460]) -> [SKIP][1048] ([i915#14544] / [i915#15460])
   [1047]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_joiner@invalid-modeset-big-joiner.html
   [1048]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          ([SKIP][1049], [SKIP][1050]) ([i915#14544] / [i915#6301]) -> [SKIP][1051] ([i915#6301])
   [1049]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_panel_fitting@legacy.html
   [1050]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_panel_fitting@legacy.html
   [1051]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-rkl:          [SKIP][1052] ([i915#17455]) -> [SKIP][1053] ([i915#14544] / [i915#17455])
   [1052]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
   [1053]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-rkl:          ([SKIP][1054], [SKIP][1055]) ([i915#14544] / [i915#15709]) -> [SKIP][1056] ([i915#15709]) +1 other test skip
   [1054]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html
   [1055]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html
   [1056]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-rkl:          ([SKIP][1057], [SKIP][1058]) ([i915#15709]) -> [SKIP][1059] ([i915#14544] / [i915#15709]) +2 other tests skip
   [1057]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
   [1058]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
   [1059]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][1060] ([i915#14544] / [i915#15709]) -> [SKIP][1061] ([i915#15709])
   [1060]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
   [1061]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          ([SKIP][1062], [SKIP][1063]) ([i915#13958]) -> [SKIP][1064] ([i915#13958] / [i915#14544])
   [1062]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-y.html
   [1063]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-y.html
   [1064]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:
    - shard-rkl:          ([SKIP][1065], [SKIP][1066]) ([i915#14544] / [i915#17832]) -> [SKIP][1067] ([i915#17832])
   [1065]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html
   [1066]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html
   [1067]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][1068] ([i915#15739]) -> [SKIP][1069] ([i915#14544] / [i915#15739])
   [1068]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_pm_dc@dc9-dpms.html
   [1069]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][1070] ([i915#9340]) -> [SKIP][1071] ([i915#3828])
   [1070]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html
   [1071]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          ([SKIP][1072], [SKIP][1073]) ([i915#14544] / [i915#8430]) -> [SKIP][1074] ([i915#8430])
   [1072]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html
   [1073]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_pm_lpsp@screens-disabled.html
   [1074]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          ([PASS][1075], [SKIP][1076]) ([i915#15073]) -> [SKIP][1077] ([i915#15073])
   [1075]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [1076]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [1077]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-rkl:          ([SKIP][1078], [SKIP][1079]) ([i915#17434] / [i915#17450]) -> [SKIP][1080] ([i915#14544] / [i915#17434] / [i915#17450])
   [1078]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_pm_rpm@modeset-pc8-residency-stress.html
   [1079]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_pm_rpm@modeset-pc8-residency-stress.html
   [1080]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          ([SKIP][1081], [SKIP][1082]) ([i915#6524]) -> [SKIP][1083] ([i915#14544] / [i915#6524])
   [1081]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html
   [1082]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_prime@basic-crc-hybrid.html
   [1083]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][1084] ([i915#11520]) -> [SKIP][1085] ([i915#11520] / [i915#14544])
   [1084]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [1085]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-rkl:          ([SKIP][1086], [SKIP][1087]) ([i915#11520] / [i915#14544]) -> [SKIP][1088] ([i915#11520]) +3 other tests skip
   [1086]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [1087]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [1088]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          ([SKIP][1089], [SKIP][1090]) ([i915#11520]) -> [SKIP][1091] ([i915#11520] / [i915#14544]) +1 other test skip
   [1089]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [1090]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [1091]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          [SKIP][1092] ([i915#9683]) -> [SKIP][1093] ([i915#14544] / [i915#9683])
   [1092]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_psr2_su@page_flip-xrgb8888.html
   [1093]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-rkl:          [SKIP][1094] ([i915#1072] / [i915#9732]) -> [SKIP][1095] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [1094]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_psr@fbc-psr-dpms.html
   [1095]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          ([SKIP][1096], [SKIP][1097]) ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][1098] ([i915#1072] / [i915#9732]) +12 other tests skip
   [1096]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_psr@fbc-psr2-primary-blt.html
   [1097]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html
   [1098]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-primary-blt:
    - shard-rkl:          [SKIP][1099] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][1100] ([i915#1072] / [i915#9732])
   [1099]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_psr@pr-primary-blt.html
   [1100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr-no-drrs:
    - shard-rkl:          ([SKIP][1101], [SKIP][1102]) ([i915#1072] / [i915#9732]) -> [SKIP][1103] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [1101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_psr@psr-no-drrs.html
   [1102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_psr@psr-no-drrs.html
   [1103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr@psr-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          ([SKIP][1104], [SKIP][1105]) ([i915#15949]) -> [SKIP][1106] ([i915#14544] / [i915#15949])
   [1104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [1105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [1106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-rkl:          [SKIP][1107] ([i915#15949]) -> [SKIP][1108] ([i915#14544] / [i915#15949])
   [1107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [1108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-glk:          ([ABORT][1109], [DMESG-FAIL][1110]) ([i915#13179]) -> [ABORT][1111] ([i915#13179])
   [1109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html
   [1110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html
   [1111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-rkl:          ([SKIP][1112], [SKIP][1113]) ([i915#17445]) -> [SKIP][1114] ([i915#14544] / [i915#17445])
   [1112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_tv_load_detect@load-detect.html
   [1113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_tv_load_detect@load-detect.html
   [1114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-rkl:          ([SKIP][1115], [SKIP][1116]) ([i915#15243] / [i915#3555]) -> [SKIP][1117] ([i915#14544] / [i915#15243] / [i915#3555])
   [1115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_vrr@flipline.html
   [1116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_vrr@flipline.html
   [1117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          [SKIP][1118] ([i915#14544] / [i915#9906]) -> [SKIP][1119] ([i915#9906])
   [1118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
   [1119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          ([SKIP][1120], [SKIP][1121]) ([i915#14544] / [i915#2436]) -> [SKIP][1122] ([i915#2436])
   [1120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [1121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [1122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         ([PASS][1123], [FAIL][1124]) ([i915#4349]) -> [FAIL][1125] ([i915#4349]) +1 other test fail
   [1123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@perf_pmu@busy-double-start.html
   [1124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@perf_pmu@busy-double-start.html
   [1125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@perf_pmu@busy-double-start.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][1126] ([i915#17448] / [i915#3291] / [i915#3708]) -> [SKIP][1127] ([i915#14544] / [i915#17448] / [i915#3291] / [i915#3708])
   [1126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@prime_vgem@basic-write.html
   [1127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          [SKIP][1128] ([i915#17448] / [i915#3708]) -> [SKIP][1129] ([i915#14544] / [i915#17448] / [i915#3708])
   [1128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@prime_vgem@fence-flip-hang.html
   [1129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          [SKIP][1130] ([i915#14544] / [i915#17448] / [i915#3708]) -> [SKIP][1131] ([i915#17448] / [i915#3708])
   [1130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@prime_vgem@fence-write-hang.html
   [1131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@prime_vgem@fence-write-hang.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12935]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12935
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15751]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15751
  [i915#15804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
  [i915#15840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16226
  [i915#16229]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16696
  [i915#16772]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16772
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16870]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870
  [i915#16871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16943
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#16996]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16996
  [i915#17032]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17032
  [i915#17037]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17037
  [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17103
  [i915#17104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17104
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17146]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146
  [i915#17147]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17147
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17157]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17157
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17160]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17160
  [i915#17173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17173
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
  [i915#17209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17209
  [i915#17214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17214
  [i915#17217]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17217
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291
  [i915#17297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17297
  [i915#17327]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327
  [i915#17342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17342
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433
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
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17461]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17461
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17465
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
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
  [i915#17495]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17495
  [i915#17496]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496
  [i915#17497]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497
  [i915#17498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498
  [i915#17499]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499
  [i915#17500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500
  [i915#17502]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502
  [i915#17503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
  [i915#17504]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504
  [i915#17505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17509]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17512]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512
  [i915#17513]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17513
  [i915#17516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17519
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17523]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
  [i915#17527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17535]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17535
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17543]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543
  [i915#17545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17545
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17548
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
  [i915#17554]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554
  [i915#17555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555
  [i915#17557]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17557
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17560]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17560
  [i915#17562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
  [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17568]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568
  [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
  [i915#17571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17571
  [i915#17576]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576
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
  [i915#17613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17613
  [i915#17614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17614
  [i915#17615]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17615
  [i915#17617]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17617
  [i915#17621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17621
  [i915#17628]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17628
  [i915#17632]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17632
  [i915#17635]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17635
  [i915#17637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17637
  [i915#17645]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17645
  [i915#17646]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17646
  [i915#17651]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17651
  [i915#17655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17655
  [i915#17659]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17659
  [i915#17666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17666
  [i915#17670]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17670
  [i915#17674]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17674
  [i915#17675]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17675
  [i915#17678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17678
  [i915#17680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17680
  [i915#17685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17685
  [i915#17686]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17686
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17696
  [i915#17697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17697
  [i915#17711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17711
  [i915#17712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17712
  [i915#17752]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752
  [i915#17785]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17785
  [i915#17832]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832
  [i915#17833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17833
  [i915#17843]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843
  [i915#17844]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844
  [i915#17879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17879
  [i915#17880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17880
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
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
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9198 -> IGTPW_16180
  * Linux: CI_DRM_19561 -> CI_DRM_19563

  CI-20190529: 20190529
  CI_DRM_19561: 7f983558aaf724daeafb5904dbb078835857b51e @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19563: 2bdca9b1f8638ef27955d61c149bc6fac856d291 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16180: 16180
  IGT_9198: 9198

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/index.html

--===============0500980475893320135==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,01/11] tests/=
amdgpu: Add SLTH validation tests for trap handling and trap return.</td></=
tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/179011/">https://patchwork.freedesktop.org/series/179011/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16180/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16180/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9198_full -&gt; IGTPW_16180_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16180_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_16180_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/index=
.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1618=
0_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-1/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/ig=
t@gem_softpin@noreloc-s3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_plane_scaling@plane-downscale=
-max-crc-x-tiled.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16180_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@api_intel_bb@crc32.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576"=
>i915#17576</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@api_intel_bb@crc32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230"=
>i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@delta-check:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@api_intel_bb@delta-check.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7645">i915#17645</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@api_intel_bb@render-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
685">i915#17685</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@dma-buf-fence-chain:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@dmabuf@dma-buf-fence-chain.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17712">i915#17712</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_basic@multigpu-create-close.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17675">i915#17675</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk9/igt@gem_basic@multigpu-create-close.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17697">i915#17697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_ccs@block-copy-compressed.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@gem_ccs@block-multicopy-inplace.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
99">i915#17499</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
99">i915#17499</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_close_race@multigpu-basic-proc=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17568">i915#17568</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@gem_close_race@multigpu-basic-pro=
cess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@gem_close_race@multigpu-basic-pr=
ocess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@gem_create@create-ext-cpu-access-=
big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17513">i915#17513</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_ctx_engines@independent.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17670">i915#17670</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-gl=
k3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk6/igt@gem=
_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466">i9=
15#16466</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-invalid-size:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_ctx_param@set-priority-invalid=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17646">i915#17646</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_ctx_param@set-priority-not-su=
pported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17535">i915#17535</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-cl=
ose.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hos=
tile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@gem_ctx_persistence@heartbeat-host=
ile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17621">i915#17621</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-ho=
stile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk8/igt@gem_ctx_persistence@legacy-engines=
-hang@blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17527">i915#17527</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_ctx_persistence@legacy-engines=
-queued.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1099">i915#1099</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-in-order:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_ctx_shared@q-in-order.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17342">i915#17342</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_ctx_sseu@invalid-args.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@gem_ctx_sseu@invalid-args.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17496">i915#17496</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@gem_eio@in-flight-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@gem_exec_balancer@bonded-false-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4812">i915#4812</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gem_exec_balancer@bonded-false-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@gem_exec_balancer@parallel.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17587">i915#17587</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_exec_balancer@parallel-keep-s=
ubmit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-10/igt@gem_exec_balancer@parallel-orde=
ring.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@gem_exec_balancer@parallel-out-fen=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17547">i915#17547</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_exec_capture@capture-invisibl=
e@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@gem_exec_capture@capture-invisib=
le@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@gem_exec_capture@capture-invisible=
@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@gem_exec_capture@capture-invisib=
le@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@gem_exec_capture@capture-recoverab=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17711">i915#17711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@gem_exec_capture@capture@vecs0-lm=
em0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16904">i915#16904</a>) +4 other tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@gem_exec_capture@capture@vecs0-l=
mem0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16904">i915#16904</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_exec_endless@dispatch@bcs0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17571">i915#17571</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_exec_fence@submit3.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/175=
99">i915#17599</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@gem_exec_fence@submit3.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@gem_exec_flush@basic-wb-prw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@gem_exec_flush@basic-wb-prw-defa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@invalid-bsd1-flag-on-vebox:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_exec_params@invalid-bsd1-flag-=
on-vebox.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17659">i915#17659</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_exec_params@rsvd2-dirt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17453">i915#17453</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5107">i915#5107</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gem_exec_params@rsvd2-dirt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17453">i915#17453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_exec_params@secure-non-master=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17416">i915#17416</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gem_exec_params@secure-non-maste=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17416">i915#17416</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_exec_params@secure-non-master.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17523">i915#17523</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@gem_exec_params@secure-non-maste=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17416">i915#17416</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@gem_exec_params@secure-non-master.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17523">i915#17523</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gem_exec_reloc@basic-cpu-gtt-nor=
eloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-read.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@gem_exec_reloc@basic-write-read-=
noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_exec_schedule@preempt-user.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17590">i915#17590</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@gem_exec_schedule@reorder-wide.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@gem_exec_suspend@basic-s0.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@gem_exec_suspend@basic-s4-devices=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17844">i915#17844</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7975">i915#7975</a>) +1 other test abort</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@gem_exec_suspend@basic-s4-device=
s.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17844">i915#17844</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7975">i915#7975</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_exec_whisper@basic-contexts-pr=
iority-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17628">i915#17628</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_exec_whisper@basic-queues.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17655">i915#17655</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-f=
ences-busy-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</l=
i>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-=
fences-busy-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@gem_gpgpu_fill@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@gem_gpgpu_fill@basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17608=
">i915#17608</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_lmem_evict@dontneed-evict-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_lmem_evict@dontneed-evict-race=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17605">i915#17605</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@gem_lmem_swapping@massive-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17503">i915#17503</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_lmem_swapping@random.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_lmem_swapping@verify.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17503">i915#17503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12193">i915#12193</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_lmem_swapping@verify-random-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17503">i915#17503</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-9/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@gem_lmem_swapping@verify-random-=
ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4565">i915#4565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@gem_media_fill@media-fill.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@gem_media_vme.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#2=
84</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@gem_media_vme.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#=
284</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk4/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543">i915#=
17543</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_mmap@big-bo.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i91=
5#4083</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@gem_mmap@big-bo.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i9=
15#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@gem_mmap_gtt@cpuset-big-copy-odd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-user:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@gem_mmap_gtt@hang-user.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@gem_mmap_wc@write-gtt-read-wc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@gem_partial_pwrite_pread@reads-d=
isplay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@gem_ppgtt@flink-and-close-vma-leak=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17635">i915#17635</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@shrink-vs-evict-pinned:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_ppgtt@shrink-vs-evict-pinned.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17615">i915#17615</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_pxp@display-protected-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4270">i915#4270</a>) +5 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gem_pxp@display-protected-crc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17521">i915#17521</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gem_pxp@display-protected-crc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@gem_pxp@protected-encrypted-src-co=
py-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17521">i915#17521</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@gem_pxp@reject-modify-context-pro=
tection-off-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17521">i915#17521</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_pxp@verify-pxp-stale-buf-exec=
ution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17521">i915#17521</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@gem_readwrite@read-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@gem_readwrite@read-write.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@gem_render_copy@y-tiled-ccs-to-x-t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17591">i915#17591</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk8/igt@gem_render_copy@y-tiled-ccs-to-yf-=
tiled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17492">i915#17492</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-yf=
-tiled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@gem_render_copy@y-tiled-mc-ccs-to=
-vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@gem_render_copy@y-tiled-mc-ccs-t=
o-vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@gem_render_copy@y-tiled-to-vebox-x=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17492">i915#17492</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-=
yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17492">i915#17492</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@gem_render_tiled_blits@basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@gem_softpin@allocator-basic-reserv=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17471">i915#17471</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@gem_softpin@evict-snoop.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
551">i915#17551</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@gem_softpin@evict-snoop-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@=
gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16226">i915#16226</a>)=
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@gem_tiled_pread_basic@basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@gem_unfence_active_buffers.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gem_userptr_blits@coherency-sync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_userptr_blits@coherency-sync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16871">i915#16871</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@gem_userptr_blits@invalid-mmap-of=
fset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk2/igt@gem_userptr_blits@readonly-pwrite-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17507">i915#17507</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@gem_userptr_blits@relocations.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@gem_userptr_blits@unsync-overlap=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@gem_userptr_blits@unsync-overlap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17507">i915#17507</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@execbuf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@gem_vm_create@execbuf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1759=
6">i915#17596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@gem_workarounds@suspend-resume-context.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-r=
kl-3/igt@gem_workarounds@suspend-resume-context.html">PASS</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@=
gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17880"=
>i915#17880</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@gen3_mixed_blits.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i=
915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@gen3_render_linear_blits.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17555">i915#17555</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@gen7_exec_parse@basic-allocation=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gen7_exec_parse@basic-rejected.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17455">i915#17455</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@gen7_exec_parse@basic-rejected.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17455">i915#17455</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gen7_exec_parse@basic-rejected.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17505">i915#17505</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-9/igt@gen7_exec_parse@load-register-re=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17455">i915#17455</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk4/igt@gen7_exec_parse@load-register-reg.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17505">i915#17505</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@gen9_exec_parse@bb-secure.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17597">i915#17597</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-2/igt@gen9_exec_parse@bb-start-cmd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@gen9_exec_parse@secure-batches.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2856">i915#2856</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@gen9_exec_parse@secure-batches.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@i915_drm_fdinfo@all-busy-idle-che=
ck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14123">i915#14123</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@i915_drm_fdinfo@all-busy-idle-ch=
eck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@i915_drm_fdinfo@busy@rcs0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14073">i915#14073</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@i915_drm_fdinfo@busy@rcs0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@i915_drm_fdinfo@busy@vecs1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-active:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@i915_drm_fdinfo@memory-info-active=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17603">i915#17603</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@i915_fb_tiling@basic-x-tiling.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@i915_hangman@engine-engine-hang.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17610">i915#17610</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@i915_pm_freq_api@freq-reset-multi=
ple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17526">i915#17526</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@i915_pm_freq_mult@media-freq@gt0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accurac=
y.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12964">i915#12964</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15172">i915#15172</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@i915_pm_rps@basic-api.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6621">i915#6621</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@i915_pm_rps@min-max-config-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6621">i915#6621</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-7/igt@i915_pm_rps@reset.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@i915_pm_rp=
s@reset.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16180/shard-mtlp-4/igt@i915_pm_rps@reset.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365">i915#1=
5365</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@i915_pm_rps@thresholds.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@i915_pm_rps@thresholds.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1681">i915#11681</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@i915_pm_rps@thresholds-park.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@i915_power@sanity.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i=
915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@i915_query@hwconfig_table.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6245">i915#6245</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk4/igt@i915_query@hwconfig_table.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17584">i915#17584</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk2/igt@i915_suspend@debugfs-reader.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-tglu-4/igt@i915_suspend@fence-restore-tiled2untiled.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shar=
d-tglu-7/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu=
-2/igt@i915_suspend@fence-restore-tiled2untiled.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#15840<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk8/igt@intel_hwmon@hwmon-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
680">i915#11680</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@intel_hwmon@hwmon-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
674">i915#17674</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-=
mismatch-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_addfb_basic@addfb25-y-tiled-s=
mall-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_addfb_basic@clobberred-modifi=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4212">i915#4212</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_addfb_basic@clobberred-modif=
ier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_async_flips@async-flip-suspe=
nd-resume@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17150">i915#17150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_async_flips@async-flip-suspe=
nd-resume@pipe-d-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17037">i915#17037</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_async_flips@async-flip-with-pa=
ge-flip-events-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_async_flips@async-flip-with-p=
age-flip-events-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_async_flips@invalid-async-flip=
-atomic@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17614">i915#17614</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_async_flips@invalid-async-flip=
-atomic@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17613">i915#17613</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>) +1 ot=
her test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_atomic_transition@plane-all-m=
odeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transiti=
on@pipe-a-hdmi-a-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_atomic_transition@plane-all-modese=
t-transition@pipe-a-hdmi-a-1.html">PASS</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_atomic_transiti=
on@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662">i915#15662</=
a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_big_fb@4-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_big_fb@4-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_big_fb@4-tiled-addfb-size-off=
set-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17557">i915#17557</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_big_fb@4-tiled-addfb-size-offs=
et-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17557">i915#17557</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_big_fb@linear-16bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17500">i915#17500</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_big_fb@linear-32bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17500">i915#17500</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@kms_big_fb@linear-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_big_fb@linear-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-5/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_big_fb@linear-max-hw-stride-6=
4bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_big_fb@linear-max-hw-stride-6=
4bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_big_fb@linear-max-hw-stride-64=
bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_big_fb@linear-max-hw-stride-64=
bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk2/igt@kms_big_fb@y-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>=
) +15 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_big_fb@y-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +18 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17478">i915#17478</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17432">i915#17432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_ccs@bad-pixel-format-4-tiled-d=
g2-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +79 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_ccs@bad-pixel-format-4-tiled-m=
tl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +2=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-=
ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_ccs@bad-rotation-90-4-tiled-ln=
l-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17525">i915#17525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_ccs@bad-rotation-90-y-tiled-g=
en12-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) =
+11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_ccs@crc-primary-basic-4-tiled-=
dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17594">i915#17594</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled=
-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)=
 +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled=
-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:=
</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +29 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-9/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@p=
ipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16180/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-=
mtl-mc-ccs@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +110 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +55 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +111 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:<=
/p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_ccs@missing-ccs-buffer-y-tile=
d-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#174=
91</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_ccs@random-ccs-data-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +35 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +19 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_cdclk@mode-rejected-max-dotcl=
ock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17099">i915#17099</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_cdclk@mode-rejected-max-dotclo=
ck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17550">i915#17550</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_cdclk@mode-rejected-max-dotcl=
ock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17550">i915#17550</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_cdclk@mode-transition-all-outp=
uts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17550">i915#17550</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_cdclk@mode-transition-all-out=
puts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16017">i915#16017</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_chamelium_audio@dp-audio-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_chamelium_audio@hdmi-audio-edi=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17483">i915#17483</a>) +7 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-10/igt@kms_chamelium_audio@hdmi-audio-=
edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_chamelium_color@ctm-0-50.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@kms_chamelium_color@ctm-blue-to-=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_chamelium_color@ctm-negative.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17427">i915#17427</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +4 othe=
r tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lu=
t1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test s=
kip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-10/igt@kms_chamelium_color_pipeline@pl=
ane-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lu=
t1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 othe=
r tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-3/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17497">i915#17497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_chamelium_edid@dp-edid-stress=
-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_chamelium_edid@dp-mode-timing=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_chamelium_frames@dp-crc-multi=
ple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17483">i915#17483</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-multi=
ple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_chamelium_hpd@dp-hpd-after-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17483">i915#17483</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-storm-di=
sable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17483">i915#17483</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_color_pipeline@plane-fixed-ma=
trix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_color_pipeline@plane-fixed-mat=
rix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_color_pipeline@plane-lut1d.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17510">i915#17510</a>) +5 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_color_pipeline@plane-lut1d.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-ct=
m3x4@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_color_pipeline@plane-lut1d-c=
tm3x4@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-1/igt@kms_content_protection@atomic-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_content_protection@dp-mst-typ=
e-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_content_protection@dp-mst-ty=
pe-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_content_protection@dp-mst-typ=
e-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17502">i915#17502</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17502">i915#17502</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17502">i915#17502</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_content_protection@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17508">i915#17508</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_content_protection@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17508">i915#17508</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-5/igt@kms_content_protection@mei-interf=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-9/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15865">i915#15865</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_content_protection@srm.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17508">i915#17508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_cursor_crc@cursor-offscreen-12=
8x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17504">i915#17504</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8814">i915#8814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rk=
l-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@km=
s_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other=
 test fail</li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-t=
glu-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-7/ig=
t@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 o=
ther test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/=
shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#=
13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi=
-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16180/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a=
-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_cursor_crc@cursor-onscreen-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17533">i915#17533</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_cursor_crc@cursor-random-32x1=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_cursor_crc@cursor-random-32x3=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_cursor_crc@cursor-random-512x1=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17533">i915#17533</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_cursor_crc@cursor-random-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movem=
ent-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_cursor_crc@cursor-sliding-32x3=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_cursor_crc@cursor-sliding-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_cursor_crc@cursor-suspend.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15840">i915#15840</a>) +13 other tests abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_cursor_crc@cursor-suspend.html=
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
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_cursor_crc@cursor-suspend@pipe=
-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#141=
52</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_cursor_legacy@cursora-vs-fli=
pb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +1 other tes=
t skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@kms_cursor_legacy@cursora-vs-fli=
pb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flip=
a-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-5/igt@kms_display_modes@extended-mode-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13691">i915#13691</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_display_modes@extended-mode-=
basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17487">i915#17487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17486">i915#17486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_dither@fb-8bpc-vs-panel-8bpc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17486">i915#17486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17289">i915#17289</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_dp_link_training@non-uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17560">i915#17560</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_dp_link_training@non-uhbr-mst-=
direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17519">i915#17519</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_dp_link_training@non-uhbr-mst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-mst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_dp_link_training@non-uhbr-mst-=
direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17519">i915#17519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_dp_link_training@uhbr-mst-dire=
ct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_dp_link_training@uhbr-mst-tbt=
alt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_dp_link_training@uhbr-mst-tb=
talt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_dp_link_training@uhbr-mst-tbta=
lt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-15/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_dp_link_training@uhbr-sst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17477">i915#17477</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_dp_link_training@uhbr-sst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_dp_link_training@uhbr-sst-di=
rect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17297">i915#17297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_dp_link_training@uhbr-sst-dir=
ect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_dp_link_training@uhbr-sst-di=
rect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst-tbt=
alt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_dp_linktrain_fallback@dsc-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17680">i915#17680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_dp_linktrain_fallback@uhbr-to-=
hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17548">i915#17548</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_dp_linktrain_fallback@uhbr-to=
-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16867">i915#16867</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_dp_linktrain_fallback@uhbr-to-=
hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17548">i915#17548</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16867">i915#16867</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16867">i915#16867</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16870">i915#16870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-gtt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_dsc@dsc-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">=
i915#16361</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_dsc@dsc-basic-ultrajoiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16361">i915#16361</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_dsc@dsc-basic-ultrajoiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_dsc@dsc-fractional-bpp-bigjoin=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17458">i915#17458</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_dsc@dsc-fractional-bpp-bigjo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_dsc@dsc-fractional-bpp-with-b=
pc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17458">i915#17458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_dsc@dsc-with-bpc-formats-ultra=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17458">i915#17458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-b=
igjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_dsc@dsc-with-output-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">=
i915#16680</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_fbcon_fbt@psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680"=
>i915#16680</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516">i=
915#17516</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_feature_discovery@chamelium.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17581">i915#17581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk2/igt@kms_feature_discovery@display-4x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17666">i915#17666</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_feature_discovery@dsc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17539">i915#17539</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_feature_discovery@dsc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_feature_discovery@hdr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17539">i915#17539</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_feature_discovery@hdr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16600">i915#16600</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_feature_discovery@hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_feature_discovery@hdr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17539">i915#17539</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_feature_discovery@psr2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17585">i915#17585</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-10/igt@kms_feature_discovery@psr2.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/658">i915#658</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_feature_discovery@psr2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17585">i915#17585</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_feature_discovery@psr2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_feature_discovery@psr2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@kms_flip@2x-dpms-vs-vblank-race-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-=
modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_flip@2x-modeset-vs-vblank-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-15/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_flip@2x-single-buffer-flip-vs=
-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdm=
i-a1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_9198/shard-rkl-2/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a1=
.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16180/shard-rkl-2/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hd=
mi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10826">i915#10826</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_flip@flip-vs-fences.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_flip@flip-vs-fences-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8381">i915#8381</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_flip@flip-vs-fences-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-7/igt@kms_flip@flip-vs-suspend-interruptible.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-=
mtlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-8/i=
gt@kms_flip@flip-vs-suspend-interruptible.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17214">i915#17214</a>) +1=
 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-4t=
ile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190=
</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17593">i915#17593</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-li=
near-to-16bpp-linear-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-x=
tile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
810">i915#8810</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8813">i915#8813</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_force_connector_basic@force-lo=
ad-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17465">i915#17465</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_force_connector_basic@force-l=
oad-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17452">i915#17452</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_force_connector_basic@force-=
load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-rgb=
565-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +16 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5439">i915#5439</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-til=
ing-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10055">i915#10055</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-tili=
ng-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10055">i915#10055</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_frontbuffer_tracking@fbc-tilin=
g-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17609">i915#17609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-=
1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-1p=
-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +38 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-9/igt@kms_frontbuffer_tracking@fbchdr-=
1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbchdr-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428<=
/a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk11:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb=
-msflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16180/shard-glk11/igt@kms_frontbuffer_tracking@fbchdr-2p-sc=
ndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mma=
p-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16180/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17517">i915#17517</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16180/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15989">i915#15989</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +46 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +33 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a=
>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +77 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428<=
/a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +22 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsrhdr=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +94 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +33 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +23 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsrhdr=
-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17588">i915#17588</a>) +122 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +27 other test=
s skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsrhdr=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17559">i915#17559</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsrhdr=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17559">i915#17559</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-o=
ffscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +26 other tes=
ts skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_frontbuffer_tracking@hdr-1p-of=
fscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +26 other test=
s skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_frontbuffer_tracking@hdr-1p-=
offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +18 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-p=
rimscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +59 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_frontbuffer_tracking@hdr-2p-s=
cndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_frontbuffer_tracking@hdr-shrfb=
-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17606">i915#17606</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</=
a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +30 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)=
 +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i91=
5#1825</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +37 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +19 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_frontbuffer_tracking@psrhdr-2p=
-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +42 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2=
p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +35 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_hdmi_audio_bw@audio-bw-hblank=
160.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17102">i915#17102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_hdmi_audio_bw@audio-bw-hblank8=
0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17104">i915#17104</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_hdmi_audio_bw@audio-bw-hblan=
k80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17103">i915#17103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-5/igt@kms_hdmi_audio_bw@suspend-disk-a=
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
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_hdr@bpc-switch.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518"=
>i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_hdr@bpc-switch.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">=
i915#17498</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_hdr@bpc-switch.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498"=
>i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_hdr@brightness-with-hdr.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_hdr@invalid-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_hdr@static-toggle-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_joiner@basic-force-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17678">i915#17678</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15459">i915#15459</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15459">i915#15459</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_joiner@basic-force-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17678">i915#17678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_joiner@basic-force-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15458">i915#15458</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_joiner@basic-force-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17567">i915#17567</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_joiner@invalid-modeset-big-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17512">i915#17512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-10/igt@kms_joiner@invalid-modeset-forc=
e-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15458">i915#15458</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_joiner@invalid-modeset-force-=
ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17567">i915#17567</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_joiner@switch-modeset-ultra-jo=
iner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17617">i915#17617</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_pipe_b_c_ivb@disable-pipe-b-en=
able-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17540">i915#17540</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_pipe_b_c_ivb@disable-pipe-b-en=
able-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17540">i915#17540</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-=
modeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_pipe_crc_basic@compare-crc-san=
itycheck-nv12@pipe-a-vga-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17461">i915#17461</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_pipe_crc_basic@compare-crc-san=
itycheck-nv12@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17686">i915#17686</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_pipe_stress@stress-xrgb8888-=
4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_pipe_stress@stress-xrgb8888-4t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17601">i915#17601</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_pipe_stress@stress-xrgb8888-=
4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_plane@pixel-format-4-tiled-b=
mg-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_plane@pixel-format-4-tiled-ln=
l-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_plane@pixel-format-4-tiled-mod=
ifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17479">i915#17479</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-mo=
difier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_plane@pixel-format-y-tiled-ge=
n12-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_plane@pixel-format-yf-tiled-mo=
difier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17479">i915#17479</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_plane@pixel-format-yf-tiled-=
modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip=
</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_plane@pixel-format-yf-tiled-m=
odifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_plane@pixel-format-yf-tiled-mo=
difier@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_plane@plane-panning-bottom-r=
ight-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17844">i915#17844</a>) +12 other tests abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk3/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13026">i915#13026</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other te=
st incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-5/igt@kms_plane@plane-panning-bottom-ri=
ght-suspend@pipe-b.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13026">i915#13026</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend@pipe-b.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomp=
lete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_plane_alpha_blend@alpha-7efc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17595">i915#17595</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic@=
pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8821">i915#8821</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a>) +5 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17509">i915#17509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_plane_multiple@2x-tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17586">i915#17586</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_plane_multiple@tiling-y.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_plane_scaling@2x-scaler-multi=
-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-p01=
0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_plane_scaling@plane-downscale-=
max-crc-linear@pipe-c-hdmi-a-1-p010.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17833">i915#17833</a>) +17 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_plane_scaling@plane-downscale=
-max-crc-rotation-180-4-tiled.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-linear@pipe-a=
-hdmi-a-1-p010:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_plane_scaling@plane-downscale=
-max-crc-rotation-180-linear@pipe-a-hdmi-a-1-p010.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17833">i915#178=
33</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_plane_scaling@plane-downscal=
e-max-crc-rotation-180-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_plane_scaling@plane-downscale=
-max-crc-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17832">i915#17832</a>) +4 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_plane_scaling@plane-downscale-=
max-crc-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17528">i915#17528</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled@pipe-c-hdmi-a-1-xy=
uv8888:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_plane_scaling@plane-downscale=
-max-crc-y-tiled@pipe-c-hdmi-a-1-xyuv8888.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17833">i915#17833</a>) +8=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-=
hdmi-a-1-rgb565:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_plane_scaling@plane-upscale-ma=
x-crc-rotation-270-y-tiled@pipe-c-hdmi-a-1-rgb565.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#178=
43</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled@pipe-c-h=
dmi-a-2-xrgb16161616f:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-m=
ax-crc-rotation-90-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i91=
5#17843</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-3/igt@kms_plane_scaling@plane-upscale-=
max-crc-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17462">i915#17462</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-10/igt@kms_pm_backlight@basic-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_pm_backlight@fade-with-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17462">i915#17462</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_pm_backlight@fade-with-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17462">i915#17462</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_pm_dc@dc5-dpms-negative.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17602">i915#17602</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard=
-rkl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16943">i915#169=
43</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_pm_dc@dc5-pageflip-negative.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17495">i915#17495</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_pm_dc@dc5-pageflip-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_pm_dc@dc5-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">=
i915#17564</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_pm_dc@dc6-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15751"=
>i915#15751</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_pm_dc@dc6-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361"=
>i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">i=
915#17564</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">=
i915#15948</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@=
kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-r=
kl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_pm=
_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-dg1-19/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg1-17/igt@kms=
_pm_rpm@dpms-non-lpsp.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@kms_pm_rpm@dpms-non-lpsp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_pm_rpm@fences.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">=
i915#4077</a>) +10 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_pm_rpm@fences.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473">i=
915#17473</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk2/igt@kms_pm_rpm@modeset-lpsp-stress-no-=
wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6805">i915#6805</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17569">i915#17569</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@kms_properties@colorop-properties-=
atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17481">i915#17481</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_properties@colorop-properties-=
atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_psr2_sf@fbc-pr-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_psr2_sf@fbc-pr-plane-move-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-e=
dp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_psr2_sf@psr2-cursor-plane-move=
-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests =
skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr2_sf@psr2-primary-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_psr2_sf@psr2-primary-plane-up=
date-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_psr2_su@page_flip-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9683">i915#9683</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17546">i915#17546</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk4/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr@fbc-pr-cursor-mmap-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_psr@fbc-psr-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_psr@fbc-psr-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_psr@fbc-psr-primary-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17480">i915#17480</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@kms_psr@fbc-psr-sprite-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9688">i915#9688</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-16/igt@kms_psr@fbc-psr2-cursor-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_psr@fbc-psr2-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17480">i915#17480</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_psr@fbc-psr2-cursor-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17480">i915#17480</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_psr@fbc-psr2-sprite-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17480">i915#17480</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_psr@psr-cursor-plane-move.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_psr@psr-primary-page-flip.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17480">i915#17480</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@kms_psr_stress_test@invalidate-pri=
mary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk1/igt@kms_psr_stress_test@invalidate-pri=
mary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_psr_stress_test@invalidate-pr=
imary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_rotation_crc@bad-pixel-format.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17488">i915#17488</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk6/igt@kms_rotation_crc@primary-y-tiled-r=
eflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17488">i915#17488</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_rotation_crc@sprite-rotation-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15867">i915#15867</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-8/igt@kms_tv_load_detect@load-detect.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_vblank@ts-continuation-dpms-s=
uspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17844">i915#17844</a>) +13 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-b-vga-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17752">i915#17752</a>) +4 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk3/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) =
+1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb1/igt@kms_vblank@ts-continuation-suspend=
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
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-1/igt@kms_vrr@flip-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8808">i915#8808</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520"=
>i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_vrr@max-min.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i91=
5#17520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-7/igt@kms_vrr@negative-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@kms_vrr@seamless-rr-switch-virtua=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17520">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9906">i915#9906</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@kms_vrr@seamless-rr-switch-vrr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17520">i915#17520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@perf@gen12-mi-rpc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536">=
i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk5/igt@perf@gen12-unprivileged-single-ctx=
-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb6/igt@perf@whitelisted-registers-userspa=
ce-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17592">i915#17592</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard=
-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17785">i915#17785</a>)=
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@perf_pmu@busy-accuracy-50.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17637">i915#17637</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@perf_pmu@busy-accuracy-50@bcs0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17651">i915#17651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@perf_pmu@rc6-all-gts.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583=
">i915#17583</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@prime_udl@share-import.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-6/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@prime_vgem@fence-flip-hang.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17467">i915#17467</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@prime_vgem@fence-flip-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk10/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17467">i915#17467</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk8/igt@prime_vgem@fence-write-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17467">i915#17467</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-19/igt@prime_vgem@fence-write-hang.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb4/igt@sysfs_timeslice_duration@timeout.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17632">i915#17632</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-glk11/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17545">i915#17545</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg2-3/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4818">i915#4818</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-dg1-14/igt@tools_test@sysfs_l3_parity.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17447">i915#17447</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@gem_ctx_isolation@preservation-s3.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/=
igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shar=
d-rkl-3/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-1/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17217">i915#1=
7217</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6180/shard-mtlp-5/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-5/igt@gem_exec_suspend@basic-s0.html">ABORT</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@g=
em_exec_suspend@basic-s0.html">FAIL</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17146">i915#17146</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17160">i915#17160</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-m=
tlp-6/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17879">=
i915#17879</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16180/shard-rkl-3/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a>=
 +1 other test pass</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-7/igt@gem_exec_suspend@basic-s4-devices.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17879"=
>i915#17879</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16180/shard-mtlp-6/igt@gem_exec_suspend@basic-s4-devices.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-tglu-7/igt@i915_module_load@reload-no-display.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu=
-3/igt@i915_module_load@reload-no-display.html">ABORT</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16996">i915#16996</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard=
-tglu-2/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk2/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk8/igt=
@i915_pm_rpm@system-suspend.html">INCOMPLETE</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk4/igt=
@i915_pm_rpm@system-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-3/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7=
/igt@i915_selftest@live@guc_multi_lrc.html">INCOMPLETE</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229">i915#16229</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shar=
d-mtlp-5/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@i915_suspend@forcewake.html">INCOMPLETE</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@i=
915_suspend@forcewake.html">PASS</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@i915_suspend=
@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomi=
c@pipe-b-edp-1.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_async_flips@alternate-sync-asyn=
c-flip-atomic@pipe-b-edp-1.html">PASS</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12935">i915#12935</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@kms_=
async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">PASS</a> +1=
 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-a=
-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17150">i915#17150</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_async_flips@async-fli=
p-suspend-resume@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-b=
-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17037">i915#17037</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_async_flips@asy=
nc-flip-suspend-resume@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-snb:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transitio=
n.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition=
.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9878">i915#9878</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-snb5/igt@kms_atomic_transition@plane-all-mo=
deset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-8/igt@kms_big_fb=
@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset.=
html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_9198/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset.htm=
l">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13363">i915#13363</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_busy@extended-modeset-han=
g-newfb-with-reset.html">PASS</a></li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-tglu-9/igt@kms_busy@extended-modeset-hang-newfb-with-reset.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13363">i915#13363</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_busy@extended-modeset-=
hang-newfb-with-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-tglu-9/igt@kms_busy@extended-modeset-hang-newfb-with-reset@=
pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17147">i915#17147</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_busy@extended-m=
odeset-hang-newfb-with-reset@pipe-a.html">PASS</a></li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset@=
pipe-a.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_9198/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-re=
set@pipe-a.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17147">i915#17147</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_busy@extend=
ed-modeset-hang-newfb-with-reset@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-=
cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14694">i915#14694</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-=
cc@pipe-c-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14694">i915#14694</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-=
a-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
_9198/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_cursor_crc@cursor-random-128x=
42@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdm=
i-a-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_9198/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-=
1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16180/shard-tglu-8/igt@kms_cursor_crc@cursor-random-=
128x42@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566"=
>i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16180/shard-rkl-3/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</=
a> +1 other test pass</li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-tglu-3/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu=
-5/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-=
tglu-3/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl=
-3/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shar=
d-rkl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-2/igt@kms_cursor_crc@cursor-suspend.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17157">i91=
5#17157</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16180/shard-mtlp-4/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible.html">INC=
OMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/s=
hard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#=
16276</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6113">i915#6113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_flip@flip-vs-suspend-interruptible.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-to-linear:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1=
-4-to-linear.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_9198/shard-mtlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-e=
dp-1-4-to-linear.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15733">i915#15733</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@kms_flip_tilin=
g@flip-change-tiling@pipe-a-edp-1-4-to-linear.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-=
indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_9198/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-offs=
creen-pri-indfb-draw-mmap-wc.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms=
_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer=
_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-in=
dfb-draw-pwrite.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-offscreen=
-pri-indfb-draw-pwrite.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_front=
buffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">PASS</a> +11 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-glk5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb=
-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_frontbuffer_track=
ing@hdr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +2 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-ind=
fb-draw-mmap-gtt.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn=
-spr-indfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_fro=
ntbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-ms=
flip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-indfb-ms=
flip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_frontbuffer_tracking=
@hdr-2p-scndscrn-indfb-msflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-4/igt=
@kms_hdmi_inject@inject-audio.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-4/igt@k=
ms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_hdr@bpc-switch.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-tglu-4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16696">i915#16696</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16772">i915#16772</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-tglu-4/igt@kms_pipe_stress@st=
ress-xrgb8888-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15733">i915#15733</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_plane@plane-panning-bottom-righ=
t-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe=
-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14412">i915#14412</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_plane@plane-panning-=
bottom-right-suspend@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk2=
/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-=
glk6/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a></li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-tglu-10/igt@kms_plane_scaling@intel-max-src-size.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-t=
glu-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/695=
3">i915#6953</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16180/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-1/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17032">i915#17032</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16180/shard-mtlp-2/igt@kms_pm_backlight@fade-with-suspend.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-=
3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17173">i915#17173</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mt=
lp-4/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_p=
m_rpm@dpms-non-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_pm_rpm@d=
pms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-r=
kl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/=
shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/=
igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shar=
d-rkl-4/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_create:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer=
_create.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer=
_create.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13179">i915#13179</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_selftest@drm_framebuf=
fer@drm_test_framebuffer_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17209">i915#17209</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16180/shard-mtlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-7/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/=
igt@perf_pmu@busy-double-start@ccs0.html">PASS</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/i=
gt@perf_pmu@busy-double-start@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@gt-awake:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-4/igt@perf_pmu@gt-awake.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-8/igt@perf_pmu@g=
t-awake.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17696">i915#17696</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-6/igt@perf_pmu@gt-awake.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@per=
f_pmu@rc6-suspend.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13520">i915#13520</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@perf_pmu@rc6-s=
uspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
6/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i9=
15#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16180/shard-rkl-2/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i=
915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rk=
l-3/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/sh=
ard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#110=
78</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16180/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt=
@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/sh=
ard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6335">i915#6335</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_create@create-ext-=
cpu-access-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@gem_create@create-ext-set-pat.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@=
gem_create@create-ext-set-pat.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shar=
d-rkl-8/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-=
5/igt@gem_ctx_isolation@preservation-s3.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176">i915#17176</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mt=
lp-6/igt@gem_ctx_isolation@preservation-s3.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176">i915#17176</a>) +=
1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@gem_ctx_param@set-priority-not-supported.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard=
-rkl-5/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444">i915#17=
444</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
180/shard-rkl-6/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17444">i915#17444</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/ig=
t@gem_eio@in-flight-suspend.html">PASS</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327">i915#17327</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shar=
d-rkl-7/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327">=
i915#17327</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@gem_exec_balancer@parallel-balancer.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
2/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rk=
l-6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i=
915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@gem_exec_reloc@basic-concurrent16.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/=
igt@gem_exec_reloc@basic-concurrent16.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3=
281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
180/shard-rkl-5/igt@gem_exec_reloc@basic-concurrent16.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#32=
81</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rk=
l-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shar=
d-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16180/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/s=
hard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@gem_lmem_swapping@parallel-random=
-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@gem_lmem_swapping@random-engines.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/i=
gt@gem_lmem_swapping@random-engines.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/ig=
t@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180=
/shard-rkl-6/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i91=
5#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915=
#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16180/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-unca=
ched.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_9198/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@gem_partial_pwrit=
e_pread@writes-after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16180/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282=
">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@gem_pwrite@basic-self.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_pwri=
te@basic-self.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_pwrite@basic-sel=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@=
gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/sh=
ard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@gem_tiled_pread_basic@basic.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@ge=
m_tiled_pread_basic@basic.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_ti=
led_pread_basic@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@gem_userptr_blits@coherency-sync.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/i=
gt@gem_userptr_blits@coherency-sync.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17433">i915#17433</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#329=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1618=
0/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17433">i915#17433</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@=
gem_userptr_blits@dmabuf-sync.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">=
i915#3323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16180/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#=
3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16180/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-u=
nsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rk=
l-6/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297=
">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16180/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@gen3_render_linear_blits.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gen3_=
render_linear_blits.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/=
igt@gen3_render_linear_blits.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@gen3_render_mixed_blits.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17455">i915#17455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16180/shard-rkl-7/igt@gen3_render_mixed_blits.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i=
915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@gen7_exec_parse@load-register-reg.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/=
igt@gen7_exec_parse@load-register-reg.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-=
6/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915=
#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/=
igt@gen9_exec_parse@batch-without-end.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/=
igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#25=
27</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@g=
en9_exec_parse@bb-start-far.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-=
rkl-2/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16180/shard-rkl-8/igt@gen9_exec_parse@bb-start-param.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@i9=
15_module_load@resize-bar.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rk=
l-4/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard=
-rkl-8/igt@i915_query@test-query-geometry-subslices.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#572=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1618=
0/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transitio=
n-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6=
/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-pa=
nels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_big_fb@4-tiled-8=
bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-=
hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGT_9198/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-r=
otate-0-hflip-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#=
5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6180/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-=
async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_919=
8/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180=
-hflip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_9198/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-h=
flip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stri=
de-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-h=
flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_9198/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_big_fb@linear=
-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_big_fb@x-tiled=
-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i9=
15#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16180/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">=
i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl=
-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">=
i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16180/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538=
">i915#4538</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rk=
l-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i=
915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538"=
>i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16180/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-7/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/140=
98">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_ccs@bad-pixel-format-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe=
-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-r=
kl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-c=
cs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@=
kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/s=
hard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098"=
>i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-=
y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@p=
ipe-d-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-7/igt@kms_ccs@crc-primary-=
suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>=
) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_919=
8/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_ccs@crc-sprite-planes=
-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pip=
e-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_ccs@random-ccs-dat=
a-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl=
-6/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427"=
>i915#17427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16180/shard-rkl-7/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
7/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-=
rkl-6/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427=
">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-y=
uv-rgb-bt601.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@km=
s_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">=
i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16471">i915#16471</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17427">i915#17427</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_chamelium_color_pipel=
ine@plane-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@km=
s_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828=
">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i9=
15#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/s=
hard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"=
>i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-e=
nabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt=
@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/78=
28">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16180/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"=
>i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_content_protection@atomic-hdcp14.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl=
-6/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865"=
>i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16180/shard-rkl-3/igt@kms_content_protection@atomic-hdcp14.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard=
-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_content_protection@dp=
-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0-suspend-resu=
me.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_content_protection@dp-mst-=
type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1533=
0">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_content_protection@dp-mst-t=
ype-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl=
-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16180/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/sha=
rd-rkl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17428">i915#17428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor=
-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17428">i915#17428</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@=
kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shar=
d-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">=
i915#17289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16180/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198=
/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17291">i915#17291</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_dp_link_training@non-uh=
br-mst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17291">i915#17291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17290">i915#17290</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_dp_link_trainin=
g@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5=
/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i91=
5#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16180/shard-rkl-4/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i=
915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_feature_discovery@display-3x.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/i=
gt@kms_feature_discovery@display-3x.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16=
081</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
180/shard-rkl-4/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16=
081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@k=
ms_feature_discovery@dp-mst.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shar=
d-rkl-2/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_feature_discovery@dsc.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_=
feature_discovery@dsc.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16600">i915#16600</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_featur=
e_discovery@dsc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt=
@kms_flip@2x-blocking-wf_vblank.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/sh=
ard-rkl-3/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16180/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rk=
l-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i=
915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk6/ig=
t@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13=
356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17183">i915#17183</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4839">i915#4839</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_flip@2x-=
flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#1=
7183</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4ti=
le-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@km=
s_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">=
i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4t=
iledg2rcccs-upscaling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4til=
e-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#156=
43</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_161=
80/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rc=
ccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15643">i915#15643</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@=
kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7428">i915#17428</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard=
-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16180/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrac=
k-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracki=
ng@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#1=
5102</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-mul=
tidraw.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multi=
draw.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_frontbu=
ffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) =
+21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrac=
k-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-8/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#1=
5102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-pr=
imscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/sha=
rd-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mma=
p-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-s=
pr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_9198/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-prims=
crn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuff=
er_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
102">i915#15102</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render=
:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-s=
pr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2=
p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt=
@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17428">i915#17428</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tilin=
g-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shr=
fb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn=
-pri-shrfb-draw-mmap-cpu.html">PASS</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_fro=
ntbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i9=
15#15989</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-ms=
flip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-ms=
flip-blt.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk9/igt@kms_frontbuffer_tracking=
@hdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl=
-7/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shar=
d-rkl-6/igt@kms_frontbuffer_tracking@hdr-suspend.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#=
16056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rk=
l-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766=
">i915#9766</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16180/shard-rkl-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-ind=
fb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGT_9198/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn=
-cur-indfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i91=
5#1825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16180/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-d=
raw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">=
i915#17428</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@=
kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i=
915#16490</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16180/shard-mtlp-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#=
12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16490">i915#16490</a>)</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@km=
s_hdr@brightness-with-hdr.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i91=
5#16644</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16180/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#127=
13</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16644">i915#16644</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt=
@kms_hdr@invalid-metadata-sizes.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228=
">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16180/shard-rkl-8/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i=
915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-3/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/154=
60">i915#15460</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16180/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_panel_fitting@legacy.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_p=
anel_fitting@legacy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-4/ig=
t@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17455">i915#17455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enab=
le-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_919=
8/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-2/igt@kms_plane@pixel-format-4-=
tiled-bmg-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-mod=
ifier.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_9198/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifi=
er.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-sourc=
e-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-5/igt@kms_pl=
ane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#1=
5709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt=
@kms_plane_multiple@2x-tiling-y.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@=
kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_91=
98/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17832">i915#17832</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_plane_scaling@plane=
-upscale-max-crc-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shar=
d-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shar=
d-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@k=
ms_pm_lpsp@screens-disabled.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-=
rkl-4/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/sha=
rd-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i91=
5#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16180/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-3/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-=
rkl-4/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#174=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17450">i915#17450</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16180/shard-rkl-6/igt@kms_pm_rpm@modeset-pc8-residency-stress.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms=
_prime@basic-crc-hybrid.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_prime@=
basic-crc-hybrid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-=
exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-over=
lay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuo=
us-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_9198/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-=
sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@kms_psr2_sf@f=
bc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-a=
rea.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
_9198/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-primary-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915=
#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16180/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-3/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">=
i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16180/shard-rkl-6/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@k=
ms_psr@fbc-psr2-primary-blt.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i9=
15#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16180/shard-rkl-2/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#107=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16180/shard-rkl-4/igt@kms_psr@pr-primary-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_psr@psr-no-drrs.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_psr@ps=
r-no-drrs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr@ps=
r-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-over=
lay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
_9198/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15949">i915#15949</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overl=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15949">i915#15949</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_psr_stress_test@invalidate=
-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer=
_free.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_9198/shard-glk2/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_f=
ree.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13179">i915#13179</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16180/shard-glk8/igt@kms_selftest@drm_frameb=
uffer@drm_test_framebuffer_free.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt=
@kms_tv_load_detect@load-detect.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17445">i915#17445</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@=
kms_tv_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445">i915#17445</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_vrr@flipline.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_vrr@flipl=
ine.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@kms_vrr@flipli=
ne.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16180/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-vrr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/sha=
rd-rkl-8/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2436">i915#2436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16180/shard-rkl-8/igt@perf@gen8-unprivileged-single-ctx-cou=
nters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-1/igt@perf_pmu@busy-double-start.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@p=
erf_pmu@busy-double-start.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16180/shard-mtlp-5/igt@perf_pm=
u@busy-double-start.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4349">i915#4349</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-3/igt@prime_vgem@basic-write.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
91">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16180/shard-rkl-6/igt@prime_vgem@basic-write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-7/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17=
448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16180/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16180/shard-rkl-7/igt@prime_vgem@fence-write-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9198 -&gt; IGTPW_16180</li>
<li>Linux: CI_DRM_19561 -&gt; CI_DRM_19563</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19561: 7f983558aaf724daeafb5904dbb078835857b51e @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  CI_DRM_19563: 2bdca9b1f8638ef27955d61c149bc6fac856d291 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_16180: 16180<br />
  IGT_9198: 9198</p>

</body>
</html>

--===============0500980475893320135==--
