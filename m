Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEA4606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 01:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF3110E3B6;
	Fri, 27 Nov 2026 01:49:12 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACA410E3B6;
 Fri, 27 Nov 2026 01:48:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6390289076657475156=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_series_starting_with_=5B?=
 =?utf-8?q?i-g-t=2C1/9=5D_lib/igt=5Fdrm=5Fras=5Fnl=3A_Add_node_and_error_cou?=
 =?utf-8?q?nter_listing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Nov 2026 01:48:14 -0000
Message-ID: <179574409439.96288.15996838265962228868@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
In-Reply-To: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
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

--===============6390289076657475156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/9] lib/igt_drm_ras_nl: Add node and error counter listing
URL   : https://patchwork.freedesktop.org/series/179564/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19611_full -> IGTPW_16212_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/index.html

Participating hosts (10 -> 8)
------------------------------

  Missing    (2): shard-snb pig-kbl-iris 

New tests
---------

  New tests have been introduced between CI_DRM_19611_full and IGTPW_16212_full:

### New IGT tests (1) ###

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  

Known issues
------------

  Here are the changes found in IGTPW_16212_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][1] ([i915#8411])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg1:          NOTRUN -> [SKIP][2] ([i915#8411])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][3] ([i915#6230])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][4] ([i915#11078])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@device_reset@cold-reset-bound.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-glk10:        NOTRUN -> [SKIP][5] ([i915#17499])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#3555] / [i915#9323]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-glk:          NOTRUN -> [SKIP][7] ([i915#17499]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#17854])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#17854])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#17854])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-10/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-glk:          NOTRUN -> [SKIP][13] ([i915#17568])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#7697]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@gem_close_race@multigpu-basic-threads.html
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#7697])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#7697])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#6335])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-glk10:        NOTRUN -> [SKIP][18] ([i915#17530])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_create@create-ext-set-pat.html
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8562])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@gem_create@create-ext-set-pat.html
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#8562])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#8562])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][22] ([i915#13356] / [i915#16466]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#17444])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#17444])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-glk:          NOTRUN -> [SKIP][25] ([i915#17535])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#17444])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#8555])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-1/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@legacy-engines-hang@blt:
    - shard-glk:          NOTRUN -> [SKIP][28] ([i915#17527])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_ctx_persistence@legacy-engines-hang@blt.html

  * igt@gem_ctx_sseu@engines:
    - shard-glk:          NOTRUN -> [SKIP][29] ([i915#17496])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#280]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#4771])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@gem_exec_balancer@bonded-pair.html
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#4771])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4036])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#8555])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@gem_exec_balancer@noheartbeat.html
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#8555])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-glk10:        NOTRUN -> [SKIP][38] ([i915#17547])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#4525])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#4525])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-glk:          NOTRUN -> [SKIP][41] ([i915#17711])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@gem_exec_capture@capture-recoverable.html
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#6344])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][43] ([i915#16904]) +4 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@gem_exec_capture@capture@vecs0-lmem0.html
    - shard-dg1:          NOTRUN -> [FAIL][44] ([i915#16904]) +2 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4812])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3539] / [i915#4852]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3539])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3539])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_params@larger-than-life-batch:
    - shard-glk:          NOTRUN -> [SKIP][50] ([i915#16871]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@gem_exec_params@larger-than-life-batch.html

  * igt@gem_exec_params@secure-non-root:
    - shard-glk:          NOTRUN -> [SKIP][51] ([i915#17523])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk2/igt@gem_exec_params@secure-non-root.html
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#17416])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3281]) +12 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#3281]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3281]) +12 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4812]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4537] / [i915#4812])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][58] ([i915#17844] / [i915#7975]) +1 other test abort
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-dg1:          NOTRUN -> [ABORT][59] ([i915#17844] / [i915#7975]) +1 other test abort
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4860]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4860]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4860])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk10:        NOTRUN -> [SKIP][63] ([i915#17456])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#4613]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-glk11:        NOTRUN -> [SKIP][65] ([i915#17503])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4613])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-glk10:        NOTRUN -> [SKIP][67] ([i915#17503]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#4613]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-10/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify:
    - shard-glk:          NOTRUN -> [SKIP][69] ([i915#17503] / [i915#4613]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#12193]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4565]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#8289])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][73] ([i915#284])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@gem_media_vme.html

  * igt@gem_mmap@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4083]) +6 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@basic-short:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4077]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@gem_mmap_gtt@basic-short.html

  * igt@gem_mmap_gtt@close-race:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4077]) +17 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@gem_mmap_gtt@close-race.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4077]) +20 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4083])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-8/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4083]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3282]) +8 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3282]) +9 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#3282]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-8/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk10:        NOTRUN -> [WARN][83] ([i915#14702] / [i915#2658])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][84] ([i915#13398])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-glk10:        NOTRUN -> [SKIP][85] ([i915#17521])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4270]) +5 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4270]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-glk:          NOTRUN -> [SKIP][88] ([i915#17521]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][89] ([i915#17492]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#8428]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html
    - shard-glk10:        NOTRUN -> [SKIP][91] ([i915#17492])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#5190] / [i915#8428]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4079]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#8411])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#4079])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#3282]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4079]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4885])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_softpin@evict-snoop.html
    - shard-glk:          NOTRUN -> [SKIP][99] ([i915#17551])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4885]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#17430])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#15657])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_tiled_pread_basic@basic.html
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#15657])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#17433] / [i915#3297])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3297]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#3297]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#3297])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-glk11:        NOTRUN -> [SKIP][108] ([i915#17507])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#3297] / [i915#4880]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#3297] / [i915#4880]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-glk:          NOTRUN -> [SKIP][111] ([i915#17507])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk5/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-glk10:        NOTRUN -> [SKIP][112] ([i915#17507])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#3297]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-4/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen3_mixed_blits:
    - shard-glk:          NOTRUN -> [SKIP][114] ([i915#17688])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@gen3_mixed_blits.html

  * igt@gen3_render_linear_blits:
    - shard-glk:          NOTRUN -> [SKIP][115] ([i915#17555])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@gen3_render_linear_blits.html

  * igt@gen3_render_tiledx_blits:
    - shard-glk10:        NOTRUN -> [SKIP][116] ([i915#17511])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-glk:          NOTRUN -> [SKIP][117] ([i915#17505]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gen7_exec_parse@basic-offset.html
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#17455]) +8 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@gen7_exec_parse@basic-offset.html
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#17455]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@gen7_exec_parse@basic-offset.html
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#17455]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#17455]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#2856])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#2527]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#2527] / [i915#2856]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#2856]) +7 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#2527]) +7 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gen9_exec_parse@valid-registers.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#15678])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#14123])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@i915_drm_fdinfo@all-busy-check-all.html
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#14123])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@i915_drm_fdinfo@all-busy-check-all.html
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#14123])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@most-busy-check-all@vecs0:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#14073]) +15 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@i915_drm_fdinfo@most-busy-check-all@vecs0.html

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#14118])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#14118])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#8399])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-glk:          NOTRUN -> [SKIP][135] ([i915#17526])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk10:        NOTRUN -> [SKIP][136] ([i915#17706])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-mtlp:         [PASS][137] -> [INCOMPLETE][138] ([i915#13356])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-3/igt@i915_pm_rpm@system-suspend.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-rkl:          [PASS][139] -> [INCOMPLETE][140] ([i915#13356])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@i915_pm_rpm@system-suspend-execbuf.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#11681] / [i915#6621]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#11681] / [i915#6621]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#11681]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@i915_pm_rps@thresholds.html
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#11681]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@i915_pm_rps@thresholds.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#7984])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#6245])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#16109])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#16079])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#5723])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [PASS][150] -> [INCOMPLETE][151] ([i915#13356] / [i915#16182] / [i915#4817])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-glk9/igt@i915_suspend@fence-restore-tiled2untiled.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk5/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [PASS][152] -> [INCOMPLETE][153] ([i915#4817])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-dg1:          NOTRUN -> [ABORT][154] ([i915#17844]) +13 other tests abort
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#7707])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@intel_hwmon@hwmon-read.html
    - shard-glk:          NOTRUN -> [SKIP][156] ([i915#11680])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#4212]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#4212]) +5 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-glk:          NOTRUN -> [SKIP][159] ([i915#17668])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#12454] / [i915#12712])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][161] -> [FAIL][162] ([i915#14888]) +2 other tests fail
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [PASS][163] -> [INCOMPLETE][164] ([i915#12761]) +1 other test incomplete
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html
    - shard-glk11:        NOTRUN -> [INCOMPLETE][165] ([i915#12761] / [i915#13356]) +1 other test incomplete
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-glk:          NOTRUN -> [SKIP][166] ([i915#17485])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#9531])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#1769] / [i915#3555])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][169] ([i915#1769])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][170] -> [FAIL][171] ([i915#15662]) +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-tglu-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#4538] / [i915#5286]) +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-glk10:        NOTRUN -> [SKIP][173] ([i915#17478]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-glk11:        NOTRUN -> [SKIP][174] ([i915#17478])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-glk:          NOTRUN -> [SKIP][175] ([i915#17556])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#5286])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#17432] / [i915#5286]) +7 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#4538] / [i915#5286]) +9 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#14544] / [i915#4538] / [i915#5286])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][180] ([i915#17478]) +10 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][181] ([i915#17500]) +9 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#17431])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#17431]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-4/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#17431] / [i915#3638]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#3638]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#14544] / [i915#17431] / [i915#3638])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#3828])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#3828])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#3828]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#3828])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#17431]) +7 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-glk10:        NOTRUN -> [SKIP][192] ([i915#17500]) +5 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-glk11:        NOTRUN -> [SKIP][193] ([i915#17500]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#17432]) +9 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#4538] / [i915#5190]) +16 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#17432])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#17432])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#4538]) +7 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#4538]) +6 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#17432]) +3 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#6095]) +24 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#10307] / [i915#6095]) +93 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][204] ([i915#17525])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#6095]) +141 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][206] ([i915#17490] / [i915#17491]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][207] ([i915#17491]) +9 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][208] ([i915#17490] / [i915#17491]) +35 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#6095]) +119 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#12313]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#12313])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][212] ([i915#17490] / [i915#17491]) +9 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#12313] / [i915#14544])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#6095]) +73 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][215] ([i915#17491]) +28 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1:
    - shard-mtlp:         [PASS][216] -> [FAIL][217] ([i915#17158])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         [PASS][218] -> [INCOMPLETE][219] ([i915#15582]) +1 other test incomplete
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][220] ([i915#13356] / [i915#15582]) +1 other test incomplete
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#6095]) +12 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#14544] / [i915#6095]) +5 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#14098] / [i915#14544] / [i915#6095]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#14098] / [i915#6095]) +51 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#12313]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#12313]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#12313])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][228] ([i915#17525]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][229] ([i915#17491]) +93 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-glk:          NOTRUN -> [SKIP][230] ([i915#17550])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#16017])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#3742])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-glk10:        NOTRUN -> [SKIP][233] ([i915#17550])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_cdclk@plane-scaling.html
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#3742])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#13781]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#11151]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@kms_chamelium_audio@dp-audio-after-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#11151])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@kms_chamelium_audio@dp-audio-after-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#11151] / [i915#14544])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#11151]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#11151])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#11151]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-glk11:        NOTRUN -> [SKIP][242] ([i915#17489]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#17427]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-glk:          NOTRUN -> [SKIP][244] ([i915#17489]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#17427]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#14544] / [i915#17427]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#16471] / [i915#17427])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#16471] / [i915#17427]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#17427]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#17427])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#17427]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][252] ([i915#17497]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#16471] / [i915#17427]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#16471] / [i915#17427]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][255] ([i915#17497]) +6 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#11151] / [i915#7828]) +10 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#11151] / [i915#7828]) +15 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#11151] / [i915#7828]) +13 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#11151] / [i915#7828]) +9 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-glk:          NOTRUN -> [SKIP][260] ([i915#17483]) +15 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#11151] / [i915#14544] / [i915#7828])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#11151] / [i915#7828]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-glk10:        NOTRUN -> [SKIP][263] ([i915#17483]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#3555] / [i915#9979])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-ctm3x4:
    - shard-mtlp:         [PASS][265] -> [FAIL][266] ([i915#15733]) +12 other tests fail
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-1/igt@kms_color_pipeline@plane-ctm3x4.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@kms_color_pipeline@plane-ctm3x4.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#16990]) +15 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-3:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#16990]) +7 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-3.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-5:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#16990]) +15 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-5.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][270] ([i915#17510]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][271] ([i915#17510])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#15330] / [i915#3116] / [i915#3299])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#15330] / [i915#3299])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#15330] / [i915#3116])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-glk:          NOTRUN -> [SKIP][275] ([i915#17502])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#15330])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#15330])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#15865]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@lic-type-0:
    - shard-glk10:        NOTRUN -> [SKIP][279] ([i915#17508]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-dg2:          NOTRUN -> [FAIL][280] ([i915#15539])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#15865]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#15865])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_content_protection@suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#15865]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-glk:          NOTRUN -> [SKIP][284] ([i915#17504]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#13049]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#13049] / [i915#3359])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-glk10:        NOTRUN -> [SKIP][287] ([i915#17533])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#13049])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][289] ([i915#13566]) +1 other test fail
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#3555]) +6 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-rkl:          [PASS][291] -> [FAIL][292] ([i915#13566]) +1 other test fail
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][293] -> [FAIL][294] ([i915#13566]) +1 other test fail
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-tglu-3/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#3555] / [i915#8814])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-max-size.html
    - shard-glk10:        NOTRUN -> [SKIP][296] ([i915#17504])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#3555]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#3555]) +4 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-glk:          NOTRUN -> [SKIP][299] ([i915#17533]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#13049])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#13049]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-glk11:        NOTRUN -> [SKIP][302] ([i915#17533])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#4103]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#13046] / [i915#17454] / [i915#5354]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#17428] / [i915#17454]) +6 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][306] ([i915#15804])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-glk:          NOTRUN -> [SKIP][307] ([i915#17549])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#9067])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#9067])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-glk10:        NOTRUN -> [SKIP][310] ([i915#17457])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#4103]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#4103])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#9723])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#9833])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#9723])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#9723])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#13691])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-glk11:        NOTRUN -> [SKIP][318] ([i915#17486]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#1769] / [i915#3555] / [i915#3804])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [SKIP][320] ([i915#17487])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#3804])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev@basic:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#1257])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_dp_aux_dev@basic.html
    - shard-glk:          NOTRUN -> [SKIP][323] ([i915#17538])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#14544] / [i915#17289])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-glk:          NOTRUN -> [SKIP][325] ([i915#17664])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#17288])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][327] ([i915#17506])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#17290])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][329] ([i915#17477]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#13748])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#17292])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#13748])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-glk:          NOTRUN -> [SKIP][333] ([i915#17625])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#16867])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-glk:          NOTRUN -> [SKIP][335] ([i915#17548])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#16867])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#16867]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#3555] / [i915#8812])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#16361]) +4 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-glk:          NOTRUN -> [SKIP][340] ([i915#17458]) +4 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#16361]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#16361]) +2 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#14544] / [i915#16361])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#16361]) +4 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-glk10:        NOTRUN -> [SKIP][345] ([i915#17458])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][346] ([i915#13356] / [i915#9878])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-rkl:          [PASS][347] -> [INCOMPLETE][348] ([i915#9878])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#16680])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#16680])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#16680])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#16680])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#16084])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#16084])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#16081]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_feature_discovery@display-2x.html
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#16081])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#16081]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#16081]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-glk:          NOTRUN -> [SKIP][359] ([i915#17666])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-glk:          NOTRUN -> [SKIP][360] ([i915#17570])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk2/igt@kms_feature_discovery@dp-mst.html
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#16599])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_feature_discovery@dp-mst.html
    - shard-rkl:          NOTRUN -> [SKIP][362] ([i915#16599])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@hdr:
    - shard-glk:          NOTRUN -> [SKIP][363] ([i915#17539])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_feature_discovery@hdr.html
    - shard-dg2:          NOTRUN -> [SKIP][364] ([i915#16600])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_feature_discovery@hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#16600])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_feature_discovery@hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][366] ([i915#16600])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_feature_discovery@hdr.html
    - shard-mtlp:         NOTRUN -> [SKIP][367] ([i915#16600])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-5/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@vrr:
    - shard-tglu:         NOTRUN -> [SKIP][368] ([i915#16600]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][369] ([i915#9934]) +5 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_flip@2x-absolute-wf_vblank.html
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#9934]) +9 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_flip@2x-absolute-wf_vblank.html
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#3637] / [i915#9934]) +3 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-5/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#8381])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#8381])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#14544] / [i915#9934])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][375] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][376] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-tglu:         NOTRUN -> [SKIP][377] ([i915#3637] / [i915#9934]) +8 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#9934]) +9 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][379] ([i915#8381])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-8/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][380] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839]) +1 other test incomplete
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][381] ([i915#12745] / [i915#13356] / [i915#17183]) +1 other test incomplete
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][382] ([i915#17484]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#15643]) +2 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][384] ([i915#17493])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#14544] / [i915#15643])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][386] ([i915#15643]) +2 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][387] ([i915#15643]) +5 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-glk11:        NOTRUN -> [SKIP][388] ([i915#17484])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-glk:          NOTRUN -> [SKIP][389] ([i915#17522]) +5 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#15643]) +3 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-glk10:        NOTRUN -> [SKIP][391] ([i915#17484])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][392] ([i915#15643] / [i915#5190]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-glk10:        NOTRUN -> [SKIP][393] ([i915#17522]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][394] ([i915#15643])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-dg1:          NOTRUN -> [SKIP][395] ([i915#17452])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][396] ([i915#15104] / [i915#15990])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][397] ([i915#15991] / [i915#5354]) +48 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][398] ([i915#10056] / [i915#13356] / [i915#16593])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk5/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][399] ([i915#10055])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][400] ([i915#17517]) +52 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          [PASS][401] -> [SKIP][402] ([i915#15989]) +7 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][403] ([i915#15990]) +3 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][404] ([i915#15989]) +17 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#15989]) +23 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][406] ([i915#15989]) +27 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][407] ([i915#17559])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#5439]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][409] ([i915#5439])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          NOTRUN -> [SKIP][410] ([i915#15989]) +18 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][411] ([i915#15104] / [i915#15990]) +3 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][412] ([i915#15102]) +44 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][413] ([i915#14544] / [i915#17428] / [i915#1825]) +2 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][414] ([i915#17428]) +114 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk11:        NOTRUN -> [SKIP][415] ([i915#17482]) +8 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][416] ([i915#15102]) +50 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][417] ([i915#15102]) +42 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][418] ([i915#15990]) +39 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][419] ([i915#14544] / [i915#17428]) +2 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-glk:          [PASS][420] -> [SKIP][421] ([i915#17517]) +5 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          [PASS][422] -> [SKIP][423] ([i915#15989]) +2 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-11/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][424] ([i915#15989]) +24 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][425] ([i915#15991] / [i915#17428]) +15 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][426] ([i915#15104] / [i915#15990]) +3 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][427] ([i915#15990] / [i915#8708]) +21 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][428] ([i915#17482]) +121 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][429] ([i915#15991] / [i915#17428] / [i915#1825]) +9 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][430] ([i915#17428] / [i915#1825]) +9 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][431] ([i915#15990] / [i915#8708]) +21 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][432] ([i915#15102]) +59 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][433] ([i915#15990] / [i915#8708]) +6 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][434] ([i915#14544] / [i915#15102]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][435] ([i915#15990]) +32 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][436] ([i915#17428]) +104 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][437] ([i915#17428]) +76 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][438] ([i915#15991]) +47 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-glk10:        NOTRUN -> [SKIP][439] ([i915#17482]) +38 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-glk:          NOTRUN -> [FAIL][440] ([i915#17102])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdr@bpc-switch:
    - shard-glk11:        NOTRUN -> [SKIP][441] ([i915#17498])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          [PASS][442] -> [SKIP][443] ([i915#16518] / [i915#3555] / [i915#8228])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-11/igt@kms_hdr@bpc-switch-dpms.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][444] ([i915#3555] / [i915#8228])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][445] ([i915#12713])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-glk10:        NOTRUN -> [SKIP][446] ([i915#17498]) +1 other test skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][447] ([i915#3555] / [i915#8228]) +1 other test skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_hdr@static-toggle-suspend.html
    - shard-glk:          NOTRUN -> [SKIP][448] ([i915#17498])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][449] ([i915#15460]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@kms_joiner@basic-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][450] ([i915#15460]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_joiner@basic-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][451] ([i915#15460])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][452] ([i915#15459])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_joiner@basic-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][453] ([i915#15459])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-glk:          NOTRUN -> [SKIP][454] ([i915#17567]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][455] ([i915#14544] / [i915#15458])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-glk:          NOTRUN -> [SKIP][456] ([i915#17575])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk6/igt@kms_joiner@basic-max-non-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][457] ([i915#13688])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][458] ([i915#17512])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][459] ([i915#15458]) +2 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][460] ([i915#15458]) +2 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][461] ([i915#15458])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-glk:          NOTRUN -> [SKIP][462] ([i915#17577])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg2:          NOTRUN -> [SKIP][463] ([i915#6301]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][464] ([i915#6301]) +1 other test skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][465] ([i915#17455]) +2 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-glk:          NOTRUN -> [SKIP][466] ([i915#17540]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2:          NOTRUN -> [ABORT][467] ([i915#17844]) +16 other tests abort
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@kms_pipe_crc_basic@suspend-read-crc.html
    - shard-glk10:        NOTRUN -> [INCOMPLETE][468] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#13476] / [i915#17799])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][469] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#17799])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-dg1:          NOTRUN -> [SKIP][470] ([i915#14712]) +1 other test skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
    - shard-tglu:         NOTRUN -> [SKIP][471] ([i915#14712])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-dg2:          NOTRUN -> [SKIP][472] ([i915#14712])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][473] ([i915#13705])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][474] ([i915#13705])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-glk11:        NOTRUN -> [SKIP][475] ([i915#17479])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][476] ([i915#15709]) +4 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-glk10:        NOTRUN -> [SKIP][477] ([i915#17479])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][478] ([i915#15709]) +6 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-glk:          NOTRUN -> [SKIP][479] ([i915#17479]) +8 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][480] ([i915#15709]) +9 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][481] ([i915#16386]) +5 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:
    - shard-mtlp:         NOTRUN -> [SKIP][482] ([i915#16386]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-mtlp:         NOTRUN -> [SKIP][483] ([i915#15709])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][484] ([i915#16386]) +1 other test skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][485] ([i915#16386]) +1 other test skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][486] ([i915#15709]) +4 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-tglu:         NOTRUN -> [SKIP][487] ([i915#16112])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][488] ([i915#12178])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][489] ([i915#7862]) +1 other test fail
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-glk10:        NOTRUN -> [SKIP][490] ([i915#17509])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][491] ([i915#3555] / [i915#8821])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][492] ([i915#3555]) +8 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][493] ([i915#13958]) +1 other test skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-tglu:         NOTRUN -> [SKIP][494] ([i915#13958])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][495] ([i915#14259])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][496] ([i915#13046] / [i915#17454] / [i915#5354] / [i915#9423])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg1:          NOTRUN -> [SKIP][497] ([i915#17832] / [i915#6953])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-yuyv:
    - shard-glk:          NOTRUN -> [SKIP][498] ([i915#17833]) +17 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-yuyv.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-2-y210:
    - shard-rkl:          NOTRUN -> [SKIP][499] ([i915#14544] / [i915#17843]) +8 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-2-y210.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-1-xv36:
    - shard-tglu:         NOTRUN -> [SKIP][500] ([i915#17843]) +11 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-1-xv36.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-4-xv36:
    - shard-dg1:          NOTRUN -> [SKIP][501] ([i915#17843]) +23 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-4-xv36.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-b-hdmi-a-1-rgb565:
    - shard-glk:          NOTRUN -> [SKIP][502] ([i915#17843]) +5 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-b-hdmi-a-1-rgb565.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-b-hdmi-a-1-xyuv8888:
    - shard-glk:          NOTRUN -> [SKIP][503] ([i915#17878]) +8 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-b-hdmi-a-1-xyuv8888.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][504] ([i915#17832]) +2 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled:
    - shard-glk:          NOTRUN -> [SKIP][505] ([i915#17528]) +1 other test skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled.html
    - shard-tglu:         NOTRUN -> [SKIP][506] ([i915#17832]) +1 other test skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][507] ([i915#14544] / [i915#17832])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled@pipe-b-hdmi-a-1-rgb565:
    - shard-glk10:        NOTRUN -> [SKIP][508] ([i915#17843]) +2 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled@pipe-b-hdmi-a-1-rgb565.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][509] ([i915#17832]) +1 other test skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-glk:          NOTRUN -> [SKIP][510] ([i915#17462])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg2:          NOTRUN -> [SKIP][511] ([i915#12343] / [i915#5354])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_pm_backlight@bad-brightness.html
    - shard-dg1:          NOTRUN -> [SKIP][512] ([i915#12343] / [i915#5354])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][513] ([i915#12343] / [i915#5354])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][514] ([i915#12343] / [i915#9812])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-dg2:          NOTRUN -> [SKIP][515] ([i915#9685])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_pm_dc@dc5-pageflip-negative.html
    - shard-glk10:        NOTRUN -> [SKIP][516] ([i915#17495])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [FAIL][517] ([i915#16479])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-glk:          NOTRUN -> [SKIP][518] ([i915#17564])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][519] ([i915#15948])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_pm_dc@dc6-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][520] ([i915#15948])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][521] ([i915#9340])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][522] ([i915#9340])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-glk11:        NOTRUN -> [SKIP][523] ([i915#17573])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg2:          NOTRUN -> [SKIP][524] ([i915#8430])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_pm_lpsp@screens-disabled.html
    - shard-rkl:          NOTRUN -> [SKIP][525] ([i915#8430])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][526] ([i915#8430])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][527] ([i915#8430])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_pm_lpsp@screens-disabled.html
    - shard-mtlp:         NOTRUN -> [SKIP][528] ([i915#8430])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][529] ([i915#15073]) +1 other test skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-10/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [PASS][530] -> [SKIP][531] ([i915#15073])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> [SKIP][532] ([i915#15073])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-rkl:          [PASS][533] -> [SKIP][534] ([i915#15073]) +1 other test skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-dg2:          NOTRUN -> [SKIP][535] ([i915#15403])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_pm_rpm@package-g7.html
    - shard-dg1:          NOTRUN -> [SKIP][536] ([i915#15403])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-glk:          NOTRUN -> [SKIP][537] ([i915#17710])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2:          NOTRUN -> [ABORT][538] ([i915#10553] / [i915#17844])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-dg1:          NOTRUN -> [ABORT][539] ([i915#10553] / [i915#17844])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][540] ([i915#6524] / [i915#6805])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_prime@basic-crc-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][541] ([i915#6524])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][542] ([i915#6524])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_prime@basic-crc-hybrid.html
    - shard-glk11:        NOTRUN -> [SKIP][543] ([i915#17569])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-glk:          NOTRUN -> [SKIP][544] ([i915#17569])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk6/igt@kms_prime@basic-modeset-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][545] ([i915#14544] / [i915#6524])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_properties@colorop-properties-atomic:
    - shard-glk10:        NOTRUN -> [SKIP][546] ([i915#17481])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_properties@colorop-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][547] ([i915#11520]) +10 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-glk10:        NOTRUN -> [SKIP][548] ([i915#11520]) +2 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][549] ([i915#9808]) +4 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][550] ([i915#12316]) +4 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][551] ([i915#11520]) +12 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][552] ([i915#11520]) +7 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][553] ([i915#11520]) +5 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][554] ([i915#11520] / [i915#14544])
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu:         NOTRUN -> [SKIP][555] ([i915#11520]) +10 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][556] ([i915#9683]) +1 other test skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][557] ([i915#9683])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg1:          NOTRUN -> [SKIP][558] ([i915#9683]) +1 other test skip
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-glk:          NOTRUN -> [SKIP][559] ([i915#17546])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-glk11:        NOTRUN -> [SKIP][560] ([i915#17480]) +1 other test skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-glk:          NOTRUN -> [SKIP][561] ([i915#17480]) +29 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][562] ([i915#1072] / [i915#9732]) +35 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][563] ([i915#9732]) +35 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-mtlp:         NOTRUN -> [SKIP][564] ([i915#9688]) +8 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][565] ([i915#1072] / [i915#9732]) +22 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@pr-dpms:
    - shard-glk10:        NOTRUN -> [SKIP][566] ([i915#17480]) +6 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-glk:          NOTRUN -> [SKIP][567] ([i915#17480] / [i915#9732])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-glk10:        NOTRUN -> [SKIP][568] ([i915#17480] / [i915#9732])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][569] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][570] ([i915#1072] / [i915#9732]) +32 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][571] ([i915#15949])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-glk:          NOTRUN -> [SKIP][572] ([i915#17554])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][573] ([i915#15949])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][574] ([i915#15949]) +1 other test skip
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][575] ([i915#12755] / [i915#15867])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][576] ([i915#4235])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][577] ([i915#4884])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][578] ([i915#15867])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-glk:          NOTRUN -> [SKIP][579] ([i915#17488]) +3 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-glk10:        NOTRUN -> [SKIP][580] ([i915#17488]) +1 other test skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          NOTRUN -> [SKIP][581] ([i915#5190]) +4 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][582] ([i915#17432] / [i915#5289]) +1 other test skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][583] ([i915#12755] / [i915#15867] / [i915#5190])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][584] ([i915#17432] / [i915#5289])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu:         NOTRUN -> [SKIP][585] ([i915#17432] / [i915#5289]) +1 other test skip
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][586] ([i915#15867])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk10:        NOTRUN -> [ABORT][587] ([i915#13179]) +1 other test abort
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][588] ([i915#13179]) +1 other test abort
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-rkl:          NOTRUN -> [SKIP][589] ([i915#8623])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][590] ([i915#8623])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglu:         NOTRUN -> [SKIP][591] ([i915#17445])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][592] ([i915#12276] / [i915#13356])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][593] ([i915#9906])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_vrr@flip-basic-fastset.html
    - shard-tglu:         NOTRUN -> [SKIP][594] ([i915#9906]) +1 other test skip
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_vrr@flip-basic-fastset.html
    - shard-mtlp:         NOTRUN -> [SKIP][595] ([i915#8808] / [i915#9906])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-glk:          NOTRUN -> [SKIP][596] ([i915#17520])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_vrr@flipline.html
    - shard-dg2:          NOTRUN -> [SKIP][597] ([i915#15243] / [i915#3555])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          NOTRUN -> [SKIP][598] ([i915#9906])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_vrr@max-min.html
    - shard-dg1:          NOTRUN -> [SKIP][599] ([i915#9906])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_vrr@max-min.html
    - shard-glk10:        NOTRUN -> [SKIP][600] ([i915#17520])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][601] ([i915#14544] / [i915#9906])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@perf@gen12-group-exclusive-stream-sample-oa:
    - shard-glk:          NOTRUN -> [SKIP][602] ([i915#17536])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@perf@gen12-group-exclusive-stream-sample-oa.html

  * igt@perf@global-sseu-config-invalid:
    - shard-dg2:          NOTRUN -> [SKIP][603] ([i915#7387])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@perf@global-sseu-config-invalid.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][604] ([i915#9100]) +1 other test fail
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-glk11:        NOTRUN -> [SKIP][605] ([i915#17704])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@perf@per-context-mode-unprivileged.html
    - shard-rkl:          NOTRUN -> [SKIP][606] ([i915#2435])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][607] ([i915#17455] / [i915#2433]) +1 other test skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-50@bcs0:
    - shard-rkl:          [PASS][608] -> [FAIL][609] ([i915#4349]) +3 other tests fail
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@perf_pmu@busy-accuracy-50@bcs0.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@perf_pmu@busy-accuracy-50@bcs0.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-mtlp:         [PASS][610] -> [FAIL][611] ([i915#4349])
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@event-wait:
    - shard-glk:          NOTRUN -> [SKIP][612] ([i915#17698]) +1 other test skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@perf_pmu@event-wait.html

  * igt@perf_pmu@module-unload:
    - shard-rkl:          NOTRUN -> [FAIL][613] ([i915#17119])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@perf_pmu@module-unload.html

  * igt@prime_udl@share-import:
    - shard-mtlp:         NOTRUN -> [SKIP][614] ([i915#16420])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@prime_udl@share-import.html

  * igt@prime_udl@share-import-addfb:
    - shard-glk10:        NOTRUN -> [SKIP][615] ([i915#16420])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@prime_udl@share-import-addfb.html
    - shard-dg2:          NOTRUN -> [SKIP][616] ([i915#16420])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@prime_udl@share-import-addfb.html
    - shard-rkl:          NOTRUN -> [SKIP][617] ([i915#16420])
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][618] ([i915#3708]) +4 other tests skip
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][619] ([i915#17448] / [i915#3291] / [i915#3708]) +1 other test skip
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][620] ([i915#3708] / [i915#4077])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][621] ([i915#3291] / [i915#3708])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][622] ([i915#3708] / [i915#4077]) +2 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][623] ([i915#17429] / [i915#17448] / [i915#3708])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-dg2:          NOTRUN -> [SKIP][624] ([i915#3708]) +2 other tests skip
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@prime_vgem@fence-read-hang.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-mtlp:         [FAIL][625] ([i915#17176]) -> [PASS][626] +1 other test pass
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3@vcs1.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [INCOMPLETE][627] ([i915#13390] / [i915#17327]) -> [PASS][628]
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_eio@in-flight-suspend.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@kms:
    - shard-rkl:          [DMESG-WARN][629] ([i915#13363]) -> [PASS][630]
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@gem_eio@kms.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@gem_eio@kms.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - shard-dg2:          [INCOMPLETE][631] ([i915#13356]) -> [PASS][632]
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-4/igt@gem_exec_suspend@basic-s0@lmem0.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [INCOMPLETE][633] ([i915#13356]) -> [PASS][634] +1 other test pass
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [INCOMPLETE][635] ([i915#13356] / [i915#17880]) -> [PASS][636]
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@gem_workarounds@suspend-resume-fd.html
    - shard-mtlp:         [FAIL][637] ([i915#17151]) -> [PASS][638]
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-8/igt@gem_workarounds@suspend-resume-fd.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_selftest@perf:
    - shard-tglu:         [ABORT][639] ([i915#17018]) -> [PASS][640] +1 other test pass
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-tglu-3/igt@i915_selftest@perf.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@i915_selftest@perf.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [INCOMPLETE][641] ([i915#13356] / [i915#16182] / [i915#4817]) -> [PASS][642]
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-glk8/igt@i915_suspend@sysfs-reader.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@i915_suspend@sysfs-reader.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:
    - shard-mtlp:         [FAIL][643] ([i915#17150]) -> [PASS][644]
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
    - shard-mtlp:         [INCOMPLETE][645] ([i915#17037]) -> [PASS][646] +1 other test pass
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][647] ([i915#15733] / [i915#5138]) -> [PASS][648]
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][649] ([i915#13566]) -> [PASS][650] +3 other tests pass
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          [FAIL][651] ([i915#13566]) -> [PASS][652]
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          [SKIP][653] ([i915#3555]) -> [PASS][654]
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg1:          [FAIL][655] ([i915#13027]) -> [PASS][656]
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg1-19/igt@kms_flip@flip-vs-expired-vblank.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][657] ([i915#15989]) -> [PASS][658] +3 other tests pass
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][659] ([i915#15989]) -> [PASS][660] +6 other tests pass
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-glk:          [SKIP][661] ([i915#17517]) -> [PASS][662] +10 other tests pass
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-glk3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          [SKIP][663] ([i915#16518] / [i915#3555] / [i915#8228]) -> [PASS][664]
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-6/igt@kms_hdr@bpc-switch.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-rkl:          [SKIP][665] ([i915#16644] / [i915#3555] / [i915#8228]) -> [PASS][666]
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_hdr@invalid-metadata-sizes.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-rkl:          [INCOMPLETE][667] ([i915#16943]) -> [PASS][668]
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-rkl:          [INCOMPLETE][669] ([i915#12276]) -> [PASS][670]
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][671] ([i915#12276] / [i915#13356]) -> [PASS][672]
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-glk8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [INCOMPLETE][673] ([i915#13520]) -> [PASS][674]
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@perf_pmu@rc6-suspend.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          [SKIP][675] ([i915#6230]) -> [SKIP][676] ([i915#14544] / [i915#6230])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@api_intel_bb@crc32.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          [SKIP][677] ([i915#8411]) -> [SKIP][678] ([i915#14544] / [i915#8411])
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@api_intel_bb@object-reloc-purge-cache.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-mtlp:         [FAIL][679] ([i915#17176]) -> [INCOMPLETE][680] ([i915#13356] / [i915#17244]) +1 other test incomplete
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          [SKIP][681] ([i915#14544] / [i915#280]) -> [SKIP][682] ([i915#280])
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          [SKIP][683] ([i915#14544] / [i915#3281]) -> [SKIP][684] ([i915#3281]) +3 other tests skip
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - shard-rkl:          [SKIP][685] ([i915#3281]) -> [SKIP][686] ([i915#14544] / [i915#3281]) +4 other tests skip
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@gem_exec_reloc@basic-wc-cpu.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_lmem_swapping@massive:
    - shard-rkl:          [SKIP][687] ([i915#4613]) -> [SKIP][688] ([i915#14544] / [i915#4613])
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@gem_lmem_swapping@massive.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@gem_lmem_swapping@massive.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-rkl:          [SKIP][689] ([i915#14544] / [i915#3282]) -> [SKIP][690] ([i915#3282]) +1 other test skip
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [SKIP][691] ([i915#13717]) -> [SKIP][692] ([i915#13717] / [i915#14544])
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-context.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-rkl:          [SKIP][693] ([i915#3282]) -> [SKIP][694] ([i915#14544] / [i915#3282])
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@gem_readwrite@read-bad-handle.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [SKIP][695] ([i915#14544] / [i915#8411]) -> [SKIP][696] ([i915#8411])
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-rkl:          [SKIP][697] ([i915#14544] / [i915#3297]) -> [SKIP][698] ([i915#3297])
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-rkl:          [SKIP][699] ([i915#14544] / [i915#17455]) -> [SKIP][700] ([i915#17455]) +1 other test skip
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gen7_exec_parse@cmd-crossing-page.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-rkl:          [SKIP][701] ([i915#2527]) -> [SKIP][702] ([i915#14544] / [i915#2527]) +1 other test skip
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@gen9_exec_parse@basic-rejected-ctx-param.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-rkl:          [SKIP][703] ([i915#15678]) -> [SKIP][704] ([i915#14544] / [i915#15678])
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@gpu_buddy@gpu_buddy.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          [SKIP][705] ([i915#14544] / [i915#15479]) -> [SKIP][706] ([i915#15479]) +4 other tests skip
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][707] ([i915#8399]) -> [SKIP][708] ([i915#14544] / [i915#8399])
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [ABORT][709] ([i915#17844]) -> [INCOMPLETE][710] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-11/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          [SKIP][711] ([i915#6590]) -> [SKIP][712] ([i915#14544] / [i915#6590]) +1 other test skip
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][713] ([i915#5723]) -> [SKIP][714] ([i915#14544] / [i915#5723])
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@i915_query@test-query-geometry-subslices.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          [SKIP][715] ([i915#4538] / [i915#5286]) -> [SKIP][716] ([i915#14544] / [i915#4538] / [i915#5286])
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][717] ([i915#5286]) -> [SKIP][718] ([i915#14544] / [i915#5286])
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          [SKIP][719] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][720] ([i915#4538] / [i915#5286])
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][721] ([i915#14544] / [i915#3828]) -> [SKIP][722] ([i915#3828])
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][723] ([i915#3828]) -> [SKIP][724] ([i915#14544] / [i915#3828])
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-rkl:          [SKIP][725] ([i915#17431] / [i915#3638]) -> [SKIP][726] ([i915#14544] / [i915#17431] / [i915#3638])
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          [SKIP][727] ([i915#14544] / [i915#4538]) -> [SKIP][728] ([i915#4538]) +1 other test skip
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          [SKIP][729] ([i915#4538]) -> [SKIP][730] ([i915#14544] / [i915#4538]) +2 other tests skip
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][731] ([i915#6095]) -> [SKIP][732] ([i915#14544] / [i915#6095]) +5 other tests skip
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][733] ([i915#14544] / [i915#6095]) -> [SKIP][734] ([i915#6095]) +2 other tests skip
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][735] ([i915#17158]) -> [INCOMPLETE][736] ([i915#15582]) +1 other test incomplete
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][737] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][738] ([i915#14098] / [i915#6095]) +5 other tests skip
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][739] ([i915#14098] / [i915#6095]) -> [SKIP][740] ([i915#14098] / [i915#14544] / [i915#6095]) +8 other tests skip
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - shard-rkl:          [SKIP][741] ([i915#14544] / [i915#17427]) -> [SKIP][742] ([i915#17427]) +1 other test skip
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-rkl:          [SKIP][743] ([i915#11151] / [i915#7828]) -> [SKIP][744] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_chamelium_frames@dp-crc-fast.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][745] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][746] ([i915#11151] / [i915#7828]) +2 other tests skip
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-rkl:          [SKIP][747] ([i915#14544] / [i915#15330]) -> [SKIP][748] ([i915#15330])
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-rkl:          [SKIP][749] ([i915#14544] / [i915#15865]) -> [SKIP][750] ([i915#15865]) +2 other tests skip
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-dg2:          [SKIP][751] ([i915#15865]) -> [FAIL][752] ([i915#15539])
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-4/igt@kms_content_protection@lic-type-0-hdcp14.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-rkl:          [SKIP][753] ([i915#15865]) -> [SKIP][754] ([i915#14544] / [i915#15865])
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_content_protection@uevent-hdcp14.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          [SKIP][755] ([i915#13049]) -> [SKIP][756] ([i915#13049] / [i915#14544]) +1 other test skip
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          [SKIP][757] ([i915#3555]) -> [SKIP][758] ([i915#14544] / [i915#3555])
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          [SKIP][759] ([i915#13049]) -> [SKIP][760] ([i915#13049] / [i915#3359])
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][761] ([i915#4103]) -> [SKIP][762] ([i915#14544] / [i915#4103]) +1 other test skip
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-rkl:          [SKIP][763] ([i915#14544] / [i915#17287]) -> [SKIP][764] ([i915#17287])
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          [SKIP][765] ([i915#13748]) -> [SKIP][766] ([i915#13748] / [i915#14544])
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-rkl:          [SKIP][767] ([i915#17285]) -> [SKIP][768] ([i915#14544] / [i915#17285])
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst-direct-train.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-rkl:          [SKIP][769] ([i915#16361]) -> [SKIP][770] ([i915#14544] / [i915#16361])
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-rkl:          [SKIP][771] ([i915#14544] / [i915#16361]) -> [SKIP][772] ([i915#16361]) +1 other test skip
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          [SKIP][773] ([i915#14544] / [i915#9934]) -> [SKIP][774] ([i915#9934])
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_flip@2x-plain-flip.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          [SKIP][775] ([i915#9934]) -> [SKIP][776] ([i915#14544] / [i915#9934]) +2 other tests skip
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-rkl:          [SKIP][777] ([i915#14544] / [i915#15643]) -> [SKIP][778] ([i915#15643])
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][779] ([i915#15643]) -> [SKIP][780] ([i915#14544] / [i915#15643]) +1 other test skip
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-mtlp:         [SKIP][781] ([i915#15672]) -> [SKIP][782] ([i915#17452])
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][783] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][784] ([i915#17428] / [i915#1825]) +2 other tests skip
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][785] ([i915#17428] / [i915#1825]) -> [SKIP][786] ([i915#14544] / [i915#17428] / [i915#1825])
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][787] ([i915#17428]) -> [SKIP][788] ([i915#14544] / [i915#17428]) +31 other tests skip
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-rkl:          [SKIP][789] ([i915#15989]) -> [INCOMPLETE][790] ([i915#16056])
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][791] ([i915#14544] / [i915#15102]) -> [SKIP][792] ([i915#15102]) +13 other tests skip
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][793] ([i915#15102]) -> [SKIP][794] ([i915#14544] / [i915#15102]) +14 other tests skip
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          [SKIP][795] ([i915#14544] / [i915#17428]) -> [SKIP][796] ([i915#17428]) +24 other tests skip
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          [SKIP][797] ([i915#14544] / [i915#5439]) -> [SKIP][798] ([i915#5439])
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-rkl:          [ABORT][799] ([i915#15132]) -> [FAIL][800] ([i915#17122] / [i915#17137])
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][801] ([i915#12713] / [i915#16644]) -> [SKIP][802] ([i915#14544] / [i915#16644])
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          [SKIP][803] ([i915#13688]) -> [SKIP][804] ([i915#13688] / [i915#14544])
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@kms_joiner@basic-max-non-joiner.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          [SKIP][805] ([i915#15459]) -> [SKIP][806] ([i915#14544] / [i915#15459])
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-rkl:          [SKIP][807] ([i915#17455]) -> [SKIP][808] ([i915#14544] / [i915#17455])
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-rkl:          [SKIP][809] ([i915#15709]) -> [SKIP][810] ([i915#14544] / [i915#15709]) +1 other test skip
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          [SKIP][811] ([i915#13958]) -> [SKIP][812] ([i915#13958] / [i915#14544])
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-y.html
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          [SKIP][813] ([i915#15329] / [i915#17832] / [i915#3555]) -> [SKIP][814] ([i915#14544] / [i915#15329] / [i915#17832] / [i915#3555])
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          [SKIP][815] ([i915#15329]) -> [SKIP][816] ([i915#14544] / [i915#15329]) +1 other test skip
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:
    - shard-rkl:          [SKIP][817] ([i915#15329] / [i915#17832]) -> [SKIP][818] ([i915#14544] / [i915#15329] / [i915#17832])
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f:
    - shard-rkl:          [SKIP][819] ([i915#17843]) -> [SKIP][820] ([i915#14544] / [i915#17843]) +8 other tests skip
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f.html
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          [SKIP][821] ([i915#14544] / [i915#15948]) -> [SKIP][822] ([i915#15948])
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          [SKIP][823] ([i915#15948]) -> [SKIP][824] ([i915#14544] / [i915#15948])
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          [SKIP][825] ([i915#11520]) -> [SKIP][826] ([i915#11520] / [i915#14544]) +3 other tests skip
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][827] ([i915#11520] / [i915#14544]) -> [SKIP][828] ([i915#11520]) +2 other tests skip
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-rkl:          [SKIP][829] ([i915#1072] / [i915#9732]) -> [SKIP][830] ([i915#1072] / [i915#14544] / [i915#9732]) +9 other tests skip
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_psr@fbc-psr-cursor-blt.html
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-rkl:          [SKIP][831] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][832] ([i915#1072] / [i915#9732]) +7 other tests skip
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_psr@fbc-psr-primary-page-flip.html
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-rkl:          [SKIP][833] ([i915#15949]) -> [SKIP][834] ([i915#14544] / [i915#15949])
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][835] ([i915#17432] / [i915#5289]) -> [SKIP][836] ([i915#14544] / [i915#17432] / [i915#5289])
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          [SKIP][837] ([i915#14544] / [i915#17448] / [i915#3708]) -> [SKIP][838] ([i915#17448] / [i915#3708])
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@prime_vgem@fence-write-hang.html
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@prime_vgem@fence-write-hang.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15539
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804
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
  [i915#16084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16943
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17018]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17018
  [i915#17037]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17037
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119
  [i915#17122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122
  [i915#17137]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17137
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17151
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17244]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17244
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17288]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288
  [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17292
  [i915#17327]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17429]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429
  [i915#17430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433
  [i915#17444]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444
  [i915#17445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17452]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17456]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
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
  [i915#17506]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17506
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17509]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17511]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511
  [i915#17512]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17523]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
  [i915#17527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17530]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17530
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17535]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17535
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17538
  [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17548
  [i915#17549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17549
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
  [i915#17554]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554
  [i915#17555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555
  [i915#17556]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17556
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17568]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568
  [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
  [i915#17570]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17570
  [i915#17573]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17573
  [i915#17575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17575
  [i915#17577]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17577
  [i915#17625]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17625
  [i915#17664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17664
  [i915#17666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17666
  [i915#17668]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17668
  [i915#17688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17698]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17698
  [i915#17704]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704
  [i915#17706]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17706
  [i915#17710]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17710
  [i915#17711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17711
  [i915#17799]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17799
  [i915#17832]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832
  [i915#17833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17833
  [i915#17843]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843
  [i915#17844]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844
  [i915#17854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17854
  [i915#17878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17878
  [i915#17880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17880
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
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
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
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
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9204 -> IGTPW_16212
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_19611: 01f73ffa8189526c8c33d591371ea89803fa6e2e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16212: 45ad0b8c52c07c3a769cb72d5c5faaa727b0db74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/index.html

--===============6390289076657475156==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/9] lib/igt_drm_ras_nl: Add node and error counter listing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179564/">https://patchwork.freedesktop.org/series/179564/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19611_full -&gt; IGTPW_16212_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/index.html</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): shard-snb pig-kbl-iris </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19611_full and IGTPW_16212_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-4:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16212_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17854">i915#17854</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17854">i915#17854</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17854">i915#17854</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-10/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568">i915#17568</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17530">i915#17530</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@gem_ctx_isolation@preservation-s3@bcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444">i915#17444</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444">i915#17444</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17535">i915#17535</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444">i915#17444</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-1/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_ctx_persistence@legacy-engines-hang@blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527">i915#17527</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496">i915#17496</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17711">i915#17711</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904">i915#16904</a>) +4 other tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904">i915#16904</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@larger-than-life-batch:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@gem_exec_params@larger-than-life-batch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871">i915#16871</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk2/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523">i915#17523</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844">i915#17844</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a>) +1 other test abort</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844">i915#17844</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975">i915#7975</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456">i915#17456</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-10/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@gem_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gem_mmap@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-short:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@gem_mmap_gtt@basic-short.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@close-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@gem_mmap_gtt@close-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_mmap_gtt@zero-extend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@fault-concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-8/igt@gem_mmap_wc@fault-concurrent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_mmap_wc@write-gtt-read-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +9 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-8/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702">i915#14702</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gem_softpin@evict-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551">i915#17551</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430">i915#17430</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433">i915#17433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk5/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-4/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@gen3_mixed_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688">i915#17688</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555">i915#17555</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511">i915#17511</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@gen7_exec_parse@basic-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505">i915#17505</a>) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@gen7_exec_parse@basic-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +8 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@gen7_exec_parse@basic-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@gen7_exec_parse@basic-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vecs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@i915_drm_fdinfo@most-busy-check-all@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@i915_drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@i915_drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526">i915#17526</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17706">i915#17706</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-3/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@i915_pm_rps@thresholds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@i915_pm_rps@thresholds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@i915_query@query-topology-unsupported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-glk9/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk5/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@i915_suspend@sysfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844">i915#17844</a>) +13 other tests abort</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17668">i915#17668</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17485">i915#17485</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-tglu-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662">i915#15662</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17556">i915#17556</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk2/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-4/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +93 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +141 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +119 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525">i915#17525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +93 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550">i915#17550</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017">i915#16017</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550">i915#17550</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-1/igt@kms_color_pipeline@plane-ctm3x4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@kms_color_pipeline@plane-ctm3x4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-5:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502">i915#17502</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15539">i915#15539</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_cursor_crc@cursor-random-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-tglu-3/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17549">i915#17549</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17486">i915#17486</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17487">i915#17487</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17538">i915#17538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17664">i915#17664</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288">i915#17288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17506">i915#17506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477">i915#17477</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17292">i915#17292</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17625">i915#17625</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17548">i915#17548</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084">i915#16084</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084">i915#16084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17666">i915#17666</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk2/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17570">i915#17570</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539">i915#17539</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-5/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +9 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-5/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-8/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk5/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559">i915#17559</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-11/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +121 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +59 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +104 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102">i915#17102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-11/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567">i915#17567</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17575">i915#17575</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512">i915#17512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17577">i915#17577</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +2 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540">i915#17540</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@kms_pipe_crc_basic@suspend-read-crc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844">i915#17844</a>) +16 other tests abort</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17799">i915#17799</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17799">i915#17799</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705">i915#13705</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509">i915#17509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-yuyv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17833">i915#17833</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-2-y210:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-2-y210.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#17843</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-1-xv36:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-1-xv36.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#17843</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-4-xv36:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-4-xv36.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#17843</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-b-hdmi-a-1-rgb565:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-b-hdmi-a-1-rgb565.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#17843</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-b-hdmi-a-1-xyuv8888:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled@pipe-b-hdmi-a-1-xyuv8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17878">i915#17878</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-7/igt@kms_plane_scaling@plane-upscale-max-crc-4-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled@pipe-b-hdmi-a-1-rgb565:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled@pipe-b-hdmi-a-1-rgb565.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#17843</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17495">i915#17495</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">i915#17564</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17573">i915#17573</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-10/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17710">i915#17710</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_pm_rpm@system-suspend-modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#10553</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844">i915#17844</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_pm_rpm@system-suspend-modeset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#10553</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844">i915#17844</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569">i915#17569</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569">i915#17569</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_properties@colorop-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-19/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk4/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-3/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488">i915#17488</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488">i915#17488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_vblank@ts-continuation-suspend@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i915#17520</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-4/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-18/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@perf@gen12-group-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@perf@global-sseu-config-invalid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100">i915#9100</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk11/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704">i915#17704</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@perf_pmu@busy-accuracy-50@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@perf_pmu@busy-accuracy-50@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk1/igt@perf_pmu@event-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17698">i915#17698</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@perf_pmu@module-unload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119">i915#17119</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk10/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-14/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-6/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429">i915#17429</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-7/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176">i915#17176</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3@vcs1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327">i915#17327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-4/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-3/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@gem_exec_suspend@basic-s3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17880">i915#17880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-8/igt@gem_workarounds@suspend-resume-fd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17151">i915#17151</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-2/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-tglu-3/igt@i915_selftest@perf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17018">i915#17018</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-9/igt@i915_selftest@perf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-glk8/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk9/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150">i915#17150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17037">i915#17037</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-tglu-8/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg1-19/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg1-15/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-glk3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-6/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_hdr@bpc-switch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16943">i915#16943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_vblank@ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-glk8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-glk3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176">i915#17176</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17244">i915#17244</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@gem_lmem_swapping@massive.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@gem_lmem_swapping@massive.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@i915_module_load@fault-injection@__uc_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-11/igt@i915_pm_freq_api@freq-suspend@gt0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844">i915#17844</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-4/igt@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_content_protection@lic-type-0-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15539">i915#15539</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287">i915#17287</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-mtlp-4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122">i915#17122</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17137">i915#17137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#17843</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-2-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#17843</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-4/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-5/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19611/shard-rkl-6/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16212/shard-rkl-7/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9204 -&gt; IGTPW_16212</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19611: 01f73ffa8189526c8c33d591371ea89803fa6e2e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16212: 45ad0b8c52c07c3a769cb72d5c5faaa727b0db74 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============6390289076657475156==--
