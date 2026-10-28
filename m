Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1AA606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 01:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54F210F8C9;
	Wed, 28 Oct 2026 01:40:53 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAF310F8C9;
 Wed, 28 Oct 2026 01:39:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6110917199456614360=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_xe/shaders=3A_remove_exp?=
 =?utf-8?q?licit_regioning_and_channel_offsets?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Oct 2026 01:39:59 -0000
Message-ID: <179315159993.79577.4632898503287473890@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261027-remove_gpu_asm_annotations-v1-1-55a0fb61b96d@intel.com>
In-Reply-To: <20261027-remove_gpu_asm_annotations-v1-1-55a0fb61b96d@intel.com>
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

--===============6110917199456614360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe/shaders: remove explicit regioning and channel offsets
URL   : https://patchwork.freedesktop.org/series/176973/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19400_full -> IGTPW_16054_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16054_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16054_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16054_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf@blocking@1-vcs1:
    - shard-mtlp:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@perf@blocking@1-vcs1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_19400_full and IGTPW_16054_full:

### New IGT tests (1) ###

  * igt@kms_cursor_crc@cursor-random-64x64@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.70] s

  

Known issues
------------

  Here are the changes found in IGTPW_16054_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@bb-with-allocator:
    - shard-snb:          NOTRUN -> [SKIP][2] ([i915#17684])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb5/igt@api_intel_bb@bb-with-allocator.html

  * igt@drm_read@short-buffer-block:
    - shard-dg2:          [PASS][3] -> [SKIP][4] ([i915#17359])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-6/igt@drm_read@short-buffer-block.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@drm_read@short-buffer-block.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#7697])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#3936])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@gem_busy@semaphore.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#4873])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@gem_caching@writes.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-glk:          NOTRUN -> [SKIP][8] ([i915#17499])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@gem_ccs@block-multicopy-inplace.html
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-glk10:        NOTRUN -> [SKIP][10] ([i915#17499])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][11] -> [INCOMPLETE][12] ([i915#13356] / [i915#16348]) +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@gem_ccs@suspend-resume.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-glk:          NOTRUN -> [SKIP][13] ([i915#17568])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk8/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#7697])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_compute@compute-square:
    - shard-glk:          NOTRUN -> [SKIP][15] ([i915#17552])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk9/igt@gem_compute@compute-square.html

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-mtlp:         [PASS][16] -> [FAIL][17] ([i915#17176])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3@vcs1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-glk10:        NOTRUN -> [SKIP][18] ([i915#17535])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - shard-glk10:        NOTRUN -> [SKIP][19] ([i915#17527])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8555])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][21] ([i915#1099]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb1/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#280]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][24] ([i915#13356] / [i915#13390])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#4771])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@gem_exec_balancer@bonded-dual.html
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#4771])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@gem_exec_balancer@bonded-dual.html
    - shard-snb:          NOTRUN -> [SKIP][27] ([i915#17587])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb5/igt@gem_exec_balancer@bonded-dual.html
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#4771])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#4812])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@fairslice:
    - shard-glk:          NOTRUN -> [SKIP][30] ([i915#17547])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-glk10:        NOTRUN -> [SKIP][31] ([i915#17547])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#4525])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [FAIL][33] ([i915#15816])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture:
    - shard-snb:          NOTRUN -> [SKIP][34] ([i915#17610])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb4/igt@gem_exec_capture@capture.html
    - shard-mtlp:         NOTRUN -> [FAIL][35] ([i915#16904]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-glk:          NOTRUN -> [SKIP][36] ([i915#17711])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][37] ([i915#16904]) +4 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][38] ([i915#17571])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#3539] / [i915#4852]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#5107])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@gem_exec_params@rsvd2-dirt.html
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#17453])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#17453])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglu-1:       NOTRUN -> [SKIP][44] ([i915#17416])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@gem_exec_params@secure-non-master.html
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#17416])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#17416])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#14544] / [i915#3281])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#3281]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#3281]) +12 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3281]) +11 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3281]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4812]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4860]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_gpgpu_fill@offset-16x16:
    - shard-snb:          NOTRUN -> [SKIP][54] ([i915#17608])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb1/igt@gem_gpgpu_fill@offset-16x16.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#2190])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@gem_huc_copy@huc-copy.html
    - shard-glk10:        NOTRUN -> [SKIP][56] ([i915#17456])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#4613] / [i915#7582])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#12193])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4565])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][60] ([i915#17503] / [i915#4613]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][61] ([i915#4613]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#4613]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-snb:          NOTRUN -> [SKIP][63] ([i915#17503])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb5/igt@gem_lmem_swapping@smem-oom.html
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#4613]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@gem_lmem_swapping@smem-oom.html
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4613]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@gem_lmem_swapping@smem-oom.html
    - shard-glk10:        NOTRUN -> [SKIP][66] ([i915#17503]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_lmem_swapping@smem-oom.html
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#14544] / [i915#4613])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#284])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@gem_media_vme.html
    - shard-tglu-1:       NOTRUN -> [SKIP][69] ([i915#284])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@gem_media_vme.html

  * igt@gem_mmap@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4083]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4077]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html
    - shard-glk:          NOTRUN -> [SKIP][72] ([i915#17572])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@coherency:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#17429])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4077]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4083]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4083]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#3282])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#3282])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#3282]) +11 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][80] ([i915#2658])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4270])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@gem_pxp@create-protected-buffer.html
    - shard-snb:          NOTRUN -> [SKIP][82] ([i915#17521])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb4/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4270]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-glk:          NOTRUN -> [SKIP][84] ([i915#17521]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-glk10:        NOTRUN -> [SKIP][85] ([i915#17521]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#3282]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-snb:          NOTRUN -> [SKIP][87] ([i915#17492])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb7/igt@gem_render_copy@linear-to-vebox-y-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#8428]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@gem_render_copy@linear-to-vebox-y-tiled.html
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#5190] / [i915#8428]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:
    - shard-snb:          NOTRUN -> [SKIP][90] ([i915#17591]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk10:        NOTRUN -> [SKIP][91] ([i915#17492])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][92] ([i915#17492]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#8411]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4079])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#4079]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#17430])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_softpin@full:
    - shard-snb:          NOTRUN -> [SKIP][97] ([i915#17471])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb6/igt@gem_softpin@full.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#15656])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@gem_tiled_pread_basic@basic.html
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#15657])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#17433] / [i915#3297])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#3297]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3297]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#3297] / [i915#3323])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3282] / [i915#3297])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-glk:          NOTRUN -> [SKIP][105] ([i915#17507]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#3281] / [i915#3297])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#3297])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          [PASS][108] -> [INCOMPLETE][109] ([i915#13356])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-8/igt@gem_workarounds@suspend-resume.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@gem_workarounds@suspend-resume.html

  * igt@gen3_mixed_blits:
    - shard-glk10:        NOTRUN -> [SKIP][110] ([i915#17688])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gen3_mixed_blits.html
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#14544] / [i915#17455])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@gen3_mixed_blits.html

  * igt@gen3_render_linear_blits:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#17455]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@gen3_render_linear_blits.html

  * igt@gen3_render_tiledy_blits:
    - shard-glk:          NOTRUN -> [SKIP][113] ([i915#17578])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-glk:          NOTRUN -> [SKIP][114] ([i915#17505]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#17455]) +7 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-glk:          NOTRUN -> [SKIP][116] ([i915#16871]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#2527] / [i915#2856]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#2527]) +6 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@gen9_exec_parse@valid-registers.html
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#2527]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@gen9_exec_parse@valid-registers.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-glk10:        NOTRUN -> [SKIP][120] ([i915#17514])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#14123])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@i915_drm_fdinfo@all-busy-idle-check-all.html
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#14123])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@memory-info-active:
    - shard-snb:          NOTRUN -> [SKIP][123] ([i915#17603])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb1/igt@i915_drm_fdinfo@memory-info-active.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#14073]) +17 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@i915_drm_fdinfo@virtual-busy-hang:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#14118])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@i915_drm_fdinfo@virtual-busy-hang.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#13786])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][127] ([i915#17580]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#7178])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#8399]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq:
    - shard-glk10:        NOTRUN -> [SKIP][130] ([i915#17699]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@i915_pm_freq_mult@media-freq.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#16080] / [i915#16166])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#16080] / [i915#16166])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [PASS][133] -> [FAIL][134] ([i915#12964]) +1 other test fail
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#14498])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-snb:          NOTRUN -> [SKIP][136] ([i915#17473]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb7/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#11681])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@i915_pm_rps@thresholds.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-glk:          NOTRUN -> [SKIP][138] ([i915#17574])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@i915_query@query-topology-known-pci-ids.html
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#16109])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-glk:          NOTRUN -> [SKIP][140] ([i915#17563])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@i915_query@query-topology-unsupported.html
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#16079])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@i915_query@query-topology-unsupported.html
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#16079])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@i915_query@query-topology-unsupported.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [PASS][143] -> [INCOMPLETE][144] ([i915#13356] / [i915#16182] / [i915#4817])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-glk1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][145] ([i915#13356] / [i915#16182] / [i915#4817])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#7707])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][147] ([i915#4212]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#12454] / [i915#12712])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-glk:          [PASS][149] -> [FAIL][150] ([i915#14888])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][151] ([i915#12761] / [i915#13356])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][152] ([i915#12761] / [i915#13356] / [i915#14995])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#1769] / [i915#3555])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#4538] / [i915#5286]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#17431]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#14544] / [i915#4538] / [i915#5286])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#17432] / [i915#5286]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
    - shard-glk10:        NOTRUN -> [SKIP][158] ([i915#17478]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][159] ([i915#17478]) +8 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
    - shard-snb:          NOTRUN -> [SKIP][160] ([i915#17478]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#17432] / [i915#5286]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#5286])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#5286])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#4538] / [i915#5286]) +8 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][165] -> [FAIL][166] ([i915#15733] / [i915#5138])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][167] ([i915#17500]) +6 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk9/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#17431]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#17431] / [i915#3638]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#17431]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#17431]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#3828]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#3828]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-snb:          NOTRUN -> [SKIP][174] ([i915#17500])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#3638]) +3 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#6187])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-glk:          NOTRUN -> [DMESG-WARN][177] ([i915#118])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#4538] / [i915#5190]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#4538]) +6 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#17432]) +5 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#17432])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#17432]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#17432]) +5 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#17432]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#4538]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#14098] / [i915#14544] / [i915#6095]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#12313]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#6095]) +89 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-glk:          NOTRUN -> [SKIP][189] ([i915#17490] / [i915#17491]) +33 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#10307] / [i915#6095]) +73 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#12313])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-snb:          NOTRUN -> [SKIP][192] ([i915#17594]) +5 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#14544] / [i915#6095]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#6095]) +39 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][195] ([i915#17491]) +96 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][196] ([i915#17491]) +44 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-glk:          NOTRUN -> [SKIP][197] ([i915#17525]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][198] ([i915#17490] / [i915#17491]) +17 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#6095]) +69 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#12805])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1:
    - shard-mtlp:         [PASS][201] -> [FAIL][202] ([i915#17158])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         [PASS][203] -> [INCOMPLETE][204] ([i915#15582])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#6095]) +15 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [INCOMPLETE][206] ([i915#15582])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][207] ([i915#14694] / [i915#15582])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#14098] / [i915#6095]) +66 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][209] ([i915#13356] / [i915#15582]) +1 other test incomplete
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#6095]) +205 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#12313])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#12313])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#6095]) +24 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#10307] / [i915#10434] / [i915#6095])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-glk:          NOTRUN -> [SKIP][215] ([i915#17550])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#3742])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-snb:          NOTRUN -> [SKIP][217] ([i915#17483]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-glk:          NOTRUN -> [SKIP][218] ([i915#17489]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#17427]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-glk10:        NOTRUN -> [SKIP][220] ([i915#17489])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#17427]) +5 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#17427]) +5 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][223] ([i915#17497])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-glk:          NOTRUN -> [SKIP][224] ([i915#17497]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#16471] / [i915#17427])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#16471] / [i915#17427]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#16471] / [i915#17427])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#16471] / [i915#17427]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#16464] / [i915#16471] / [i915#17427]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-glk11:        NOTRUN -> [SKIP][230] ([i915#17483]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk11/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#11151] / [i915#7828]) +10 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#11151] / [i915#7828])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#11151] / [i915#7828]) +12 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#11151] / [i915#7828]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#11151])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#11151])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#11151]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#11151])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-3/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#11151])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#11151] / [i915#7828])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#11151]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-glk:          NOTRUN -> [SKIP][242] ([i915#17483]) +10 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-glk10:        NOTRUN -> [SKIP][243] ([i915#17483]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#11151] / [i915#7828]) +14 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color@ctm-negative:
    - shard-dg2:          [PASS][245] -> [SKIP][246] ([i915#12655] / [i915#17373]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_color@ctm-negative.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_color@ctm-negative.html

  * igt@kms_color@deep-color:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#12655] / [i915#3555])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#16990]) +15 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-dg2:          [PASS][249] -> [SKIP][250] ([i915#15529]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#16990]) +47 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-glk:          NOTRUN -> [SKIP][252] ([i915#17510]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html
    - shard-snb:          NOTRUN -> [SKIP][253] ([i915#17510])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb4/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#16990]) +11 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#16990]) +7 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#16990]) +15 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#16990]) +7 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#15330]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#15330]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#15330] / [i915#3116]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#15330] / [i915#3299])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#15330])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#15330])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-glk:          NOTRUN -> [SKIP][264] ([i915#17502]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#15330] / [i915#3299])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_content_protection@dp-mst-type-1.html
    - shard-snb:          NOTRUN -> [SKIP][266] ([i915#17502])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb4/igt@kms_content_protection@dp-mst-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#15330] / [i915#3116] / [i915#3299])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_content_protection@dp-mst-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#15330] / [i915#3299])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#15865]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-glk10:        NOTRUN -> [SKIP][270] ([i915#17508]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_content_protection@lic-type-0-hdcp14.html
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#14544] / [i915#15865])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#8063] / [i915#9433])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-tglu-1:       NOTRUN -> [SKIP][273] ([i915#15865]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-glk:          NOTRUN -> [SKIP][274] ([i915#17508]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_content_protection@uevent-hdcp14.html
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#15865]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_content_protection@uevent-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#15865])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#3555]) +3 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-glk10:        NOTRUN -> [SKIP][278] ([i915#17504]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][279] ([i915#13049]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][280] ([i915#13566]) +1 other test fail
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][281] -> [FAIL][282] ([i915#13566]) +5 other tests fail
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
    - shard-tglu:         [PASS][283] -> [FAIL][284] ([i915#13566]) +3 other tests fail
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-tglu-4/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#17356]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#13049]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-snb:          NOTRUN -> [SKIP][287] ([i915#17533])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb1/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#13049]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#13049] / [i915#3359])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-glk10:        NOTRUN -> [SKIP][290] ([i915#17533])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          NOTRUN -> [SKIP][291] ([i915#17504]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk4/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-snb:          NOTRUN -> [SKIP][292] ([i915#17504])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#8814])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#13049]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#3555] / [i915#8814])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][296] ([i915#13566])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-glk11:        NOTRUN -> [SKIP][297] ([i915#17504]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk11/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-glk:          NOTRUN -> [SKIP][298] ([i915#17533]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][299] ([i915#12358] / [i915#13356] / [i915#14152] / [i915#7882])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][300] ([i915#12358] / [i915#13356] / [i915#14152])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#17428]) +121 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#17428] / [i915#17454]) +8 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][303] ([i915#17428] / [i915#9809]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#13046] / [i915#17454] / [i915#5354])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#4103])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#9067])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [SKIP][307] ([i915#17457])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-glk10:        NOTRUN -> [SKIP][308] ([i915#17515])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#17289])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#17287])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#17288])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#17286])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#17286])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-glk:          NOTRUN -> [SKIP][314] ([i915#17531])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#13748])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#13748])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#17285])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#17285])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#17285])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-3/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-glk:          NOTRUN -> [SKIP][320] ([i915#17625])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#13707])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#13707])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-snb:          NOTRUN -> [SKIP][323] ([i915#17680])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#13707])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#13707])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#16867])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#8812])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#16361])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#16361]) +4 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
    - shard-snb:          NOTRUN -> [SKIP][330] ([i915#17458])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#16361]) +5 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#16361]) +2 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#16361])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-glk10:        NOTRUN -> [SKIP][334] ([i915#17458]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-glk:          NOTRUN -> [SKIP][335] ([i915#17458]) +4 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk4/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#16361]) +4 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#14544] / [i915#16361])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][338] ([i915#16680])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_fbcon_fbt@psr.html
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#16680])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-glk:          NOTRUN -> [SKIP][340] ([i915#17516])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#2065])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-glk:          NOTRUN -> [SKIP][342] ([i915#17679])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-glk:          NOTRUN -> [SKIP][343] ([i915#17666])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@hdr:
    - shard-glk:          NOTRUN -> [SKIP][344] ([i915#17539])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_feature_discovery@hdr.html
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#16600])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_feature_discovery@hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#16600]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_feature_discovery@hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#16600])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_feature_discovery@hdr.html
    - shard-snb:          NOTRUN -> [SKIP][348] ([i915#17539])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb5/igt@kms_feature_discovery@hdr.html
    - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#16600])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_feature_discovery@hdr.html
    - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#16600])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr1:
    - shard-glk:          NOTRUN -> [SKIP][351] ([i915#17707])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu-1:       NOTRUN -> [SKIP][352] ([i915#658]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#4881])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][354] ([i915#3637] / [i915#9934]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#9934]) +12 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#9934])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#8381])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][358] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][359] ([i915#12745] / [i915#13356] / [i915#17183])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#9934]) +7 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#3637] / [i915#9934]) +7 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#9934])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][363] ([i915#3637] / [i915#9934]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - shard-dg2:          [PASS][364] -> [FAIL][365] ([i915#13027])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2:          [PASS][366] -> [SKIP][367] ([i915#5354]) +7 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-3/igt@kms_flip@flip-vs-suspend.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_flip@flip-vs-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][368] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk9/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][369] ([i915#12745] / [i915#13356] / [i915#17183])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          [PASS][370] -> [SKIP][371] ([i915#3555] / [i915#8813]) +4 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][372] ([i915#17522]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#15643]) +6 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-glk10:        NOTRUN -> [SKIP][374] ([i915#17493])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#15643]) +5 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-glk10:        NOTRUN -> [SKIP][376] ([i915#17522]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][377] ([i915#15643])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-glk10:        NOTRUN -> [SKIP][378] ([i915#17484]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][379] ([i915#17484]) +3 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#15643]) +5 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][381] ([i915#17493])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-rkl:          NOTRUN -> [SKIP][382] ([i915#14544] / [i915#15643]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglu-1:       NOTRUN -> [SKIP][383] ([i915#17452])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg2:          [PASS][384] -> [SKIP][385] ([i915#16708]) +2 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#15104] / [i915#15990])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][387] ([i915#17428]) +84 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#17428] / [i915#1825]) +11 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][389] ([i915#15990] / [i915#8708]) +3 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg2:          [PASS][390] -> [SKIP][391] ([i915#16708] / [i915#5354]) +9 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][392] ([i915#5439])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-dg2:          NOTRUN -> [SKIP][393] ([i915#16708] / [i915#5354]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#15989]) +2 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-glk:          NOTRUN -> [SKIP][395] ([i915#17517]) +50 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][396] ([i915#15989]) +5 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][397] ([i915#15989]) +29 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-glk:          [PASS][398] -> [SKIP][399] ([i915#17517]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-rte:
    - shard-rkl:          [PASS][400] -> [SKIP][401] ([i915#15989]) +5 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][402] ([i915#15991]) +5 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][403] ([i915#15990]) +27 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][404] ([i915#15989]) +28 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
    - shard-rkl:          NOTRUN -> [INCOMPLETE][405] ([i915#16056])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-glk10:        NOTRUN -> [SKIP][406] ([i915#17559])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][407] ([i915#10055])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#15104] / [i915#15990]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][409] ([i915#15102]) +5 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-glk11:        NOTRUN -> [SKIP][410] ([i915#17482]) +4 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-glk10:        NOTRUN -> [SKIP][411] ([i915#17482]) +33 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][412] ([i915#15990] / [i915#8708]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][413] ([i915#15991] / [i915#17428] / [i915#1825]) +9 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][414] ([i915#17428]) +39 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][415] ([i915#15102]) +46 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][416] ([i915#15102]) +20 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][417] ([i915#15990]) +2 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][418] ([i915#17588]) +20 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][419] ([i915#17559]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][420] ([i915#5439])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][421] ([i915#15989]) +17 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][422] ([i915#16708]) +4 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][423] ([i915#15990]) +2 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][424] ([i915#17428]) +107 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
    - shard-snb:          NOTRUN -> [SKIP][425] ([i915#17517]) +5 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb4/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][426] ([i915#9766])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu:         NOTRUN -> [SKIP][427] ([i915#9766])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-glk:          NOTRUN -> [SKIP][428] ([i915#17534])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][429] ([i915#15102]) +64 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][430] ([i915#15991] / [i915#5354]) +2 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][431] ([i915#17482]) +123 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][432] ([i915#15990] / [i915#8708]) +19 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-snb:          NOTRUN -> [SKIP][433] ([i915#17482]) +7 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][434] ([i915#15102]) +58 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][435] ([i915#15989]) +19 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-3/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][436] ([i915#14544] / [i915#15102])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][437] ([i915#15991] / [i915#17428]) +17 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][438] ([i915#14544] / [i915#17428]) +4 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_getfb@getfb2-accept-nv12:
    - shard-snb:          NOTRUN -> [SKIP][439] ([i915#17658])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_getfb@getfb2-accept-nv12.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-rkl:          [PASS][440] -> [INCOMPLETE][441] ([i915#17110])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-3/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][442] ([i915#3555] / [i915#8228]) +2 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][443] ([i915#3555] / [i915#8228]) +2 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][444] ([i915#16644] / [i915#3555] / [i915#8228])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-dg2:          [PASS][445] -> [SKIP][446] ([i915#16746] / [i915#3555]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_invalid_mode@uint-max-clock.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][447] ([i915#15460])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][448] ([i915#17678])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][449] ([i915#15458])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][450] ([i915#13688])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][451] ([i915#15458])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][452] ([i915#15459])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-glk10:        NOTRUN -> [SKIP][453] ([i915#17678])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][454] ([i915#15458])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][455] ([i915#15638] / [i915#15722])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-glk:          NOTRUN -> [SKIP][456] ([i915#17579])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_mst@mst-suspend-read-crc.html
    - shard-tglu-1:       NOTRUN -> [SKIP][457] ([i915#16451])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][458] ([i915#15815])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-dg1:          NOTRUN -> [SKIP][459] ([i915#17455]) +5 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-tglu-1:       NOTRUN -> [SKIP][460] ([i915#17455]) +2 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-glk:          NOTRUN -> [SKIP][461] ([i915#17540]) +1 other test skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-dg2:          [PASS][462] -> [SKIP][463] ([i915#11190] / [i915#17356])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-6/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [PASS][464] -> [INCOMPLETE][465] ([i915#12756] / [i915#13476])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][466] -> [INCOMPLETE][467] ([i915#13476])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][468] ([i915#118])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-mtlp:         NOTRUN -> [SKIP][469] ([i915#14712])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][470] ([i915#118] / [i915#16396])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-rkl:          NOTRUN -> [SKIP][471] ([i915#14712])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-glk:          [PASS][472] -> [DMESG-WARN][473] ([i915#118])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-glk:          NOTRUN -> [SKIP][474] ([i915#17479]) +3 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][475] ([i915#15709]) +8 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][476] ([i915#8825]) +1 other test skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
    - shard-rkl:          NOTRUN -> [SKIP][477] ([i915#15709]) +7 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][478] ([i915#15709]) +2 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][479] ([i915#16386]) +1 other test skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-mtlp:         NOTRUN -> [SKIP][480] ([i915#15709]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][481] ([i915#15709]) +5 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-snb:          NOTRUN -> [SKIP][482] ([i915#17479]) +3 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb7/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
    - shard-dg2:          NOTRUN -> [SKIP][483] ([i915#15709])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4:
    - shard-glk10:        NOTRUN -> [SKIP][484] ([i915#17494]) +1 other test skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-dg2:          [PASS][485] -> [SKIP][486] ([i915#8825]) +1 other test skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_plane@plane-panning-top-left.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk10:        NOTRUN -> [FAIL][487] ([i915#10647] / [i915#12169])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][488] ([i915#10647]) +1 other test fail
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][489] ([i915#10647] / [i915#12177])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][490] ([i915#10647]) +1 other test fail
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][491] ([i915#17586])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          NOTRUN -> [SKIP][492] ([i915#13958])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg1:          NOTRUN -> [SKIP][493] ([i915#13958])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][494] ([i915#17542])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][495] ([i915#14259])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          NOTRUN -> [SKIP][496] ([i915#6953])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-tglu-1:       NOTRUN -> [SKIP][497] ([i915#6953])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-snb:          NOTRUN -> [SKIP][498] ([i915#17528]) +2 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb7/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
    - shard-dg2:          [PASS][499] -> [SKIP][500] ([i915#15329] / [i915#17356] / [i915#9423]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][501] ([i915#15329]) +4 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          [PASS][502] -> [SKIP][503] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-glk:          NOTRUN -> [SKIP][504] ([i915#17529]) +3 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][505] ([i915#15329]) +9 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][506] ([i915#17528]) +3 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2:          [PASS][507] -> [SKIP][508] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-dg2:          [PASS][509] -> [SKIP][510] ([i915#15329]) +14 other tests skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][511] ([i915#17529])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2:          [PASS][512] -> [SKIP][513] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
    - shard-dg2:          [PASS][514] -> [SKIP][515] ([i915#15329] / [i915#17356]) +4 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-glk10:        NOTRUN -> [SKIP][516] ([i915#17462])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-snb:          NOTRUN -> [SKIP][517] ([i915#17462])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_pm_backlight@fade.html
    - shard-tglu:         NOTRUN -> [SKIP][518] ([i915#12343] / [i915#9812]) +2 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-glk:          NOTRUN -> [SKIP][519] ([i915#17462]) +2 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][520] ([i915#12343] / [i915#5354]) +2 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][521] ([i915#13356] / [i915#16938])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk11/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
    - shard-rkl:          [PASS][522] -> [INCOMPLETE][523] ([i915#16943])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-2/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-dg1:          NOTRUN -> [SKIP][524] ([i915#9685])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-glk:          NOTRUN -> [SKIP][525] ([i915#17703])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [FAIL][526] ([i915#16479])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][527] ([i915#15948])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][528] ([i915#15739])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-glk:          NOTRUN -> [SKIP][529] ([i915#17702])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][530] ([i915#8430])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          [PASS][531] -> [SKIP][532] ([i915#15073]) +1 other test skip
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][533] ([i915#15073])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [PASS][534] -> [SKIP][535] ([i915#15073]) +1 other test skip
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-1/igt@kms_pm_rpm@dpms-non-lpsp.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][536] ([i915#4077]) +13 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-glk:          NOTRUN -> [SKIP][537] ([i915#15073])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          NOTRUN -> [SKIP][538] ([i915#15073])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][539] -> [SKIP][540] ([i915#15073])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-tglu:         NOTRUN -> [SKIP][541] ([i915#15073])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglu-1:       NOTRUN -> [SKIP][542] ([i915#17434] / [i915#17450])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@package-g7:
    - shard-rkl:          NOTRUN -> [SKIP][543] ([i915#15403])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][544] ([i915#14419])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg1:          NOTRUN -> [SKIP][545] ([i915#6524])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@d3hot:
    - shard-glk:          NOTRUN -> [SKIP][546] ([i915#17569]) +1 other test skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_prime@d3hot.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][547] ([i915#15347])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_properties@colorop-properties-legacy.html
    - shard-snb:          NOTRUN -> [SKIP][548] ([i915#17481])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_properties@colorop-properties-legacy.html
    - shard-glk:          NOTRUN -> [SKIP][549] ([i915#17481])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][550] ([i915#11520]) +10 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
    - shard-mtlp:         NOTRUN -> [SKIP][551] ([i915#12316]) +5 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][552] ([i915#11520]) +1 other test skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][553] ([i915#11520]) +1 other test skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-tglu:         NOTRUN -> [SKIP][554] ([i915#11520]) +11 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][555] ([i915#11520])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][556] ([i915#11520])
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][557] ([i915#9808])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][558] ([i915#11520] / [i915#14544])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][559] ([i915#11520]) +12 other tests skip
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][560] ([i915#11520]) +9 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu:         NOTRUN -> [SKIP][561] ([i915#9683]) +1 other test skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-glk10:        NOTRUN -> [SKIP][562] ([i915#17546])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_psr2_su@page_flip-p010.html
    - shard-rkl:          NOTRUN -> [SKIP][563] ([i915#14544] / [i915#9683])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][564] ([i915#9683]) +1 other test skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu-1:       NOTRUN -> [SKIP][565] ([i915#9683])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][566] ([i915#9683])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][567] ([i915#9732]) +10 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg1:          NOTRUN -> [SKIP][568] ([i915#1072] / [i915#9732]) +26 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-rkl:          NOTRUN -> [SKIP][569] ([i915#1072] / [i915#14544] / [i915#9732])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][570] ([i915#9732]) +29 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][571] ([i915#9688]) +11 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][572] ([i915#1072] / [i915#9732]) +29 other tests skip
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][573] ([i915#1072] / [i915#9732]) +5 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_psr@psr-cursor-mmap-cpu.html
    - shard-snb:          NOTRUN -> [SKIP][574] ([i915#17480]) +5 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb5/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][575] ([i915#17480] / [i915#9732])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk9/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-glk10:        NOTRUN -> [SKIP][576] ([i915#17480]) +6 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-cursor-render:
    - shard-glk:          NOTRUN -> [SKIP][577] ([i915#17480]) +24 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_psr@psr2-cursor-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][578] ([i915#15949])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk:          NOTRUN -> [INCOMPLETE][579] ([i915#15492] / [i915#16184]) +1 other test incomplete
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][580] ([i915#5289])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][581] ([i915#5289])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-glk10:        NOTRUN -> [SKIP][582] ([i915#17488]) +1 other test skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-dg2:          NOTRUN -> [SKIP][583] ([i915#5190])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-snb:          NOTRUN -> [SKIP][584] ([i915#17488])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][585] ([i915#5289])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][586] ([i915#17432] / [i915#5289]) +1 other test skip
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-glk:          NOTRUN -> [SKIP][587] ([i915#17488]) +2 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-glk:          NOTRUN -> [SKIP][588] ([i915#17501])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][589] ([i915#3555]) +6 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html
    - shard-glk10:        NOTRUN -> [SKIP][590] ([i915#17501])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-mtlp:         NOTRUN -> [ABORT][591] ([i915#13179]) +1 other test abort
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][592] ([i915#15106]) +6 other tests fail
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb1/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][593] ([i915#3555])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-rkl:          NOTRUN -> [SKIP][594] ([i915#3555]) +3 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-snb:          NOTRUN -> [SKIP][595] ([i915#17604])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb5/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][596] ([i915#3555] / [i915#8809])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][597] ([i915#8623])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-glk:          NOTRUN -> [SKIP][598] ([i915#17705])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglu:         NOTRUN -> [SKIP][599] ([i915#17445])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_tv_load_detect@load-detect.html
    - shard-rkl:          NOTRUN -> [SKIP][600] ([i915#17445])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][601] ([i915#12276] / [i915#13356])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-dg2:          [PASS][602] -> [SKIP][603] ([i915#17356]) +54 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-3/igt@kms_vblank@ts-continuation-modeset.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_vblank@ts-continuation-modeset.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][604] ([i915#9906])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-suspend:
    - shard-glk:          NOTRUN -> [SKIP][605] ([i915#17520])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-rkl:          NOTRUN -> [SKIP][606] ([i915#15243] / [i915#3555])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-glk:          NOTRUN -> [SKIP][607] ([i915#17561])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][608] ([i915#11920])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][609] ([i915#11920])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          NOTRUN -> [SKIP][610] ([i915#9906]) +1 other test skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-tglu:         NOTRUN -> [SKIP][611] ([i915#9906]) +1 other test skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-mtlp:         NOTRUN -> [SKIP][612] ([i915#8808] / [i915#9906])
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@blocking:
    - shard-mtlp:         [PASS][613] -> [FAIL][614] ([i915#10538]) +1 other test fail
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-5/igt@perf@blocking.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@perf@blocking.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-glk10:        NOTRUN -> [SKIP][615] ([i915#17536])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@invalid-open-flags:
    - shard-snb:          NOTRUN -> [SKIP][616] ([i915#17592])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-snb5/igt@perf@invalid-open-flags.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][617] ([i915#2434])
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-glk:          NOTRUN -> [SKIP][618] ([i915#17704])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][619] ([i915#2433])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-50@vecs0:
    - shard-tglu:         [PASS][620] -> [FAIL][621] ([i915#4349]) +1 other test fail
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-tglu-10/igt@perf_pmu@busy-accuracy-50@vecs0.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@perf_pmu@busy-accuracy-50@vecs0.html

  * igt@perf_pmu@busy-idle:
    - shard-mtlp:         [PASS][622] -> [FAIL][623] ([i915#4349]) +5 other tests fail
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-7/igt@perf_pmu@busy-idle.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-3/igt@perf_pmu@busy-idle.html

  * igt@perf_pmu@event-wait:
    - shard-mtlp:         NOTRUN -> [SKIP][624] ([i915#8807])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@perf_pmu@event-wait.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][625] ([i915#3555] / [i915#8807])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][626] ([i915#8516])
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][627] ([i915#13356] / [i915#16236])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk10/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-glk:          NOTRUN -> [SKIP][628] ([i915#17583])
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][629] ([i915#8516])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_udl@share-import:
    - shard-glk:          NOTRUN -> [SKIP][630] ([i915#16420])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@prime_udl@share-import.html
    - shard-rkl:          NOTRUN -> [SKIP][631] ([i915#16420])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@prime_udl@share-import.html
    - shard-mtlp:         NOTRUN -> [SKIP][632] ([i915#16420])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@prime_udl@share-import.html

  * igt@prime_udl@share-import-addfb:
    - shard-tglu:         NOTRUN -> [SKIP][633] ([i915#16420])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][634] ([i915#3708]) +2 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][635] ([i915#3708] / [i915#4077]) +1 other test skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@prime_vgem@coherency-gtt.html
    - shard-glk11:        NOTRUN -> [SKIP][636] ([i915#17467])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk11/igt@prime_vgem@coherency-gtt.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-nonblock:
    - shard-dg2:          [SKIP][637] ([i915#17359]) -> [PASS][638]
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@drm_read@short-buffer-nonblock.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@drm_read@short-buffer-nonblock.html

  * igt@fbdev@eof:
    - shard-dg2:          [SKIP][639] ([i915#2582]) -> [PASS][640] +1 other test pass
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@fbdev@eof.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@fbdev@eof.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [FAIL][641] ([i915#9561]) -> [PASS][642] +1 other test pass
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-1/igt@gem_ctx_freq@sysfs@gt0.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_eio@hibernate:
    - shard-mtlp:         [INCOMPLETE][643] ([i915#17190] / [i915#7975]) -> [PASS][644]
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-4/igt@gem_eio@hibernate.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@gem_eio@hibernate.html

  * igt@gem_exec_big@single:
    - shard-rkl:          [FAIL][645] ([i915#16604]) -> [PASS][646]
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-8/igt@gem_exec_big@single.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@gem_exec_big@single.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          [INCOMPLETE][647] ([i915#13356]) -> [PASS][648]
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-glk2/igt@i915_pm_rpm@system-suspend.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_selftest@mock:
    - shard-dg2:          [DMESG-WARN][649] ([i915#14545]) -> [PASS][650]
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@i915_selftest@mock.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@i915_selftest@mock.html
    - shard-dg1:          [DMESG-WARN][651] ([i915#14545]) -> [PASS][652]
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg1-19/igt@i915_selftest@mock.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@i915_selftest@mock.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          [INCOMPLETE][653] ([i915#4817]) -> [PASS][654]
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          [FAIL][655] ([i915#14888]) -> [PASS][656]
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [INCOMPLETE][657] ([i915#15582]) -> [PASS][658]
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_color@background-color:
    - shard-dg2:          [SKIP][659] ([i915#17373]) -> [PASS][660]
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_color@background-color.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_color@background-color.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
    - shard-dg2:          [SKIP][661] ([i915#15529]) -> [PASS][662]
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html

  * igt@kms_cursor_crc@cursor-offscreen-64x64:
    - shard-dg2:          [SKIP][663] ([i915#17356]) -> [PASS][664] +39 other tests pass
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-64x64.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@kms_cursor_crc@cursor-offscreen-64x64.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [FAIL][665] ([i915#13566]) -> [PASS][666] +3 other tests pass
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
    - shard-rkl:          [FAIL][667] ([i915#13566]) -> [PASS][668] +1 other test pass
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-mtlp:         [FAIL][669] ([i915#17157]) -> [PASS][670] +1 other test pass
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-4/igt@kms_cursor_crc@cursor-suspend.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          [SKIP][671] ([i915#1849]) -> [PASS][672]
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:
    - shard-dg2:          [FAIL][673] ([i915#15718]) -> [PASS][674]
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-panning:
    - shard-dg2:          [SKIP][675] ([i915#5354]) -> [PASS][676] +1 other test pass
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_flip@flip-vs-panning.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [INCOMPLETE][677] ([i915#16276] / [i915#6113]) -> [PASS][678] +1 other test pass
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-mtlp:         [ABORT][679] ([i915#17224]) -> [PASS][680] +1 other test pass
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-dg2:          [SKIP][681] ([i915#3555] / [i915#8813]) -> [PASS][682] +1 other test pass
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][683] ([i915#16708]) -> [PASS][684]
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][685] ([i915#16708] / [i915#5354]) -> [PASS][686] +2 other tests pass
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt:
    - shard-rkl:          [SKIP][687] ([i915#15989]) -> [PASS][688] +7 other tests pass
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt:
    - shard-glk:          [SKIP][689] ([i915#17517]) -> [PASS][690] +10 other tests pass
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-glk4/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-dg2:          [SKIP][691] ([i915#16746] / [i915#3555]) -> [PASS][692] +2 other tests pass
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_invalid_mode@bad-vsync-end.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-dg2:          [SKIP][693] ([i915#11190] / [i915#17356]) -> [PASS][694]
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-dg2:          [SKIP][695] ([i915#8825]) -> [PASS][696]
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2:          [SKIP][697] ([i915#15329] / [i915#17356] / [i915#9423]) -> [PASS][698] +3 other tests pass
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:
    - shard-dg2:          [SKIP][699] ([i915#15329]) -> [PASS][700] +14 other tests pass
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:
    - shard-dg2:          [SKIP][701] ([i915#15329] / [i915#17356]) -> [PASS][702] +4 other tests pass
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-dg2:          [SKIP][703] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423]) -> [PASS][704]
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-mtlp:         [INCOMPLETE][705] ([i915#17032]) -> [PASS][706]
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-4/igt@kms_pm_backlight@fade-with-suspend.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-dg2:          [SKIP][707] ([i915#13441]) -> [PASS][708]
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@cursor:
    - shard-tglu:         [ABORT][709] ([i915#10553]) -> [PASS][710]
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-tglu-5/igt@kms_pm_rpm@cursor.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][711] ([i915#15073]) -> [PASS][712] +2 other tests pass
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][713] ([i915#15073]) -> [PASS][714] +1 other test pass
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg1:          [SKIP][715] ([i915#15073]) -> [PASS][716]
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          [INCOMPLETE][717] ([i915#10553] / [i915#13356]) -> [PASS][718]
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-glk5/igt@kms_pm_rpm@system-suspend-modeset.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][719] ([i915#12276] / [i915#13356]) -> [PASS][720]
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-glk3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-dg2:          [SKIP][721] ([i915#17454]) -> [PASS][722]
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@prime_mmap_kms@buffer-sharing.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@prime_mmap_kms@buffer-sharing.html

  
#### Warnings ####

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          [SKIP][723] ([i915#14544] / [i915#3281]) -> [SKIP][724] ([i915#3281]) +5 other tests skip
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][725] ([i915#14544] / [i915#9323]) -> [SKIP][726] ([i915#9323])
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-mtlp:         [FAIL][727] ([i915#17176]) -> [ABORT][728] ([i915#17146]) +1 other test abort
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-rkl:          [SKIP][729] ([i915#17444]) -> [SKIP][730] ([i915#14544] / [i915#17444])
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-5/igt@gem_ctx_param@set-priority-not-supported.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          [SKIP][731] ([i915#4525]) -> [SKIP][732] ([i915#14544] / [i915#4525])
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-7/igt@gem_exec_balancer@parallel-contexts.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_params@secure-non-root:
    - shard-rkl:          [SKIP][733] ([i915#14544] / [i915#17416]) -> [SKIP][734] ([i915#17416])
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@gem_exec_params@secure-non-root.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@gem_exec_params@secure-non-root.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          [SKIP][735] ([i915#4613]) -> [SKIP][736] ([i915#14544] / [i915#4613])
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-rkl:          [SKIP][737] ([i915#14544] / [i915#4613]) -> [SKIP][738] ([i915#4613]) +1 other test skip
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_pread@snoop:
    - shard-rkl:          [SKIP][739] ([i915#14544] / [i915#3282]) -> [SKIP][740] ([i915#3282]) +1 other test skip
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@gem_pread@snoop.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          [WARN][741] ([i915#14702]) -> [WARN][742] ([i915#14702] / [i915#2658])
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-glk2/igt@gem_pwrite@basic-exhaustion.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-rkl:          [SKIP][743] ([i915#14544] / [i915#17430]) -> [SKIP][744] ([i915#17430])
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@gem_softpin@evict-snoop-interruptible.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-rkl:          [SKIP][745] ([i915#3282]) -> [SKIP][746] ([i915#14544] / [i915#3282])
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-7/igt@gem_tiled_partial_pwrite_pread@writes.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-rkl:          [SKIP][747] ([i915#14544] / [i915#17455]) -> [SKIP][748] ([i915#17455]) +3 other tests skip
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@gen7_exec_parse@basic-rejected.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          [SKIP][749] ([i915#2527]) -> [SKIP][750] ([i915#14544] / [i915#2527]) +1 other test skip
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-3/igt@gen9_exec_parse@shadow-peek.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-rkl:          [SKIP][751] ([i915#14544] / [i915#2527]) -> [SKIP][752] ([i915#2527])
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          [SKIP][753] ([i915#6590]) -> [SKIP][754] ([i915#14544] / [i915#6590]) +1 other test skip
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          [INCOMPLETE][755] ([i915#13356]) -> [ABORT][756] ([i915#15060])
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-4/igt@i915_pm_rpm@system-suspend.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          [SKIP][757] ([i915#1769] / [i915#3555]) -> [SKIP][758] ([i915#17356]) +1 other test skip
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          [SKIP][759] ([i915#14544] / [i915#1769] / [i915#3555]) -> [SKIP][760] ([i915#1769] / [i915#3555])
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2:          [SKIP][761] ([i915#17356]) -> [SKIP][762] ([i915#17431]) +1 other test skip
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-rkl:          [SKIP][763] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][764] ([i915#4538] / [i915#5286]) +1 other test skip
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          [SKIP][765] ([i915#17431] / [i915#3638]) -> [SKIP][766] ([i915#14544] / [i915#17431] / [i915#3638])
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][767] ([i915#14544] / [i915#3828]) -> [SKIP][768] ([i915#3828])
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          [SKIP][769] ([i915#17356]) -> [SKIP][770] ([i915#3828])
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][771] ([i915#17431]) -> [SKIP][772] ([i915#17356]) +4 other tests skip
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          [SKIP][773] ([i915#17356] / [i915#5190]) -> [SKIP][774] ([i915#4538] / [i915#5190]) +5 other tests skip
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-rkl:          [SKIP][775] ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][776] ([i915#17431] / [i915#3638]) +2 other tests skip
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          [SKIP][777] ([i915#17356] / [i915#5190]) -> [SKIP][778] ([i915#5190]) +3 other tests skip
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          [SKIP][779] ([i915#4538] / [i915#5190]) -> [SKIP][780] ([i915#17356] / [i915#5190]) +17 other tests skip
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][781] ([i915#4538]) -> [SKIP][782] ([i915#14544] / [i915#4538])
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-rkl:          [SKIP][783] ([i915#14544] / [i915#4538]) -> [SKIP][784] ([i915#4538]) +1 other test skip
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][785] ([i915#14098] / [i915#6095]) -> [SKIP][786] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-rkl:          [SKIP][787] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][788] ([i915#14098] / [i915#6095]) +5 other tests skip
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][789] ([i915#12313]) -> [SKIP][790] ([i915#17356])
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2:          [SKIP][791] ([i915#10307] / [i915#6095]) -> [SKIP][792] ([i915#17356]) +12 other tests skip
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][793] ([i915#14544] / [i915#6095]) -> [SKIP][794] ([i915#6095]) +1 other test skip
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-2.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][795] ([i915#17356]) -> [SKIP][796] ([i915#12313]) +2 other tests skip
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          [SKIP][797] ([i915#17356]) -> [SKIP][798] ([i915#10307] / [i915#6095]) +5 other tests skip
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][799] ([i915#6095]) -> [SKIP][800] ([i915#14544] / [i915#6095]) +3 other tests skip
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][801] ([i915#12805]) -> [SKIP][802] ([i915#17356])
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-mtlp:         [FAIL][803] ([i915#17158]) -> [INCOMPLETE][804] ([i915#15582])
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [INCOMPLETE][805] ([i915#15582]) -> [FAIL][806] ([i915#17158])
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2:          [SKIP][807] ([i915#17356]) -> [SKIP][808] ([i915#6095]) +1 other test skip
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [INCOMPLETE][809] ([i915#15582]) -> [INCOMPLETE][810] ([i915#14694] / [i915#15582])
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          [SKIP][811] ([i915#17356]) -> [SKIP][812] ([i915#16017])
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-rkl:          [SKIP][813] ([i915#17427]) -> [SKIP][814] ([i915#14544] / [i915#17427])
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-7/igt@kms_chamelium_color@ctm-negative.html
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-rkl:          [SKIP][815] ([i915#14544] / [i915#17427]) -> [SKIP][816] ([i915#17427]) +2 other tests skip
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-rkl:          [SKIP][817] ([i915#14544] / [i915#16471] / [i915#17427]) -> [SKIP][818] ([i915#16471] / [i915#17427])
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-rkl:          [SKIP][819] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][820] ([i915#11151] / [i915#7828]) +2 other tests skip
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][821] ([i915#11151] / [i915#7828]) -> [SKIP][822] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-dg1:          [SKIP][823] ([i915#15865] / [i915#4423]) -> [SKIP][824] ([i915#15865])
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg1-17/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          [SKIP][825] ([i915#17356]) -> [SKIP][826] ([i915#15330] / [i915#3299])
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg2:          [SKIP][827] ([i915#17356]) -> [SKIP][828] ([i915#15330]) +1 other test skip
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-rkl:          [SKIP][829] ([i915#14544] / [i915#15330]) -> [SKIP][830] ([i915#15330])
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-rkl:          [SKIP][831] ([i915#14544] / [i915#15865]) -> [SKIP][832] ([i915#15865]) +1 other test skip
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          [SKIP][833] ([i915#15865]) -> [SKIP][834] ([i915#17356]) +3 other tests skip
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-4/igt@kms_content_protection@mei-interface.html
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          [SKIP][835] ([i915#15865]) -> [SKIP][836] ([i915#9433])
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg1-15/igt@kms_content_protection@mei-interface.html
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          [SKIP][837] ([i915#13049] / [i915#14544]) -> [SKIP][838] ([i915#13049])
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          [SKIP][839] ([i915#17356]) -> [SKIP][840] ([i915#13049])
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          [SKIP][841] ([i915#3555]) -> [SKIP][842] ([i915#17356]) +3 other tests skip
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          [SKIP][843] ([i915#13049]) -> [SKIP][844] ([i915#17356]) +2 other tests skip
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2:          [SKIP][845] ([i915#17356]) -> [SKIP][846] ([i915#3555]) +1 other test skip
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          [SKIP][847] ([i915#4103]) -> [SKIP][848] ([i915#11190] / [i915#17356]) +1 other test skip
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-rkl:          [SKIP][849] ([i915#14544] / [i915#4103]) -> [SKIP][850] ([i915#4103])
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2:          [SKIP][851] ([i915#17356]) -> [SKIP][852] ([i915#4103])
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          [SKIP][853] ([i915#13046] / [i915#17454] / [i915#5354]) -> [SKIP][854] ([i915#17356]) +4 other tests skip
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          [SKIP][855] ([i915#17356]) -> [SKIP][856] ([i915#13046] / [i915#17454] / [i915#5354]) +3 other tests skip
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          [SKIP][857] ([i915#17356]) -> [SKIP][858] ([i915#9067])
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          [SKIP][859] ([i915#4103]) -> [SKIP][860] ([i915#17356])
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          [SKIP][861] ([i915#9833]) -> [SKIP][862] ([i915#17356])
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          [SKIP][863] ([i915#9723]) -> [SKIP][864] ([i915#14544] / [i915#9723])
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          [SKIP][865] ([i915#14544] / [i915#17289]) -> [SKIP][866] ([i915#17289])
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2:          [SKIP][867] ([i915#17288]) -> [SKIP][868] ([i915#17356])
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-dg2:          [SKIP][869] ([i915#17356]) -> [SKIP][870] ([i915#17286])
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-dg2:          [SKIP][871] ([i915#17290]) -> [SKIP][872] ([i915#17356])
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2:          [SKIP][873] ([i915#17356]) -> [SKIP][874] ([i915#13748])
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst.html
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-dg2:          [SKIP][875] ([i915#17285]) -> [SKIP][876] ([i915#17356])
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-3/igt@kms_dp_link_training@uhbr-mst-direct-train.html
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][877] ([i915#13748] / [i915#14544]) -> [SKIP][878] ([i915#13748])
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-rkl:          [SKIP][879] ([i915#14544] / [i915#17285]) -> [SKIP][880] ([i915#17285])
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          [SKIP][881] ([i915#8812]) -> [SKIP][882] ([i915#17356])
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-dg2:          [SKIP][883] ([i915#16361]) -> [SKIP][884] ([i915#17356]) +3 other tests skip
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          [SKIP][885] ([i915#14544] / [i915#16361]) -> [SKIP][886] ([i915#16361])
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-dg2:          [SKIP][887] ([i915#17356]) -> [SKIP][888] ([i915#16361]) +3 other tests skip
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-rkl:          [SKIP][889] ([i915#14544] / [i915#9934]) -> [SKIP][890] ([i915#9934]) +1 other test skip
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-rkl:          [SKIP][891] ([i915#9934]) -> [SKIP][892] ([i915#14544] / [i915#9934])
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-5/igt@kms_flip@2x-flip-vs-panning.html
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][893] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][894] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][895] ([i915#14544] / [i915#15643]) -> [SKIP][896] ([i915#15643]) +1 other test skip
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][897] ([i915#17428] / [i915#1825]) -> [SKIP][898] ([i915#14544] / [i915#17428] / [i915#1825])
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][899] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][900] ([i915#17428] / [i915#1825]) +1 other test skip
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          [SKIP][901] ([i915#15991] / [i915#5354]) -> [SKIP][902] ([i915#16708] / [i915#5354]) +28 other tests skip
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-dg2:          [SKIP][903] ([i915#15990] / [i915#8708]) -> [SKIP][904] ([i915#16708] / [i915#5354]) +22 other tests skip
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
   [904]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][905] ([i915#16708]) -> [SKIP][906] ([i915#15990]) +13 other tests skip
   [905]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [906]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
    - shard-dg2:          [SKIP][907] ([i915#15989]) -> [SKIP][908] ([i915#16708]) +18 other tests skip
   [907]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html
   [908]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-rkl:          [SKIP][909] ([i915#5439]) -> [SKIP][910] ([i915#14544] / [i915#5439])
   [909]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
   [910]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-dg2:          [SKIP][911] ([i915#10055]) -> [SKIP][912] ([i915#16708])
   [911]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
   [912]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][913] ([i915#14544] / [i915#15102]) -> [SKIP][914] ([i915#15102]) +21 other tests skip
   [913]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [914]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][915] ([i915#16708] / [i915#5354]) -> [SKIP][916] ([i915#15990] / [i915#8708]) +8 other tests skip
   [915]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [916]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-dg2:          [SKIP][917] ([i915#16708] / [i915#5354]) -> [SKIP][918] ([i915#15102]) +12 other tests skip
   [917]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [918]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          [SKIP][919] ([i915#16708] / [i915#5354]) -> [SKIP][920] ([i915#10055])
   [919]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [920]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt:
    - shard-dg2:          [SKIP][921] ([i915#15102]) -> [SKIP][922] ([i915#16708]) +24 other tests skip
   [921]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html
   [922]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][923] ([i915#15102]) -> [SKIP][924] ([i915#14544] / [i915#15102]) +5 other tests skip
   [923]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [924]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][925] ([i915#15990]) -> [SKIP][926] ([i915#16708]) +23 other tests skip
   [925]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [926]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite:
    - shard-dg2:          [SKIP][927] ([i915#16708]) -> [SKIP][928] ([i915#15989]) +6 other tests skip
   [927]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html
   [928]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][929] ([i915#16708]) -> [SKIP][930] ([i915#15104] / [i915#15990])
   [929]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [930]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][931] ([i915#15102]) -> [SKIP][932] ([i915#16708] / [i915#5354]) +14 other tests skip
   [931]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [932]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2:          [SKIP][933] ([i915#16708] / [i915#5354]) -> [SKIP][934] ([i915#15991] / [i915#5354]) +16 other tests skip
   [933]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
   [934]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - shard-dg2:          [SKIP][935] ([i915#16708]) -> [SKIP][936] ([i915#15991]) +25 other tests skip
   [935]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [936]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][937] ([i915#14544] / [i915#17428]) -> [SKIP][938] ([i915#17428]) +28 other tests skip
   [937]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
   [938]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff:
    - shard-rkl:          [SKIP][939] ([i915#17428]) -> [SKIP][940] ([i915#14544] / [i915#17428]) +7 other tests skip
   [939]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff.html
   [940]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][941] ([i915#15991]) -> [SKIP][942] ([i915#16708]) +31 other tests skip
   [941]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html
   [942]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-slowdraw:
    - shard-dg2:          [SKIP][943] ([i915#16708]) -> [SKIP][944] ([i915#15102]) +18 other tests skip
   [943]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-slowdraw.html
   [944]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-slowdraw.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-dg2:          [SKIP][945] ([i915#17357]) -> [ABORT][946] ([i915#15132])
   [945]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [946]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
    - shard-tglu:         [FAIL][947] ([i915#17188]) -> [FAIL][948] ([i915#17101] / [i915#17108] / [i915#17188])
   [947]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-tglu-9/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [948]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][949] ([i915#17356]) -> [SKIP][950] ([i915#12713] / [i915#16518])
   [949]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html
   [950]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         [SKIP][951] ([i915#12713]) -> [SKIP][952] ([i915#1187] / [i915#12713])
   [951]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-tglu-7/igt@kms_hdr@brightness-with-hdr.html
   [952]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          [SKIP][953] ([i915#17356]) -> [SKIP][954] ([i915#16518] / [i915#3555] / [i915#8228])
   [953]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_hdr@invalid-hdr.html
   [954]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [SKIP][955] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][956] ([i915#17356]) +2 other tests skip
   [955]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html
   [956]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          [SKIP][957] ([i915#15459]) -> [SKIP][958] ([i915#14544] / [i915#15459])
   [957]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [958]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-dg2:          [SKIP][959] ([i915#16451]) -> [SKIP][960] ([i915#17356])
   [959]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-6/igt@kms_mst@mst-suspend-read-crc.html
   [960]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          [SKIP][961] ([i915#6301]) -> [SKIP][962] ([i915#17356])
   [961]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-1/igt@kms_panel_fitting@legacy.html
   [962]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][963] ([i915#14544] / [i915#15709]) -> [SKIP][964] ([i915#15709]) +2 other tests skip
   [963]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
   [964]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-rkl:          [SKIP][965] ([i915#14544] / [i915#3555]) -> [SKIP][966] ([i915#3555]) +1 other test skip
   [965]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html
   [966]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2:          [SKIP][967] ([i915#14259]) -> [SKIP][968] ([i915#17356])
   [967]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-5/igt@kms_plane_multiple@tiling-yf.html
   [968]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          [SKIP][969] ([i915#13046] / [i915#17454] / [i915#5354] / [i915#9423]) -> [SKIP][970] ([i915#17356] / [i915#5354] / [i915#9423])
   [969]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [970]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [SKIP][971] ([i915#6953] / [i915#9423]) -> [SKIP][972] ([i915#17356] / [i915#6953] / [i915#9423])
   [971]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_plane_scaling@intel-max-src-size.html
   [972]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          [SKIP][973] ([i915#12343]) -> [SKIP][974] ([i915#12343] / [i915#14544])
   [973]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html
   [974]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          [SKIP][975] ([i915#14544] / [i915#15948]) -> [SKIP][976] ([i915#15948])
   [975]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html
   [976]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][977] ([i915#11520] / [i915#14544]) -> [SKIP][978] ([i915#11520]) +2 other tests skip
   [977]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [978]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@pr-cursor-blt:
    - shard-rkl:          [SKIP][979] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][980] ([i915#1072] / [i915#9732]) +8 other tests skip
   [979]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_psr@pr-cursor-blt.html
   [980]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_psr@pr-cursor-blt.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-rkl:          [SKIP][981] ([i915#1072] / [i915#9732]) -> [SKIP][982] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
   [981]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-8/igt@kms_psr@psr2-cursor-plane-move.html
   [982]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          [SKIP][983] ([i915#17356]) -> [SKIP][984] ([i915#12755] / [i915#15867])
   [983]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html
   [984]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          [SKIP][985] ([i915#12755] / [i915#15867] / [i915#5190]) -> [SKIP][986] ([i915#17356] / [i915#5190])
   [985]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [986]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          [SKIP][987] ([i915#17356] / [i915#5190]) -> [SKIP][988] ([i915#12755] / [i915#15867] / [i915#5190]) +1 other test skip
   [987]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [988]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          [SKIP][989] ([i915#12755] / [i915#15867]) -> [SKIP][990] ([i915#17356])
   [989]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-270.html
   [990]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          [SKIP][991] ([i915#8623]) -> [SKIP][992] ([i915#17356])
   [991]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern.html
   [992]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          [SKIP][993] ([i915#14544] / [i915#8623]) -> [SKIP][994] ([i915#8623])
   [993]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html
   [994]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          [SKIP][995] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][996] ([i915#15243] / [i915#3555])
   [995]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_vrr@flip-dpms.html
   [996]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          [SKIP][997] ([i915#9906]) -> [SKIP][998] ([i915#17356])
   [997]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-8/igt@kms_vrr@max-min.html
   [998]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_vrr@max-min.html
    - shard-rkl:          [SKIP][999] ([i915#14544] / [i915#9906]) -> [SKIP][1000] ([i915#9906])
   [999]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@kms_vrr@max-min.html
   [1000]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          [SKIP][1001] ([i915#17356]) -> [SKIP][1002] ([i915#9906])
   [1001]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [1002]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [SKIP][1003] ([i915#2434]) -> [SKIP][1004] ([i915#14544] / [i915#2434])
   [1003]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-5/igt@perf@mi-rpc.html
   [1004]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@perf@mi-rpc.html

  * igt@prime_udl@share-import-addfb:
    - shard-rkl:          [SKIP][1005] ([i915#14544] / [i915#16420]) -> [SKIP][1006] ([i915#16420])
   [1005]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@prime_udl@share-import-addfb.html
   [1006]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          [SKIP][1007] ([i915#14544] / [i915#17448] / [i915#3708]) -> [SKIP][1008] ([i915#17448] / [i915#3708])
   [1007]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19400/shard-rkl-6/igt@prime_vgem@fence-write-hang.html
   [1008]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@prime_vgem@fence-write-hang.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
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
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#14995]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14995
  [i915#15060]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15060
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15347]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15718]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15718
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
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
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16396]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16396
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16604]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16604
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16938]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938
  [i915#16943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16943
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17032]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17032
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17110]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17110
  [i915#17146]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146
  [i915#17157]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17157
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
  [i915#17190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190
  [i915#17224]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17224
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17288]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288
  [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
  [i915#17357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357
  [i915#17359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359
  [i915#17373]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17429]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429
  [i915#17430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17444]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444
  [i915#17445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
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
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17471
  [i915#17473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473
  [i915#17478]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
  [i915#17479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
  [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
  [i915#17481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17481
  [i915#17482]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482
  [i915#17483]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483
  [i915#17484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484
  [i915#17488]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488
  [i915#17489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489
  [i915#17490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490
  [i915#17491]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491
  [i915#17492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492
  [i915#17493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493
  [i915#17494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17494
  [i915#17497]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497
  [i915#17499]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499
  [i915#17500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500
  [i915#17501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17501
  [i915#17502]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502
  [i915#17503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
  [i915#17504]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504
  [i915#17505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17514]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17514
  [i915#17515]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17515
  [i915#17516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529
  [i915#17531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17531
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17534]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17534
  [i915#17535]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17535
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17542
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17552]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17552
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561
  [i915#17563]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17563
  [i915#17568]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568
  [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
  [i915#17571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17571
  [i915#17572]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17572
  [i915#17574]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17574
  [i915#17578]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17578
  [i915#17579]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17579
  [i915#17580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580
  [i915#17583]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583
  [i915#17586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586
  [i915#17587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17587
  [i915#17588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588
  [i915#17591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17591
  [i915#17592]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17592
  [i915#17594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17594
  [i915#17603]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17603
  [i915#17604]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17604
  [i915#17608]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17608
  [i915#17610]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610
  [i915#17625]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17625
  [i915#17658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17658
  [i915#17666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17666
  [i915#17678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17678
  [i915#17679]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17679
  [i915#17680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17680
  [i915#17684]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17684
  [i915#17688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17699]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17699
  [i915#17702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17702
  [i915#17703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703
  [i915#17704]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704
  [i915#17705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17705
  [i915#17707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17707
  [i915#17711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17711
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
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
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
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
  [i915#8807]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9168 -> IGTPW_16054
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_19400: 5e5b89446954adf0d9b74ba4228862403f71eec4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16054: 16054
  IGT_9168: 9168
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/index.html

--===============6110917199456614360==
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
<tr><td><b>Series:</b></td><td>xe/shaders: remove explicit regioning and ch=
annel offsets</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/176973/">https://patchwork.freedesktop.org/series/176973/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16054/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16054/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19400_full -&gt; IGTPW_16054_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16054_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_16054_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/index=
.html</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1605=
4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@perf@blocking@1-vcs1:<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@perf@blocking@1-vcs1.html">FAIL<=
/a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19400_full and IGTPW_16054=
_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_cursor_crc@cursor-random-64x64@pipe-c-hdmi-a-2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.70] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16054_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@bb-with-allocator:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb5/igt@api_intel_bb@bb-with-allocator.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17684">i915#17684</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-block:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-6/igt@drm_read@short-buffer-block.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-d=
g2-7/igt@drm_read@short-buffer-block.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17359">i915#17359</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@gem_busy@semaphore.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936"=
>i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@gem_caching@writes.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873"=
>i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@gem_ccs@block-multicopy-inplace.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17499">i915#17499</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@gem_ccs@block-multicopy-inplace.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_ccs@ctrl-surf-copy-new-ctx.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-5/=
igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348<=
/a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk8/igt@gem_close_race@multigpu-basic-thre=
ads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17568">i915#17568</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk9/igt@gem_compute@compute-square.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17552">i915#17552</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3@vcs1.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6054/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3@vcs1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176"=
>i915#17176</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_ctx_param@set-priority-not-su=
pported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17535">i915#17535</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_ctx_persistence@engines-hang@=
bcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17527">i915#17527</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-st=
op.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb1/igt@gem_ctx_persistence@legacy-engines=
-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280=
">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
80">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk4/igt@gem_eio@in-flight-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@gem_exec_balancer@bonded-dual.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@gem_exec_balancer@bonded-dual.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4771">i915#4771</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb5/igt@gem_exec_balancer@bonded-dual.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17587">i915#17587</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@gem_exec_balancer@bonded-dual.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@gem_exec_balancer@bonded-true-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@gem_exec_balancer@fairslice.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_exec_balancer@parallel-contex=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@gem_exec_balancer@parallel-dmabu=
f-import-out-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@gem_exec_big@single.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1581=
6">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb4/igt@gem_exec_capture@capture.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7610">i915#17610</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@gem_exec_capture@capture.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16904">i915#16904</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@gem_exec_capture@capture-recoverab=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17711">i915#17711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@gem_exec_capture@capture@vecs0-lm=
em0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16904">i915#16904</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@gem_exec_endless@dispatch@bcs0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17571">i915#17571</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@gem_exec_flush@basic-batch-kerne=
l-default-wb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@gem_exec_flush@basic-uc-pro-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@gem_exec_params@rsvd2-dirt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/5107">i915#5107</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@gem_exec_params@rsvd2-dirt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17453">i915#17453</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@gem_exec_params@rsvd2-dirt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17453">i915#17453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@gem_exec_params@secure-non-maste=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17416">i915#17416</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@gem_exec_params@secure-non-maste=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@gem_exec_params@secure-non-root.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-read-nor=
eloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-cpu-nor=
eloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-norel=
oc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@gem_exec_reloc@basic-wc-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@gem_exec_reloc@basic-wc-read-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@gem_exec_schedule@reorder-wide.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@gem_fenced_exec_thrash@no-spare-=
fences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_gpgpu_fill@offset-16x16:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb1/igt@gem_gpgpu_fill@offset-16x16.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17608">i915#17608</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@gem_huc_copy@huc-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/219=
0">i915#2190</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_huc_copy@huc-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
56">i915#17456</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-m=
ulti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12193">i915#12193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-m=
ulti-ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk1/igt@gem_lmem_swapping@massive-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17503">i915#17503</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@gem_lmem_swapping@parallel-rando=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@gem_lmem_swapping@parallel-random=
-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb5/igt@gem_lmem_swapping@smem-oom.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17503">i915#17503</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@gem_lmem_swapping@smem-oom.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@gem_lmem_swapping@smem-oom.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_lmem_swapping@smem-oom.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17503">i915#17503</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@gem_lmem_swapping@smem-oom.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@gem_media_vme.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#2=
84</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@gem_media_vme.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#=
284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@gem_mmap@basic-small-bo.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-cpu-read-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@gem_mmap_gtt@basic-write-cpu-rea=
d-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@gem_mmap_gtt@basic-write-cpu-read-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17572">i915#17572</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@gem_mmap_gtt@coherency.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
429">i915#17429</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@gem_mmap_gtt@zero-extend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@gem_mmap_wc@bad-offset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@gem_mmap_wc@read.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-un=
cached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads-u=
ncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@gem_partial_pwrite_pread@writes-a=
fter-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3282">i915#3282</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@gem_pwrite@basic-exhaustion.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@gem_pxp@create-protected-buffer.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4270">i915#4270</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb4/igt@gem_pxp@create-protected-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17521">i915#17521</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@gem_pxp@regular-baseline-src-cop=
y-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk6/igt@gem_pxp@reject-modify-context-prot=
ection-off-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17521">i915#17521</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_pxp@verify-pxp-stale-buf-opto=
ut-execution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17521">i915#17521</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@gem_readwrite@beyond-eob.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb7/igt@gem_render_copy@linear-to-vebox-y-=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17492">i915#17492</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@gem_render_copy@linear-to-vebox-=
y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@gem_render_copy@linear-to-vebox-y=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb7/igt@gem_render_copy@y-tiled-ccs-to-yf-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17591">i915#17591</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gem_render_copy@y-tiled-mc-ccs-to=
-vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@gem_render_copy@yf-tiled-mc-ccs-to=
-vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17492">i915#17492</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@gem_set_tiling_vs_blt@tiled-to-u=
ntiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@gem_set_tiling_vs_blt@tiled-to-u=
ntiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@gem_softpin@evict-snoop-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17430">i915#17430</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@full:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb6/igt@gem_softpin@full.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17471">i9=
15#17471</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@gem_tiled_pread_basic@basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15656">i915#15656</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@gem_tiled_pread_basic@basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@gem_userptr_blits@coherency-sync=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17433">i915#17433</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@gem_userptr_blits@create-destroy-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@gem_userptr_blits@forbidden-opera=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@gem_userptr_blits@readonly-pwrite-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17507">i915#17507</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@gem_userptr_blits@relocations.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-a=
fter-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-8/igt@gem_workarounds@suspend-resume.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shar=
d-rkl-6/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gen3_mixed_blits.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688">i=
915#17688</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@gen3_mixed_blits.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@gen3_render_linear_blits.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17455">i915#17455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk1/igt@gen3_render_tiledy_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7578">i915#17578</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@gen7_exec_parse@batch-without-end.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17505">i915#17505</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@gen7_exec_parse@load-register-r=
eg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17455">i915#17455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk6/igt@gen9_exec_parse@bb-oversize.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16871">i915#16871</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@gen9_exec_parse@secure-batches.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@gen9_exec_parse@valid-registers.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@gen9_exec_parse@valid-registers.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@gpu_buddy@gpu_buddy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17514=
">i915#17514</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@i915_drm_fdinfo@all-busy-idle-ch=
eck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14123">i915#14123</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@i915_drm_fdinfo@all-busy-idle-ch=
eck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-active:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb1/igt@i915_drm_fdinfo@memory-info-active=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17603">i915#17603</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@i915_drm_fdinfo@most-busy-idle-c=
heck-all@rcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14073">i915#14073</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@i915_drm_fdinfo@virtual-busy-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@i915_fb_tiling@basic-x-tiling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk6/igt@i915_hangman@gt-engine-error@bcs0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17580">i915#17580</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7178">i915#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@i915_pm_freq_api@freq-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@i915_pm_freq_mult@media-freq.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17699">i915#17699</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@i915_pm_rc6_residency@media-rc6-a=
ccuracy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@i915_pm_rc6_residency@media-rc6-=
accuracy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/=
shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#129=
64</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb7/igt@i915_pm_rpm@system-suspend-devices=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17473">i915#17473</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@i915_pm_rps@thresholds.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk6/igt@i915_query@query-topology-known-pc=
i-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17574">i915#17574</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@i915_query@query-topology-known-p=
ci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@i915_query@query-topology-unsuppor=
ted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17563">i915#17563</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@i915_query@query-topology-unsuppo=
rted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16079">i915#16079</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@i915_query@query-topology-unsupp=
orted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-glk1/igt@i915_suspend@fence-restore-tiled2untiled.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6054/shard-glk6/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@i915_suspend@sysfs-reader.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_addfb_basic@framebuffer-vs-s=
et-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_addfb_basic@invalid-smem-bo-o=
n-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_async_flips@alternate-sync-=
async-flip-atomic@pipe-b-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_async_flips@async-flip-suspen=
d-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12761">i915#12761</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_async_flips@async-flip-suspen=
d-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1499=
5">i915#14995</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5286">i915#5286</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_big_fb@4-tiled-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_big_fb@4-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_big_fb@4-tiled-64bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17478">i915#17478</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_big_fb@4-tiled-64bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17478">i915#17478</a>) +8 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb7/igt@kms_big_fb@4-tiled-64bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17478">i915#17478</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +8 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-0-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp=
-rotate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk9/igt@kms_big_fb@linear-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17500">i915#17500</a>) +6 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_big_fb@linear-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_big_fb@linear-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_big_fb@linear-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17500">i915#17500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk6/igt@kms_big_fb@y-tiled-max-hw-stride-3=
2bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_big_fb@yf-tiled-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17432">i915#17432</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@kms_big_fb@yf-tiled-addfb.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_big_fb@yf-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17432">i915#17432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +2 other tests=
 skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-=
mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i9=
15#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_ccs@bad-rotation-90-4-tiled-=
bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +89 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_ccs@ccs-on-another-bo-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +33 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-y-tiled=
-gen12-mc-ccs@pipe-b-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb5/igt@kms_ccs@crc-primary-basic-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17594">i915#17594</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled=
-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-y-tile=
d-ccs@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a=
-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_ccs@crc-primary-rotation-180-4=
-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +96 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a=
-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +44 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17525">i915#17525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_ccs@crc-primary-suspend-4-til=
ed-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>=
) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +69 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-c=
cs@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-c=
cs@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs@pipe-b-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +15 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs@pipe-d-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i91=
5#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +66 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-til=
ed-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)=
 +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +205 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-l=
nl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_ccs@random-ccs-data-y-tiled-=
gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-=
ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_cdclk@mode-rejected-max-dotclo=
ck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17550">i915#17550</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_chamelium_audio@hdmi-audio-edi=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17483">i915#17483</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_chamelium_color@ctm-0-50.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17489">i915#17489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_chamelium_color@ctm-green-to-=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_chamelium_color@ctm-negative.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17427">i915#17427</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d=
:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lu=
t1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 othe=
r test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16464">i915#16464</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17=
427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk11/igt@kms_chamelium_edid@dp-edid-change=
-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17483">i915#17483</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_chamelium_frames@dp-crc-sing=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_chamelium_frames@dp-frame-dum=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-mul=
tiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_chamelium_frames@hdmi-frame-=
dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_chamelium_hpd@dp-hpd-after-ru=
ntime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-after-ru=
ntime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-after-r=
untime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11151">i915#11151</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-3/igt@kms_chamelium_hpd@dp-hpd-after-r=
untime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-after-r=
untime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-enable-=
disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-after=
-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11151">i915#11151</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_chamelium_hpd@hdmi-hpd-with-en=
abled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17483">i915#17483</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_chamelium_hpd@vga-hpd-after-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17483">i915#17483</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_chamelium_hpd@vga-hpd-withou=
t-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_color@ctm-negative.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/=
igt@kms_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_color@deep-color.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1265=
5">i915#12655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_color_pipeline@plane-ctm3x4@=
pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb=
-bt601-lut1d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matri=
x-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15529">i915#15529</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_color_pipeline@plane-lut1d-c=
tm3x4-lut1d@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +47 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_color_pipeline@plane-lut1d-pre=
-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17510">i915#17510</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb4/igt@kms_color_pipeline@plane-lut1d-pre=
-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@kms_color_pipeline@plane-lut1d-pr=
e-ctm3x4@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-pr=
e-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_color_pipeline@plane-lut1d-p=
re-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests ski=
p</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_color_pipeline@plane-lut1d-p=
re-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_content_protection@dp-mst-lic=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_content_protection@dp-mst-typ=
e-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-3/igt@kms_content_protection@dp-mst-ty=
pe-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17502">i915#17502</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb4/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17502">i915#17502</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_content_protection@lic-type-0=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17508">i915#17508</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_content_protection@lic-type-0=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8063">i915#8063</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_content_protection@uevent-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17508">i915#17508</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_content_protection@uevent-hdc=
p14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_content_protection@uevent-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-=
32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_cursor_crc@cursor-onscreen-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17504">i915#17504</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-6=
4x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hd=
mi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16054/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a=
-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13566">i915#13566</a>) +5 other tests fail</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-tglu-4/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-h=
dmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16054/shard-tglu-4/igt@kms_cursor_crc@cursor-random-128x42@pipe=
-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x=
170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17356">i915#17356</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb1/igt@kms_cursor_crc@cursor-random-512x1=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17533">i915#17533</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_cursor_crc@cursor-random-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk4/igt@kms_cursor_crc@cursor-random-max-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17504">i915#17504</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb5/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17504">i915#17504</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-move=
ment-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-move=
ment-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256=
x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk11/igt@kms_cursor_crc@cursor-sliding-32x=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17504">i915#17504</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_cursor_crc@cursor-sliding-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17533">i915#17533</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_cursor_crc@cursor-suspend.html=
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
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_cursor_crc@cursor-suspend@pipe=
-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#141=
52</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-curs=
or-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17428">i915#17428</a>) +121 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +8 other tests sk=
ip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +1 other test skip<=
/li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_cursor_legacy@2x-flip-vs-curs=
or-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17515">i915#17515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-mst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17288">i915#17288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-ss=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17286">i915#17286</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_dp_link_training@non-uhbr-ss=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_dp_link_training@non-uhbr-sst-=
tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17531">i915#17531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@kms_dp_link_training@uhbr-mst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_dp_link_training@uhbr-mst-dir=
ect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst-tb=
talt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-3/igt@kms_dp_link_training@uhbr-sst-tb=
talt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_dp_linktrain_fallback@dp-fallb=
ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17625">i915#17625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_dp_linktrain_fallback@dsc-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_dp_linktrain_fallback@dsc-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb4/igt@kms_dp_linktrain_fallback@dsc-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17680">i915#17680</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_dp_linktrain_fallback@dsc-f=
allback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_draw_crc@draw-method-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_dsc@dsc-basic-ultrajoiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp-bigjo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_dsc@dsc-fractional-bpp-bigjoin=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17458">i915#17458</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_dsc@dsc-fractional-bpp-bigj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_dsc@dsc-fractional-bpp-bigjo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp-bigjoi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_dsc@dsc-with-formats.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17458">i915#17458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk4/igt@kms_dsc@dsc-with-formats-bigjoiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17458">i915#17458</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">=
i915#16680</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_fbcon_fbt@psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680"=
>i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_fbcon_fbt@psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17516">i915#17516</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2065">i915#2065</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_feature_discovery@display-3x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17679">i915#17679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_feature_discovery@display-4x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17666">i915#17666</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_feature_discovery@hdr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17539">i915#17539</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_feature_discovery@hdr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16600">i915#16600</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_feature_discovery@hdr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16600">i915#16600</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_feature_discovery@hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb5/igt@kms_feature_discovery@hdr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17539">i915#17539</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_feature_discovery@hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@kms_feature_discovery@hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_feature_discovery@psr1.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17707">i915#17707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@kms_fence_pin_leak.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881"=
>i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@kms_flip@2x-blocking-absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9934">i915#9934</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@kms_flip@2x-flip-vs-fences-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-inter=
ruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839=
">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-inter=
ruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_flip@2x-flip-vs-wf_vblank-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_flip@2x-nonexisting-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_flip@2x-plain-flip-fb-recreat=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16054/shard-dg2-6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
027">i915#13027</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-3/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-=
7/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests =
skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk9/igt@kms_flip@flip-vs-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp=
-4tiledg2rcccs-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_flip_scaled_crc@flip=
-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i=
915#8813</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-xti=
le-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#175=
22</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_flip_scaled_crc@flip-p010-4ti=
le-to-p016-4tile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_force_connector_basic@force-=
load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-indfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-o=
ffscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-o=
ffscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +84 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>=
) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-far=
fromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1605=
4/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#=
16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5354">i915#5354</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-tili=
ng-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-1=
p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-1p=
-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +50 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-=
1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +29 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pr=
i-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_frontbuffer_tracking@fbc=
hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
054/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-rte.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i=
915#15989</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-2=
p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@kms_frontbuffer_tracking@fbchdr-=
farfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +27 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15989">i915#15989</a>) +28 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-s=
uspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16056">i915#16056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17559">i915#17559</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +33 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#174=
28</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1825">i915#1825</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +39 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +46 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +20 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsrhdr=
-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17588">i915#17588</a>) +20 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsrhdr=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17559">i915#17559</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +17 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-2p-p=
rimscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_frontbuffer_tracking@hdr-2p-=
scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +107 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb4/igt@kms_frontbuffer_tracking@hdr-rgb10=
1010-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17517">i915#17517</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_frontbuffer_tracking@pipe-fbc=
-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9766">i915#9766</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9766">i915#9766</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_frontbuffer_tracking@pipe-fbc-=
rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17534">i915#17534</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +64 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +123 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +19 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb4/igt@kms_frontbuffer_tracking@psr-rgb56=
5-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17482">i915#17482</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-shr=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15102">i915#15102</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-3/igt@kms_frontbuffer_tracking@psrhdr-=
1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +19 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1=
p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_frontbuffer_tracking@psrhdr-=
2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#174=
28</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2=
p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428<=
/a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-nv12:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_getfb@getfb2-accept-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17658">i915#17658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-3/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16054/shard-rkl-3/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17110">i915#17110</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-7/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_hdr@static-swap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_invalid_mode@uint-max-clock.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/sha=
rd-dg2-7/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_joiner@basic-big-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_joiner@basic-force-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17678">i915#17678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15459">i915#15459</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17678">i915#17678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_joiner@invalid-modeset-forc=
e-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_mst@mst-suspend-read-crc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17579">i915#17579</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_mst@mst-suspend-read-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_pipe_b_c_ivb@enable-pipe-c-w=
hile-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17455">i915#17455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-=
b-with-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-m=
odeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17540">i915#17540</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-6/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/=
shard-dg2-7/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#111=
90</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054=
/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i=
915#12756</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hd=
mi-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16054/shard-rkl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a=
-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-xt=
iled.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@kms_pipe_stress@stress-xrgb8888-=
yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_pipe_stress@stress-xrgb8888-yf=
tiled.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/118">i915#118</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16396">i915#16396</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-y=
ftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
54/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118"=
>i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk6/igt@kms_plane@pixel-format-4-tiled-bmg=
-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-=
dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +1 other =
test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-g=
en12-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_plane@pixel-format-y-tiled-m=
odifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_plane@pixel-format-yf-tiled-=
ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@kms_plane@pixel-format-yf-tiled-=
modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb7/igt@kms_plane@pixel-format-yf-tiled-mo=
difier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +3 other tests skip</=
li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@kms_plane@pixel-format-yf-tiled-m=
odifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_plane@pixel-format-yf-tiled-m=
odifier@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_plane@plane-panning-top-left.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/sh=
ard-dg2-7/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaqu=
e-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaqu=
e-fb@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_plane_alpha_blend@alpha-transp=
arent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_plane_alpha_blend@alpha-transp=
arent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_plane_multiple@2x-tiling-4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17586">i915#17586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_plane_multiple@tiling-4.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17542">i915#17542</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6953">i915#6953</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb7/igt@kms_plane_scaling@invalid-num-scal=
ers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17528">i915#17528</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-75=
-with-modifiers.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@plane-downscale=
-factor-0-75-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i=
915#9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-u=
nity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-4/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@plane-sc=
aler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i9=
15#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-8/igt@kms_plane_scaling@plane-upscale-=
20x20-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_plane_scaling@plane-upscale-fa=
ctor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-3/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i91=
5#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-3/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@planes-un=
ity-scaling-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +14 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb4/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16054/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#=
9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25@=
pipe-d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-=
25@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_pm_backlight@fade.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1746=
2">i915#17462</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9812">i915#9812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk6/igt@kms_pm_backlight@fade-with-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17462">i915#17462</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk11/igt@kms_pm_dc@dc5-dpms-suspend-resume=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16938">i915#16938</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-2/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/s=
hard-rkl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16943">i915#=
16943</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-18/igt@kms_pm_dc@dc5-pageflip-negative.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703">=
i915#17703</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479"=
>i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1573=
9">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17702=
">i915#17702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-4/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-16/=
igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-1/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-=
4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-14/igt@kms_pm_rpm@fences.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">=
i915#4077</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/=
shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_pm_rpm@modeset-pc8-residency=
-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_pm_rpm@package-g7.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/154=
03">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@kms_prime@basic-crc-vgem.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_prime@d3hot.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569">i91=
5#17569</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_properties@colorop-properties=
-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15347">i915#15347</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_properties@colorop-properties-=
legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17481">i915#17481</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_properties@colorop-properties-=
legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</l=
i>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-4/igt@kms_psr2_sf@fbc-pr-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_psr2_sf@fbc-pr-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-overlay-prim=
ary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb5/igt@kms_psr2_sf@fbc-psr2-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@kms_psr2_sf@psr2-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_psr2_su@page_flip-p010.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17546">i915#17546</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9683">i915#9683</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_psr@fbc-pr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_psr@fbc-psr-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9732">i915#9732</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@kms_psr@fbc-psr2-cursor-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9688">i915#9688</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_psr@fbc-psr2-primary-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_psr@psr-cursor-mmap-cpu.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb5/igt@kms_psr@psr-cursor-mmap-cpu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17480">i915#17480</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk9/igt@kms_psr@psr-primary-mmap-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17480">i915#17480</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_psr@psr2-cursor-plane-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17480">i915#17480</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_psr@psr2-cursor-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17480">i915#17480</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_psr_stress_test@invalidate-pr=
imary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_rotation_crc@multiplane-rotati=
on.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15492">i915#15492</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16184">i915#16184</a>) +1 other test incom=
plete</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-15/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17488">i915#17488</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb6/igt@kms_rotation_crc@primary-y-tiled-r=
eflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17488">i915#17488</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test =
skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17488">i915#17488</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_scaling_modes@scaling-mode-cen=
ter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-5/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@kms_scaling_modes@scaling-mode-fu=
ll-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb1/igt@kms_setmode@basic.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i=
915#15106</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_setmode@invalid-clone-single-=
crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_setmode@invalid-clone-single-=
crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb5/igt@kms_setmode@invalid-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17604">i915#17604</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_tiled_display@basic-test-patte=
rn-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17705">i915#17705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_tv_load_detect@load-detect.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17445">i915#17445</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_tv_load_detect@load-detect.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-3/igt@kms_vblank@ts-continuation-modeset.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/=
shard-dg2-7/igt@kms_vblank@ts-continuation-modeset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-19/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk5/igt@kms_vrr@flip-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520=
">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_vrr@flipline.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i=
915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@kms_vrr@lobf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561">i915#1=
7561</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_vrr@lobf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#=
11920</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-3/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-vrr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-vrr.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-2/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8808">i915#8808</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@blocking:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-5/igt@perf@blocking.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-6/igt@p=
erf@blocking.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/10538">i915#10538</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@perf@gen12-unprivileged-single-ct=
x-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-open-flags:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-snb5/igt@perf@invalid-open-flags.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
592">i915#17592</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-16/igt@perf@mi-rpc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2=
434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk3/igt@perf@per-context-mode-unprivileged=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17704">i915#17704</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@perf@unprivileged-single-ctx-coun=
ters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50@vecs0:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-tglu-10/igt@perf_pmu@busy-accuracy-50@vecs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/s=
hard-tglu-9/igt@perf_pmu@busy-accuracy-50@vecs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>=
) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-7/igt@perf_pmu@busy-idle.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-3/ig=
t@perf_pmu@busy-idle.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@perf_pmu@event-wait.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807=
">i915#8807</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-7/igt@perf_pmu@event-wait@rcs0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8807">i915#8807</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@perf_pmu@rc6-all-gts.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/851=
6">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk10/igt@perf_pmu@rc6-suspend.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16236">i915#16236</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk6/igt@perf_pmu@rc6@other-idle-gt0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17583">i915#17583</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-2/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk2/igt@prime_udl@share-import.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/164=
20">i915#16420</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@prime_udl@share-import.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
420">i915#16420</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-mtlp-5/igt@prime_udl@share-import.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
6420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-tglu-9/igt@prime_udl@share-import-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@prime_vgem@basic-fence-flip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg1-12/igt@prime_vgem@coherency-gtt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-glk11/igt@prime_vgem@coherency-gtt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17467">i915#17467</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-nonblock:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@drm_read@short-buffer-nonblock.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359"=
>i915#17359</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16054/shard-dg2-1/igt@drm_read@short-buffer-nonblock.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3=
/igt@fbdev@eof.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-1/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561">i915#956=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1605=
4/shard-dg2-7/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-4/igt@gem_eio@hibernate.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190">i915#=
17190</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7975">i915#7975</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16054/shard-mtlp-6/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-8/igt@gem_exec_big@single.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16604">i915#166=
04</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
54/shard-rkl-5/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-glk2/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356=
">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16054/shard-glk2/igt@i915_pm_rpm@system-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#=
14545</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16054/shard-dg2-6/igt@i915_selftest@mock.html">PASS</a></li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg1-19/igt@i915_selftest@mock.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915=
#14545</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16054/shard-dg1-19/igt@i915_selftest@mock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4817">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@i915_suspend@fence-restore-tiled2=
untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14888">i915#14888</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@kms_async_flips=
@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs-cc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@km=
s_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_color@background-color.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i91=
5#17373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16054/shard-dg2-3/igt@kms_color@background-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb=
-bt2020.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15529">i915#15529</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_color_pipeline@plane-=
fixed-matrix-yuv-rgb-bt2020.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-64x64.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16054/shard-dg2-1/igt@kms_cursor_crc@cursor-offscreen-64x64.ht=
ml">PASS</a> +39 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16054/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85.=
html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hd=
mi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_cursor_crc@cursor-slid=
ing-64x21@pipe-a-hdmi-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-4/igt@kms_cursor_crc@cursor-suspend.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17157"=
>i915#17157</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16054/shard-mtlp-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#=
1849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6054/shard-dg2-4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a3.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15718">i915#15718</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_flip@flip-vs-expired-vblank@b-hd=
mi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_flip@flip-vs-panning.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5=
354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
054/shard-dg2-5/igt@kms_flip@flip-vs-panning.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276"=
>i915#16276</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6113">i915#6113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_flip@flip-vs-suspend.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-5/igt@kms_flip@flip-vs-suspend-interruptible.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17224">i915#17224</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16054/shard-mtlp-5/igt@kms_flip@flip-vs-suspend-interruptib=
le.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp=
-xtile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@km=
s_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_frontbuf=
fer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> +2 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchd=
r-rgb565-draw-blt.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-glk4/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mm=
ap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16054/shard-glk8/igt@kms_frontbuffer_tracking@hd=
r-rgb101010-draw-mmap-gtt.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746"=
>i915#16746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_invalid_mode@bad-vsync-end.ht=
ml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequ=
ence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_pipe_crc=
_basic@nonblocking-crc-frame-sequence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-mod=
ifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_plane@pix=
el-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard=
-dg2-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html"=
>PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-modifiers@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_plane_sc=
aling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html">PASS</a> +14 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-modifiers@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/=
igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html"=
>PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9423">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-75.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-4/igt@kms_pm_backlight@fade-with-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17032">i915#17032</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16054/shard-mtlp-3/igt@kms_pm_backlight@fade-with-suspend.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441">i9=
15#13441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16054/shard-dg2-6/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-tglu-5/igt@kms_pm_rpm@cursor.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#105=
53</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
54/shard-tglu-8/igt@kms_pm_rpm@cursor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
54/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +2 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i=
915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16054/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-glk5/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/10553">i915#10553</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk6/igt@kms_pm_rpm@system-suspen=
d-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-glk3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a=
-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12276">i915#12276</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-glk1/igt@km=
s_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@prime_mmap_kms@buffer-sharing.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">=
i915#17454</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16054/shard-dg2-4/igt@prime_mmap_kms@buffer-sharing.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lu=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@gem_ccs@block-multicopy-compr=
essed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
176">i915#17176</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16054/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17146">i915#17146</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-5/igt@gem_ctx_param@set-priority-not-supported.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17444">i915#17444</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16054/shard-rkl-6/igt@gem_ctx_param@set-priority-not-suppor=
ted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17444">i915#17444</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-7/igt@gem_exec_balancer@parallel-contexts.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16054/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@gem_exec_params@secure-non-root.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17416">i915#17416</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@gem_exec_params@secure-non-roo=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613=
">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16054/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@gem_lmem_swapping@random-engine=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@gem_pread@snoop.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"=
>i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16054/shard-rkl-2/igt@gem_pread@snoop.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-glk2/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702">i91=
5#14702</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16054/shard-glk3/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702">i915#147=
02</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@gem_softpin@evict-snoop-interruptible.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17430">i915#17430</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@gem_softpin@evict-snoop-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17430">i915#17430</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-7/igt@gem_tiled_partial_pwrite_pread@writes.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16054/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@writes.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@gen7_exec_parse@basic-rejected.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17455">i915#17455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@gen7_exec_parse@basic-rejected.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17455">i915#17455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-3/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i91=
5#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16054/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@gen9_exec_parse@unaligned-jump.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590=
">i915#6590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16054/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-4/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1335=
6">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16054/shard-rkl-1/igt@i915_pm_rpm@system-suspend.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15060">i9=
15#15060</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-d=
g2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-interna=
l-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054=
/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-interna=
l-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16054/shard-dg2-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_big_fb@4-ti=
led-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
31">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@kms_big_fb@=
linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_big_fb@linear-max-h=
w-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7431">i915#17431</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16054/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
56">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_big_fb@y-tiled-64bpp-rotat=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5190">i915#5190</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_big_fb@y-=
tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_big_fb@y-tiled=
-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt=
@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5190">i915#5190</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/45=
38">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16054/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_ccs@bad-pixel-fo=
rmat-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@km=
s_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i=
915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_ccs@ccs-on-an=
other-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a=
-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@kms_ccs@c=
cs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-ln=
l-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-cc=
s-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-=
tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a=
-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-=
rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_ccs@c=
rc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12805">i915#12805</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-c=
cs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17158">i915#17158</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16054/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-c=
cs@pipe-c-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-mtlp-3/igt@kms_ccs@cr=
c-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#171=
58</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@kms_ccs@crc-primary-=
suspend-y-tiled-gen12-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#1=
5582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16054/shard-dg2-4/igt@kms_cdclk@mode-transition-all-outputs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16017">i915#16017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-7/igt@kms_chamelium_color@ctm-negative.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1742=
7">i915#17427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16054/shard-rkl-6/igt@kms_chamelium_color@ctm-negative.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lu=
t1d:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matr=
ix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-=
rkl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim=
-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-=
ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-=
5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i9=
15#16471</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_chamelium_hpd@common-hpd-after-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_c=
hamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#78=
28</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-=
hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg1-17/igt@kms_content_protection@atomic-dpms-hdcp14.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15865">i915#15865</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg1-17/igt@kms_content_protecti=
on@atomic-dpms-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16054/shard-dg2-8/igt@kms_content_protection@dp-mst-type-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_content_protection@dp-mst-type=
-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-=
resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@kms_conten=
t_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-7/igt@kms_content_protection@le=
gacy-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-4/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16054/shard-dg2-7/igt@kms_content_protection@mei-interface.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17356">i915#17356</a>) +3 other tests skip</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg1-15/igt@kms_content_protection@mei-interface.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16054/shard-dg1-12/igt@kms_content_protection@mei-interface.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_cursor_crc@cursor-=
offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-512x512.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16054/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16054/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x512.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-max-size.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-max-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_cursor_legacy@basic-b=
usy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>=
) +1 other test skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_curso=
r_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_cursor_legacy=
@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-si=
ze.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-f=
lipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotsp=
ot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_cursor_legacy@modeset-atom=
ic-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_cursor_legacy@short-b=
usy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">=
i915#9833</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16054/shard-dg2-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i91=
5#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i=
915#9723</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16054/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17289">i915#17289</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/172=
88">i915#17288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16054/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-direct-trai=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16054/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-s=
st-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-trai=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17290">i915#17290</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-s=
st-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">=
i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16054/shard-dg2-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i91=
5#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-3/igt@kms_dp_link_training@uhbr-mst-direct-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17285">i915#17285</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-direc=
t-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">=
i915#13748</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17285">i915#17285</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-4/igt@kms_dp_link_trainin=
g@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/881=
2">i915#8812</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16054/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoin=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-wit=
h-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16054/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1636=
1">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16054/shard-dg2-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-1/igt@kms_flip@2x-flip-vs-block=
ing-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-5/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i91=
5#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16054/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">=
i915#6113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16054/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bp=
p-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/ig=
t@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt=
@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-=
indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054=
/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mm=
ap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#167=
08</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5354">i915#5354</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-m=
map-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbu=
ffer_tracking@fbc-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i91=
5#5354</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_frontbu=
ffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915=
#15990</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dra=
w-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking=
@fbchdr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +18 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-=
4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/10055">i915#10055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-tilin=
g-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl=
-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-p=
ri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-5/=
igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15990">i915#15990</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8708">i915#8708</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_frontbuffer_=
tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-5/igt@kms_frontbuffer_trackin=
g@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscr=
n-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffe=
r_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#167=
08</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscr=
n-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15102">i915#15102</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffe=
r_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#167=
08</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_frontbuffer_tracking@hdr-r=
gb565-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_frontbuff=
er_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#151=
04</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer_tr=
acking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i91=
5#5354</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-3/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#159=
91</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5354">i915#5354</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-=
multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_frontbuffer_trackin=
g@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +25 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-c=
ur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-3/igt@km=
s_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i91=
5#17428</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-c=
ur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_frontbuffer_tr=
acking@psrhdr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i9=
15#17428</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_frontbuffer=
_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</=
a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-slowdraw:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-slowdraw.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16054/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-slowd=
raw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15102">i915#15102</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17357">i915#17357</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16054/shard-dg2-1/igt@kms_hdmi_audio_bw@suspend-disk-a=
udio-recovery.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15132">i915#15132</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-tglu-9/igt@kms_hdmi_audio_bw@suspend-disk-audio-recover=
y.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17188">i915#17188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16054/shard-tglu-10/igt@kms_hdmi_audio_bw@suspend-dis=
k-audio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17101">i915#17101</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188">i915#17188<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i9=
15#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16054/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12=
713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16518">i915#16518</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-tglu-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i=
915#12713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16054/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1=
187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
54/shard-dg2-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518"=
>i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_hdr@invalid-met=
adata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15459">i915#15459</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-6/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i=
915#16451</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16054/shard-dg2-7/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#=
17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6=
301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
054/shard-dg2-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-mod=
ifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8=
/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_plane_lowres@tiling-4.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i=
915#14259</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16054/shard-dg2-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#=
17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7=
/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i=
915#5354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_plane_scaling@intel-max-src-size.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9423">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12343">i915#12343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16054/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/159=
48">i915#15948</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16054/shard-rkl-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continu=
ous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@km=
s_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i91=
5#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_psr@pr-cursor-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@kms_psr@pr-cursor-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-8/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">=
i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16054/shard-rkl-6/igt@kms_psr@psr2-cursor-plane-move.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i9=
15#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16054/shard-dg2-4/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12=
755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@k=
ms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190"=
>i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-4/igt@kms_rotation_crc@=
primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190"=
>i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15867">i915#15867</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16054/shard-dg2-7/igt@kms_rotation_crc@sprite-r=
otation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8623">i915#8623</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16054/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8623">i915#8623</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_tiled_display@basic-tes=
t-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/152=
43">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16054/shard-rkl-2/igt@kms_vrr@flip-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1524=
3">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-8/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard=
-dg2-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906"=
>i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16054/shard-rkl-2/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16054/shard-dg2-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i9=
15#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-5/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl=
-6/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@prime_udl@share-import-addfb.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16420">i915#16420</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16054/shard-rkl-5/igt@prime_udl@share-import-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19400/shard-rkl-6/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16054/shard-rkl-8/igt@prime_vgem@fence-wri=
te-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9168 -&gt; IGTPW_16054</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19400: 5e5b89446954adf0d9b74ba4228862403f71eec4 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_16054: 16054<br />
  IGT_9168: 9168<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6110917199456614360==--
