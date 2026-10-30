Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87700606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 13:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC3E10E0D2;
	Fri, 30 Oct 2026 13:35:39 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4218210E0D2;
 Fri, 30 Oct 2026 13:34:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1268508009330377488=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/msm/msm=5Fbo=3A_Ad?=
 =?utf-8?q?d_mapping_and_free_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jitta Vignan" <jvignan@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 30 Oct 2026 13:34:45 -0000
Message-ID: <179336728522.94098.6043366536179542757@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029165553.1108121-1-jvignan@qti.qualcomm.com>
In-Reply-To: <20261029165553.1108121-1-jvignan@qti.qualcomm.com>
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

--===============1268508009330377488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/msm/msm_bo: Add mapping and free tests
URL   : https://patchwork.freedesktop.org/series/177182/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19416_full -> IGTPW_16075_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16075_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16075_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16075_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_linear_blits@interruptible:
    - shard-dg1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg1-16/igt@gem_linear_blits@interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@gem_linear_blits@interruptible.html

  
Known issues
------------

  Here are the changes found in IGTPW_16075_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-glk:          NOTRUN -> [SKIP][3] ([i915#17576])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@api_intel_bb@crc32.html
    - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#6230])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#6230])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][6] ([i915#6230])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-glk10:        NOTRUN -> [SKIP][8] ([i915#17537]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@device_reset@cold-reset-bound.html

  * igt@drm_read@empty-block:
    - shard-dg2:          [PASS][9] -> [SKIP][10] ([i915#17359])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@drm_read@empty-block.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@drm_read@empty-block.html

  * igt@fbdev@read:
    - shard-dg2:          [PASS][11] -> [SKIP][12] ([i915#2582]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@fbdev@read.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@fbdev@read.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#7697])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@gem_basic@multigpu-create-close.html
    - shard-glk11:        NOTRUN -> [SKIP][14] ([i915#17697])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#3936])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-glk:          NOTRUN -> [SKIP][16] ([i915#17499]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html
    - shard-snb:          NOTRUN -> [SKIP][18] ([i915#17499])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb6/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#3555] / [i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#3555] / [i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@gem_ccs@ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy.html
    - shard-glk10:        NOTRUN -> [SKIP][24] ([i915#17499])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][25] -> [INCOMPLETE][26] ([i915#13356] / [i915#16348]) +1 other test incomplete
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-1/igt@gem_ccs@suspend-resume.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-glk:          NOTRUN -> [SKIP][27] ([i915#17568])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_compute@compute-square:
    - shard-glk:          NOTRUN -> [SKIP][28] ([i915#17552])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@gem_compute@compute-square.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#6335])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-glk:          NOTRUN -> [SKIP][30] ([i915#17513])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#6335])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-glk10:        NOTRUN -> [SKIP][32] ([i915#17530])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#8562])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#8562])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@nonpriv:
    - shard-snb:          NOTRUN -> [SKIP][35] ([i915#17639]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb5/igt@gem_ctx_isolation@nonpriv.html

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-mtlp:         NOTRUN -> [FAIL][36] ([i915#17176]) +3 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-glk:          NOTRUN -> [SKIP][37] ([i915#17535])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#8555])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][39] ([i915#1099])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_ctx_persistence@saturated-hostile:
    - shard-snb:          NOTRUN -> [SKIP][40] ([i915#17621])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb4/igt@gem_ctx_persistence@saturated-hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-glk11:        NOTRUN -> [SKIP][41] ([i915#17496])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#280]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#280])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [PASS][44] -> [FAIL][45] ([i915#17415])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-tglu-3/igt@gem_eio@hibernate.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@gem_eio@hibernate.html
    - shard-mtlp:         [PASS][46] -> [FAIL][47] ([i915#17415])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-4/igt@gem_eio@hibernate.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-8/igt@gem_eio@hibernate.html
    - shard-rkl:          [PASS][48] -> [FAIL][49] ([i915#17415])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-2/igt@gem_eio@hibernate.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4771])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4771]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@full:
    - shard-snb:          NOTRUN -> [SKIP][52] ([i915#17587]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb4/igt@gem_exec_balancer@full.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][53] ([i915#4525])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-glk:          NOTRUN -> [SKIP][54] ([i915#17547])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk1/igt@gem_exec_balancer@parallel-keep-in-fence.html
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#4525])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#4525]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-glk10:        NOTRUN -> [SKIP][57] ([i915#17547]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-mtlp:         [PASS][58] -> [FAIL][59] ([i915#15871])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-2/igt@gem_exec_big@single.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-8/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-glk11:        NOTRUN -> [SKIP][60] ([i915#6334]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-glk11:        NOTRUN -> [SKIP][61] ([i915#17711])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@submit:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4812])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@gem_exec_fence@submit.html
    - shard-snb:          NOTRUN -> [SKIP][63] ([i915#17599])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb1/igt@gem_exec_fence@submit.html
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4812])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-8/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#3711])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3539])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-6/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3539] / [i915#4852]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@gem_exec_flush@basic-wb-prw-default.html
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3539] / [i915#4852]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_params@secure-non-master:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#17416])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu-active:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#3281]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-active.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3281]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3281]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#14544] / [i915#3281])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#3281]) +11 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4812]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@wide:
    - shard-snb:          NOTRUN -> [SKIP][76] ([i915#17590]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb5/igt@gem_exec_schedule@wide.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-mtlp:         [PASS][77] -> [FAIL][78] ([i915#17160]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-4/igt@gem_exec_suspend@basic-s0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          [PASS][79] -> [INCOMPLETE][80] ([i915#13196] / [i915#13356]) +1 other test incomplete
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-glk4/igt@gem_exec_suspend@basic-s3.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk9/igt@gem_exec_suspend@basic-s3.html
    - shard-rkl:          [PASS][81] -> [ABORT][82] ([i915#15131] / [i915#15542]) +1 other test abort
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-8/igt@gem_exec_suspend@basic-s3.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-snb:          NOTRUN -> [SKIP][83] ([i915#17628])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb5/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4860])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@gem_fence_thrash@bo-write-verify-x.html
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4860]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify-x.html
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4860])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk11:        NOTRUN -> [SKIP][87] ([i915#17456])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-glk10:        NOTRUN -> [SKIP][88] ([i915#17605])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#4613] / [i915#7582])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#4613] / [i915#7582])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#4613]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#4613])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-snb:          NOTRUN -> [SKIP][93] ([i915#17503])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb5/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4565]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-glk:          NOTRUN -> [SKIP][95] ([i915#17503] / [i915#4613]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#4613]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-tglu-1:       NOTRUN -> [SKIP][97] ([i915#4613]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#12193]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify:
    - shard-glk11:        NOTRUN -> [SKIP][99] ([i915#17503])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_lmem_swapping@verify.html

  * igt@gem_mmap@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#4083])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-glk10:        NOTRUN -> [SKIP][101] ([i915#17572])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@coherency:
    - shard-glk:          NOTRUN -> [SKIP][102] ([i915#17582])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4077]) +6 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#4077]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][105] ([i915#16108] / [i915#17394]) +1 other test incomplete
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#4083])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#4083]) +5 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#3282]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@gem_partial_pwrite_pread@write-display.html
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#3282]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@gem_partial_pwrite_pread@write-display.html
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#3282]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-snb:          NOTRUN -> [SKIP][111] ([i915#17635])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_pread@exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][112] ([i915#2658])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][113] ([i915#2658])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-glk:          NOTRUN -> [SKIP][114] ([i915#17521]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4270]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-glk10:        NOTRUN -> [SKIP][116] ([i915#17521])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-glk11:        NOTRUN -> [SKIP][117] ([i915#17521]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#3282]) +6 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-glk10:        NOTRUN -> [SKIP][119] ([i915#17492]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][120] ([i915#17492]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-linear:
    - shard-glk11:        NOTRUN -> [SKIP][121] ([i915#17492])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_render_copy@yf-tiled-to-vebox-linear.html
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#5190] / [i915#8428]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@gem_render_copy@yf-tiled-to-vebox-linear.html
    - shard-snb:          NOTRUN -> [SKIP][123] ([i915#17492])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb4/igt@gem_render_copy@yf-tiled-to-vebox-linear.html
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#8428])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-8/igt@gem_render_copy@yf-tiled-to-vebox-linear.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4079])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#17430]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@gem_softpin@evict-snoop.html
    - shard-glk:          NOTRUN -> [SKIP][127] ([i915#17551])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk4/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-mtlp:         [PASS][128] -> [FAIL][129] ([i915#17405])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-2/igt@gem_softpin@noreloc-s3.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_pread_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#14544] / [i915#3282])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#3297]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-glk:          NOTRUN -> [SKIP][132] ([i915#17507])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#3297] / [i915#3323])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#3297]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#3297])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#3297])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#3297]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-glk11:        NOTRUN -> [SKIP][138] ([i915#17507]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_userptr_blits@readonly-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#14544] / [i915#3297])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html
    - shard-snb:          NOTRUN -> [SKIP][140] ([i915#17507]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb7/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#3281] / [i915#3297])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@gem_userptr_blits@relocations.html
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#3281] / [i915#3297])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#3281] / [i915#3297])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@gem_userptr_blits@relocations.html
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#3281] / [i915#3297])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#3297] / [i915#4958])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@gem_userptr_blits@sd-probe.html

  * igt@gen3_render_tiledx_blits:
    - shard-snb:          NOTRUN -> [SKIP][146] ([i915#17511])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb5/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-glk:          NOTRUN -> [SKIP][147] ([i915#17505]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#17455]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@gen7_exec_parse@basic-rejected.html
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#17455]) +3 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@gen7_exec_parse@basic-rejected.html
    - shard-snb:          NOTRUN -> [SKIP][150] ([i915#17505]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb5/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#17455]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-tglu-1:       NOTRUN -> [SKIP][152] ([i915#17455]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#2527]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#14544] / [i915#2527])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#2527] / [i915#2856]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-10/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#2527])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#2527] / [i915#2856])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#2856]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@isolation@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#14073]) +11 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@i915_drm_fdinfo@isolation@rcs0.html

  * igt@i915_drm_fdinfo@memory-info-active:
    - shard-snb:          NOTRUN -> [SKIP][160] ([i915#17603])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb4/igt@i915_drm_fdinfo@memory-info-active.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#14118]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - shard-glk10:        NOTRUN -> [SKIP][162] ([i915#17580])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][163] ([i915#13029] / [i915#14545])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][164] ([i915#13029] / [i915#14545])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#6412])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@i915_module_load@resize-bar.html
    - shard-glk:          NOTRUN -> [SKIP][166] ([i915#17566])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-glk:          NOTRUN -> [SKIP][167] ([i915#17526]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk2/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#8399])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-glk11:        NOTRUN -> [SKIP][169] ([i915#17526])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][170] -> [INCOMPLETE][171] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#6590]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-snb:          NOTRUN -> [SKIP][173] ([i915#17624]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb6/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#6590]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#6590]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@i915_pm_freq_mult@media-freq@gt1.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-glk:          NOTRUN -> [SKIP][176] ([i915#17690])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][177] ([i915#17706])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][178] ([i915#13356])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk1/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#11681] / [i915#6621])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#11681])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#16109])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@i915_query@query-topology-known-pci-ids.html

  * igt@intel_hwmon@hwmon-read:
    - shard-glk:          NOTRUN -> [SKIP][182] ([i915#11680])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@async-flip-hang:
    - shard-dg2:          [PASS][183] -> [SKIP][184] ([i915#17356]) +30 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-6/igt@kms_async_flips@async-flip-hang.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_async_flips@async-flip-hang.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#9531])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#9531])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][187] ([i915#1769])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-glk11:        NOTRUN -> [SKIP][188] ([i915#17478]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#17431]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#17432] / [i915#5286]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#4538] / [i915#5286]) +5 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#17432] / [i915#5286]) +6 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-glk:          NOTRUN -> [SKIP][193] ([i915#17478]) +10 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#5286])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_big_fb@4-tiled-addfb.html
    - shard-glk10:        NOTRUN -> [SKIP][195] ([i915#17556])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#4538] / [i915#5286]) +9 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-snb:          NOTRUN -> [SKIP][197] ([i915#17524])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#3828])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#3828])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-glk:          NOTRUN -> [SKIP][200] ([i915#17524]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#3828])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#3828]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3828]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#17431]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#17431] / [i915#3638]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-snb:          NOTRUN -> [SKIP][206] ([i915#17500])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#17431]) +3 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][208] ([i915#17500]) +8 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#17431])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-glk10:        NOTRUN -> [SKIP][210] ([i915#17500]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3638]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-glk11:        NOTRUN -> [SKIP][212] ([i915#17500]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#17432])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-glk10:        NOTRUN -> [SKIP][214] ([i915#17478]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#17432]) +5 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#17432])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-snb:          NOTRUN -> [SKIP][217] ([i915#17478]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#17432]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#4538]) +8 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#4538] / [i915#5190]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#4538]) +6 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_busy@extended-pageflip-hang-newfb:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][222] ([i915#4423])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_busy@extended-pageflip-hang-newfb.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][223] ([i915#17490] / [i915#17491]) +15 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][224] ([i915#17491]) +14 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#14098] / [i915#14544] / [i915#6095]) +5 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-snb:          NOTRUN -> [SKIP][226] ([i915#17594]) +4 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][227] ([i915#17491]) +41 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#6095]) +205 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#6095]) +14 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#6095]) +94 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#10307] / [i915#10434] / [i915#6095])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#12313]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][233] ([i915#17490] / [i915#17491]) +5 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-glk:          NOTRUN -> [SKIP][234] ([i915#17490] / [i915#17491]) +49 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1:
    - shard-mtlp:         [PASS][235] -> [FAIL][236] ([i915#17158])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         [PASS][237] -> [INCOMPLETE][238] ([i915#15582]) +2 other tests incomplete
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][239] ([i915#13356] / [i915#15582]) +1 other test incomplete
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#6095]) +8 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#12313]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][242] ([i915#17525])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#10307] / [i915#6095]) +107 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#6095]) +97 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#14098] / [i915#6095]) +65 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#14544] / [i915#6095]) +11 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#6095]) +34 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][248] ([i915#17491]) +130 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-glk10:        NOTRUN -> [SKIP][249] ([i915#17550])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#3742])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_cdclk@mode-transition.html
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#3742])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_cdclk@mode-transition.html
    - shard-snb:          NOTRUN -> [SKIP][252] ([i915#17550])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb6/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#3742])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#13781]) +4 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#13781]) +3 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-glk11:        NOTRUN -> [SKIP][256] ([i915#17483]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#11151])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_chamelium_audio@dp-audio-after-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#11151] / [i915#14544])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-glk10:        NOTRUN -> [SKIP][259] ([i915#17483]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#11151] / [i915#7828]) +12 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#17427]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-glk:          NOTRUN -> [SKIP][262] ([i915#17489]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-glk10:        NOTRUN -> [SKIP][263] ([i915#17489])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-glk11:        NOTRUN -> [SKIP][264] ([i915#17489]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#17427]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#16471] / [i915#17427])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#17427]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-glk:          NOTRUN -> [SKIP][268] ([i915#17497]) +6 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#17427]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#17427])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html
    - shard-snb:          NOTRUN -> [SKIP][271] ([i915#17497])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html
    - shard-mtlp:         NOTRUN -> [SKIP][272] ([i915#17427])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#16471] / [i915#17427]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#16471] / [i915#17427]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-10/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#14544] / [i915#16471] / [i915#17427])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][276] ([i915#11151] / [i915#7828]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#11151] / [i915#14544] / [i915#7828])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-glk:          NOTRUN -> [SKIP][278] ([i915#17483]) +11 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#11151] / [i915#7828]) +7 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#11151] / [i915#7828]) +11 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#11151])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html
    - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#11151])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#11151])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#11151] / [i915#7828]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-snb:          NOTRUN -> [SKIP][285] ([i915#17483]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-mtlp:         NOTRUN -> [SKIP][286] ([i915#11151] / [i915#7828]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@ctm-0-50:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#12655] / [i915#17373])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_color@ctm-0-50.html

  * igt@kms_color@ctm-red-to-blue:
    - shard-dg2:          [PASS][288] -> [SKIP][289] ([i915#12655] / [i915#17373])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-3/igt@kms_color@ctm-red-to-blue.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_color@ctm-red-to-blue.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-4:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#16990]) +7 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-snb:          NOTRUN -> [SKIP][291] ([i915#17510])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][292] ([i915#17510]) +10 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk9/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][293] ([i915#17510])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#16990]) +31 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#16990]) +31 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-1:
    - shard-dg1:          [PASS][296] -> [FAIL][297] ([i915#17116]) +3 other tests fail
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg1-12/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-1.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-1.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-2:
    - shard-rkl:          NOTRUN -> [FAIL][298] ([i915#17116]) +3 other tests fail
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-2.html
    - shard-tglu:         NOTRUN -> [FAIL][299] ([i915#17116]) +3 other tests fail
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-2.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#16990]) +5 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-glk11:        NOTRUN -> [SKIP][301] ([i915#17508])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-tglu-1:       NOTRUN -> [SKIP][302] ([i915#15865])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-glk:          NOTRUN -> [SKIP][303] ([i915#17508]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#15330]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
    - shard-tglu-1:       NOTRUN -> [SKIP][305] ([i915#15330]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
    - shard-snb:          NOTRUN -> [SKIP][306] ([i915#17502]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#15330]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#15330]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
    - shard-glk11:        NOTRUN -> [SKIP][309] ([i915#17502])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-glk:          NOTRUN -> [SKIP][310] ([i915#17502]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#15330]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#14544] / [i915#15865]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_content_protection@mei-interface.html
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#15865]) +5 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@suspend-resume:
    - shard-glk10:        NOTRUN -> [SKIP][314] ([i915#17508])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#15865]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#15865]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-glk10:        NOTRUN -> [SKIP][317] ([i915#17533]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg1:          NOTRUN -> [SKIP][318] ([i915#13049]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][319] ([i915#13566]) +1 other test fail
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-glk11:        NOTRUN -> [SKIP][320] ([i915#17504]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][321] ([i915#13566])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#3555]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          NOTRUN -> [SKIP][323] ([i915#17504]) +5 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#3555]) +7 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-snb:          NOTRUN -> [SKIP][325] ([i915#17504])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#3555]) +7 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#3555] / [i915#8814])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#3555]) +3 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][329] ([i915#13049])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#13049])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][331] ([i915#14544] / [i915#3555])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][332] -> [FAIL][333] ([i915#13566]) +1 other test fail
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][334] ([i915#12358] / [i915#13356] / [i915#14152] / [i915#7882])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][335] ([i915#12358] / [i915#13356] / [i915#14152])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-glk:          NOTRUN -> [SKIP][336] ([i915#17457]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#4103]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - shard-dg2:          [PASS][338] -> [SKIP][339] ([i915#11190] / [i915#17356])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#17428] / [i915#17454]) +2 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#17428]) +73 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#17428] / [i915#17454]) +5 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#17356]) +9 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#13046] / [i915#17454] / [i915#5354])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][345] ([i915#17428] / [i915#9809]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#4103])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-glk11:        NOTRUN -> [SKIP][347] ([i915#17515])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-glk:          NOTRUN -> [SKIP][348] ([i915#17515])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#9723])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#3555] / [i915#3804])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-tglu-1:       NOTRUN -> [SKIP][351] ([i915#1769] / [i915#3555] / [i915#3804])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][352] ([i915#17487])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu-1:       NOTRUN -> [SKIP][353] ([i915#3804])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][354] ([i915#17486]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#3804])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev@basic:
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#1257])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_dp_aux_dev@basic.html
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#1257])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_dp_aux_dev@basic.html
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#1257])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_dp_aux_dev@basic.html
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#1257])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_dp_aux_dev@basic.html
    - shard-glk:          NOTRUN -> [SKIP][360] ([i915#17538])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#17287])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#17288])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-6/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#17288])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#17288])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-snb:          NOTRUN -> [SKIP][365] ([i915#17664])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb1/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-tglu:         NOTRUN -> [SKIP][366] ([i915#17288])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-7/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-glk10:        NOTRUN -> [SKIP][367] ([i915#17531])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#17285])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-glk:          NOTRUN -> [SKIP][369] ([i915#17477])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-tglu-1:       NOTRUN -> [SKIP][370] ([i915#17285]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#16867])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][372] ([i915#16867])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-glk10:        NOTRUN -> [SKIP][373] ([i915#17625])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#13707] / [i915#14544])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-snb:          NOTRUN -> [SKIP][375] ([i915#17680])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#13707])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][377] ([i915#13707])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-glk11:        NOTRUN -> [SKIP][378] ([i915#17458])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-glk:          NOTRUN -> [SKIP][379] ([i915#17458]) +4 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][380] ([i915#16361])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-tglu:         NOTRUN -> [SKIP][381] ([i915#16361]) +5 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-glk10:        NOTRUN -> [SKIP][382] ([i915#17458])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#16361])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_dsc@dsc-with-formats-bigjoiner.html
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#16361]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_dsc@dsc-with-formats-bigjoiner.html
    - shard-dg1:          NOTRUN -> [SKIP][385] ([i915#16361]) +4 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][386] ([i915#16361])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][387] ([i915#13356] / [i915#9878])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][388] ([i915#16680])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_fbcon_fbt@psr.html
    - shard-glk10:        NOTRUN -> [SKIP][389] ([i915#17516])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#16081])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_feature_discovery@display-2x.html
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#16081])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#16081]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@kms_feature_discovery@display-3x.html
    - shard-tglu:         NOTRUN -> [SKIP][393] ([i915#16081]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-glk10:        NOTRUN -> [SKIP][394] ([i915#17570])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-glk11:        NOTRUN -> [SKIP][395] ([i915#17539])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][396] ([i915#16600])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr1:
    - shard-glk10:        NOTRUN -> [SKIP][397] ([i915#17707])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][398] ([i915#658])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_feature_discovery@psr2.html

  * igt@kms_feature_discovery@vrr:
    - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#16600])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-1/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][400] ([i915#3637] / [i915#9934])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][401] ([i915#8381]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][402] ([i915#9934]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][403] ([i915#3637] / [i915#9934])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][404] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][405] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][406] ([i915#9934]) +6 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_flip@2x-plain-flip.html
    - shard-tglu:         NOTRUN -> [SKIP][407] ([i915#3637] / [i915#9934]) +9 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#9934]) +11 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][409] ([i915#14544] / [i915#9934]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-dg2:          [PASS][410] -> [SKIP][411] ([i915#5354]) +3 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-3/igt@kms_flip@dpms-off-confusion-interruptible.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-snb:          NOTRUN -> [SKIP][412] ([i915#17593])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][413] ([i915#15643])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][414] ([i915#15643]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-dg2:          [PASS][415] -> [SKIP][416] ([i915#3555] / [i915#8813]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][417] ([i915#14544] / [i915#15643]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][418] ([i915#15643]) +7 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][419] ([i915#15643] / [i915#5190])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][420] ([i915#17493]) +3 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-glk10:        NOTRUN -> [SKIP][421] ([i915#17484]) +2 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#15643]) +2 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][423] ([i915#15643]) +4 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][424] ([i915#17522]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][425] ([i915#17484]) +3 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-glk11:        NOTRUN -> [SKIP][426] ([i915#17484]) +3 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [PASS][427] -> [SKIP][428] ([i915#16708] / [i915#5354]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][429] ([i915#15991] / [i915#5354]) +7 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][430] ([i915#17428] / [i915#1825]) +5 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][431] ([i915#17428]) +97 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][432] ([i915#17588]) +22 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb4/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-glk:          NOTRUN -> [SKIP][433] ([i915#17517]) +58 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][434] ([i915#15991] / [i915#17428]) +13 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][435] ([i915#17428]) +102 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-glk10:        NOTRUN -> [SKIP][436] ([i915#17517]) +4 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][437] ([i915#17559])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-rkl:          NOTRUN -> [SKIP][438] ([i915#5439])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-tglu-1:       NOTRUN -> [SKIP][439] ([i915#5439])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][440] ([i915#15990] / [i915#4423] / [i915#8708])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][441] ([i915#15102]) +33 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][442] ([i915#15102]) +60 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][443] ([i915#15990] / [i915#8708])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][444] ([i915#14544] / [i915#17428] / [i915#1825])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][445] ([i915#5439])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][446] ([i915#14544] / [i915#15102]) +4 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][447] ([i915#15989]) +15 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][448] ([i915#15102]) +50 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][449] ([i915#15102]) +19 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk10:        NOTRUN -> [SKIP][450] ([i915#17482]) +44 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][451] ([i915#16708]) +9 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][452] ([i915#15990]) +27 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][453] ([i915#15989]) +30 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][454] ([i915#15989]) +23 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][455] ([i915#15989]) +4 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-rkl:          NOTRUN -> [SKIP][456] ([i915#15989]) +19 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][457] ([i915#15990])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][458] ([i915#17517]) +5 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-glk:          [PASS][459] -> [SKIP][460] ([i915#17517]) +6 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-plflip-blt.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:
    - shard-tglu-1:       NOTRUN -> [SKIP][461] ([i915#15989]) +10 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][462] ([i915#15990]) +9 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:
    - shard-rkl:          [PASS][463] -> [SKIP][464] ([i915#15989]) +13 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][465] ([i915#15104] / [i915#15990]) +1 other test skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-glk:          NOTRUN -> [SKIP][466] ([i915#17482]) +132 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-glk11:        NOTRUN -> [SKIP][467] ([i915#17482]) +32 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][468] ([i915#16708] / [i915#5354]) +4 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
    - shard-rkl:          NOTRUN -> [SKIP][469] ([i915#14544] / [i915#17428]) +11 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][470] ([i915#15990] / [i915#8708]) +2 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][471] ([i915#15991] / [i915#17428] / [i915#1825]) +9 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][472] ([i915#17428]) +50 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][473] ([i915#15990] / [i915#8708]) +25 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][474] ([i915#15102]) +8 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt.html
    - shard-snb:          NOTRUN -> [SKIP][475] ([i915#17482]) +14 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][476] ([i915#15991]) +12 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-tglu:         [PASS][477] -> [FAIL][478] ([i915#17104])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-tglu-9/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
    - shard-glk:          NOTRUN -> [FAIL][479] ([i915#17102])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-tglu:         NOTRUN -> [FAIL][480] ([i915#17101] / [i915#17108] / [i915#17188])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
    - shard-glk10:        NOTRUN -> [FAIL][481] ([i915#17101] / [i915#17108])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-snb:          NOTRUN -> [SKIP][482] ([i915#17472])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-glk10:        NOTRUN -> [SKIP][483] ([i915#17498])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][484] ([i915#3555] / [i915#8228])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_hdr@bpc-switch-suspend.html
    - shard-snb:          NOTRUN -> [SKIP][485] ([i915#17498])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          NOTRUN -> [SKIP][486] ([i915#12713])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg1:          NOTRUN -> [SKIP][487] ([i915#3555] / [i915#8228]) +1 other test skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu:         NOTRUN -> [SKIP][488] ([i915#3555] / [i915#8228])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-glk:          NOTRUN -> [SKIP][489] ([i915#17498]) +3 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_hdr@static-swap.html
    - shard-mtlp:         NOTRUN -> [SKIP][490] ([i915#12713] / [i915#16490] / [i915#3555] / [i915#8228])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][491] ([i915#16644] / [i915#3555] / [i915#8228]) +1 other test skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-dg2:          [PASS][492] -> [SKIP][493] ([i915#16746] / [i915#3555]) +1 other test skip
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-5/igt@kms_invalid_mode@bad-vsync-end.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][494] ([i915#15460])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_joiner@basic-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][495] ([i915#15460])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_joiner@basic-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][496] ([i915#15460])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_joiner@basic-big-joiner.html
    - shard-glk10:        NOTRUN -> [SKIP][497] ([i915#17512])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][498] ([i915#15459])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][499] ([i915#15459])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_joiner@basic-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][500] ([i915#15459])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][501] ([i915#15459])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-glk:          NOTRUN -> [SKIP][502] ([i915#17567]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][503] ([i915#15458])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][504] ([i915#15458])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][505] ([i915#17678])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][506] ([i915#6301])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-dg1:          NOTRUN -> [SKIP][507] ([i915#17455]) +4 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
    - shard-tglu:         NOTRUN -> [SKIP][508] ([i915#17455]) +8 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
    - shard-glk10:        NOTRUN -> [SKIP][509] ([i915#17540])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-glk10:        NOTRUN -> [SKIP][510] ([i915#17601])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-glk:          NOTRUN -> [SKIP][511] ([i915#17479]) +8 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
    - shard-tglu-1:       NOTRUN -> [SKIP][512] ([i915#15709])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][513] ([i915#16386]) +1 other test skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-dg2:          [PASS][514] -> [SKIP][515] ([i915#8825]) +1 other test skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-glk10:        NOTRUN -> [SKIP][516] ([i915#17479]) +1 other test skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-glk11:        NOTRUN -> [SKIP][517] ([i915#17479])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][518] ([i915#15709]) +7 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][519] ([i915#17494]) +5 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-4.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][520] ([i915#15709]) +3 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][521] ([i915#15709]) +1 other test skip
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html
    - shard-dg2:          NOTRUN -> [SKIP][522] ([i915#15709]) +1 other test skip
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-snb:          NOTRUN -> [SKIP][523] ([i915#17479])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][524] ([i915#16386]) +1 other test skip
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][525] ([i915#16386]) +3 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html
    - shard-tglu:         NOTRUN -> [SKIP][526] ([i915#16386]) +1 other test skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][527] ([i915#16386]) +1 other test skip
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][528] ([i915#15709]) +3 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-dg2:          NOTRUN -> [SKIP][529] ([i915#16112])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
    - shard-rkl:          NOTRUN -> [SKIP][530] ([i915#16112])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-mtlp:         [PASS][531] -> [FAIL][532] ([i915#17208]) +1 other test fail
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-7/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - shard-snb:          NOTRUN -> [SKIP][533] ([i915#17595])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb6/igt@kms_plane_alpha_blend@alpha-7efc.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk10:        NOTRUN -> [FAIL][534] ([i915#10647] / [i915#12169])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][535] ([i915#10647]) +1 other test fail
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][536] ([i915#17509])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][537] ([i915#13958]) +2 other tests skip
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-glk:          NOTRUN -> [SKIP][538] ([i915#17586])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          NOTRUN -> [SKIP][539] ([i915#13958])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-rkl:          NOTRUN -> [SKIP][540] ([i915#13958]) +1 other test skip
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-1/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-tglu:         NOTRUN -> [SKIP][541] ([i915#13958])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][542] ([i915#13958])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-glk11:        NOTRUN -> [SKIP][543] ([i915#17542])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][544] ([i915#14259])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][545] ([i915#14259])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-dg2:          [PASS][546] -> [SKIP][547] ([i915#17356] / [i915#9423])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-1/igt@kms_plane_scaling@invalid-parameters.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2:          NOTRUN -> [SKIP][548] ([i915#15329] / [i915#17356] / [i915#9423])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][549] ([i915#15329]) +2 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b:
    - shard-snb:          NOTRUN -> [SKIP][550] ([i915#17528]) +5 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][551] ([i915#15329] / [i915#17356])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-glk:          NOTRUN -> [SKIP][552] ([i915#17529]) +1 other test skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html
    - shard-dg1:          NOTRUN -> [SKIP][553] ([i915#15329]) +4 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - shard-glk:          NOTRUN -> [SKIP][554] ([i915#17528]) +1 other test skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][555] ([i915#15329] / [i915#3555])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][556] ([i915#15329]) +3 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-dg2:          [PASS][557] -> [SKIP][558] ([i915#15329] / [i915#17356] / [i915#9423]) +2 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a:
    - shard-dg2:          [PASS][559] -> [SKIP][560] ([i915#15329]) +8 other tests skip
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:
    - shard-dg2:          [PASS][561] -> [SKIP][562] ([i915#15329] / [i915#17356]) +2 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][563] ([i915#15329]) +9 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][564] ([i915#17529]) +2 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb4/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][565] ([i915#12343] / [i915#9812]) +1 other test skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-glk10:        NOTRUN -> [SKIP][566] ([i915#17462])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_pm_backlight@basic-brightness.html
    - shard-dg2:          NOTRUN -> [SKIP][567] ([i915#12343] / [i915#5354])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_pm_backlight@basic-brightness.html
    - shard-rkl:          NOTRUN -> [SKIP][568] ([i915#12343] / [i915#5354])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_pm_backlight@basic-brightness.html
    - shard-snb:          NOTRUN -> [SKIP][569] ([i915#17462])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][570] ([i915#12343])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][571] ([i915#12343] / [i915#5354]) +1 other test skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-glk:          NOTRUN -> [SKIP][572] ([i915#17462]) +1 other test skip
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg1:          NOTRUN -> [SKIP][573] ([i915#15948])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][574] ([i915#3361])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-glk10:        NOTRUN -> [SKIP][575] ([i915#17564])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-glk:          NOTRUN -> [SKIP][576] ([i915#17703])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-glk:          NOTRUN -> [SKIP][577] ([i915#17573])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_pm_lpsp@screens-disabled.html
    - shard-rkl:          NOTRUN -> [SKIP][578] ([i915#8430])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][579] ([i915#15073])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][580] ([i915#15073])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-snb:          NOTRUN -> [SKIP][581] ([i915#17473]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][582] ([i915#15073]) +1 other test skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][583] -> [SKIP][584] ([i915#17446])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-8/igt@kms_pm_rpm@i2c.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_pm_rpm@i2c.html
    - shard-dg1:          [PASS][585] -> [DMESG-WARN][586] ([i915#4423])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg1-12/igt@kms_pm_rpm@i2c.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          [PASS][587] -> [SKIP][588] ([i915#15073]) +1 other test skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][589] -> [SKIP][590] ([i915#15073]) +2 other tests skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-glk:          NOTRUN -> [SKIP][591] ([i915#15073]) +2 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-rkl:          NOTRUN -> [SKIP][592] ([i915#14544] / [i915#15073])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][593] ([i915#15073])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-glk:          NOTRUN -> [SKIP][594] ([i915#17709])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg2:          NOTRUN -> [SKIP][595] ([i915#17434] / [i915#17450])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_pm_rpm@pc8-residency.html
    - shard-rkl:          NOTRUN -> [SKIP][596] ([i915#17434] / [i915#17450])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_pm_rpm@pc8-residency.html
    - shard-dg1:          NOTRUN -> [SKIP][597] ([i915#17434] / [i915#17450])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_pm_rpm@pc8-residency.html
    - shard-tglu:         NOTRUN -> [SKIP][598] ([i915#17434] / [i915#17450])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_pm_rpm@pc8-residency.html
    - shard-mtlp:         NOTRUN -> [SKIP][599] ([i915#17450])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-dg1:          NOTRUN -> [SKIP][600] ([i915#4077]) +13 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [PASS][601] -> [SKIP][602] ([i915#9519])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          [PASS][603] -> [INCOMPLETE][604] ([i915#10553] / [i915#13356])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-glk4/igt@kms_pm_rpm@system-suspend-modeset.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][605] ([i915#6524]) +1 other test skip
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html
    - shard-snb:          NOTRUN -> [SKIP][606] ([i915#17569])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][607] ([i915#6524])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][608] ([i915#6524])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-1:       NOTRUN -> [SKIP][609] ([i915#6524])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-glk:          NOTRUN -> [SKIP][610] ([i915#17481])
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][611] ([i915#11520]) +3 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-glk11:        NOTRUN -> [SKIP][612] ([i915#11520]) +2 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][613] ([i915#11520]) +14 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][614] ([i915#11520])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
    - shard-mtlp:         NOTRUN -> [SKIP][615] ([i915#12316]) +1 other test skip
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][616] ([i915#9808])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][617] ([i915#11520]) +5 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][618] ([i915#11520]) +10 other tests skip
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-7/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
    - shard-dg2:          NOTRUN -> [SKIP][619] ([i915#11520])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][620] ([i915#11520]) +9 other tests skip
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][621] ([i915#11520]) +3 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][622] ([i915#11520] / [i915#14544])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][623] ([i915#9683])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-glk:          NOTRUN -> [SKIP][624] ([i915#17546])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][625] ([i915#1072] / [i915#9732]) +6 other tests skip
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_psr@fbc-pr-sprite-mmap-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][626] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-mmap-gtt.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-glk10:        NOTRUN -> [SKIP][627] ([i915#17480]) +8 other tests skip
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][628] ([i915#17480]) +31 other tests skip
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk1/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-glk11:        NOTRUN -> [SKIP][629] ([i915#17480]) +6 other tests skip
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][630] ([i915#1072] / [i915#9732]) +22 other tests skip
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_psr@fbc-psr2-sprite-render.html
    - shard-snb:          NOTRUN -> [SKIP][631] ([i915#17480]) +2 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb6/igt@kms_psr@fbc-psr2-sprite-render.html
    - shard-mtlp:         NOTRUN -> [SKIP][632] ([i915#9688]) +4 other tests skip
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][633] ([i915#9732]) +8 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-glk10:        NOTRUN -> [SKIP][634] ([i915#17480] / [i915#9732])
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][635] ([i915#9732]) +19 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][636] ([i915#1072] / [i915#9732]) +31 other tests skip
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][637] ([i915#15949])
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-glk11:        NOTRUN -> [SKIP][638] ([i915#17554])
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][639] ([i915#15949])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-snb:          NOTRUN -> [SKIP][640] ([i915#17554])
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][641] ([i915#15949])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-rkl:          NOTRUN -> [SKIP][642] ([i915#15949])
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-glk:          NOTRUN -> [INCOMPLETE][643] ([i915#15492] / [i915#16184])
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][644] ([i915#5289])
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][645] ([i915#5289])
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-glk11:        NOTRUN -> [SKIP][646] ([i915#17488])
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-glk:          NOTRUN -> [SKIP][647] ([i915#17488]) +2 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][648] ([i915#17432] / [i915#5289])
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][649] ([i915#3555]) +9 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full.html
    - shard-glk10:        NOTRUN -> [SKIP][650] ([i915#17501])
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-glk11:        NOTRUN -> [SKIP][651] ([i915#17501])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu-1:       NOTRUN -> [ABORT][652] ([i915#13179]) +1 other test abort
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html
    - shard-glk11:        NOTRUN -> [ABORT][653] ([i915#13179]) +1 other test abort
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-glk:          NOTRUN -> [SKIP][654] ([i915#17463])
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][655] ([i915#8623])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk:          NOTRUN -> [FAIL][656] ([i915#10959])
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          NOTRUN -> [ABORT][657] ([i915#15132]) +2 other tests abort
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][658] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-rkl:          [PASS][659] -> [INCOMPLETE][660] ([i915#12276])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-8/igt@kms_vblank@ts-continuation-suspend.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][661] ([i915#12276])
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          NOTRUN -> [SKIP][662] ([i915#15243] / [i915#3555]) +1 other test skip
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-glk:          NOTRUN -> [SKIP][663] ([i915#17520]) +4 other tests skip
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-glk10:        NOTRUN -> [SKIP][664] ([i915#17520])
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          NOTRUN -> [SKIP][665] ([i915#15243] / [i915#3555])
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-glk:          NOTRUN -> [SKIP][666] ([i915#17561])
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][667] ([i915#9906]) +1 other test skip
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@gen12-group-exclusive-stream-sample-oa:
    - shard-glk10:        NOTRUN -> [SKIP][668] ([i915#17536])
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@perf@gen12-group-exclusive-stream-sample-oa.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-glk:          NOTRUN -> [SKIP][669] ([i915#17536])
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk3/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-glk11:        NOTRUN -> [SKIP][670] ([i915#17536])
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@polling-parameterized:
    - shard-snb:          NOTRUN -> [SKIP][671] ([i915#17592]) +2 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb7/igt@perf@polling-parameterized.html

  * igt@perf_pmu@event-wait:
    - shard-glk:          NOTRUN -> [SKIP][672] ([i915#17698]) +1 other test skip
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@perf_pmu@event-wait.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][673] ([i915#13356] / [i915#14242] / [i915#16236])
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk2/igt@perf_pmu@rc6-suspend.html

  * igt@prime_udl@share-import-addfb:
    - shard-glk11:        NOTRUN -> [SKIP][674] ([i915#16420])
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@prime_udl@share-import-addfb.html
    - shard-dg1:          NOTRUN -> [SKIP][675] ([i915#16420])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-glk11:        NOTRUN -> [SKIP][676] ([i915#17467])
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk11/igt@prime_vgem@fence-flip-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][677] ([i915#3708])
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-tglu-1:       NOTRUN -> [SKIP][678] ([i915#17448])
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_preempt_timeout@invalid@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][679] ([i915#17632]) +1 other test skip
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb5/igt@sysfs_preempt_timeout@invalid@bcs0.html

  * igt@sysfs_preempt_timeout@invalid@rcs0:
    - shard-snb:          NOTRUN -> [SKIP][680] ([i915#17631]) +1 other test skip
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-snb5/igt@sysfs_preempt_timeout@invalid@rcs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][681] ([i915#17447])
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@tools_test@sysfs_l3_parity.html
    - shard-tglu:         NOTRUN -> [SKIP][682] ([i915#17447])
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@tools_test@sysfs_l3_parity.html
    - shard-glk10:        NOTRUN -> [SKIP][683] ([i915#17545])
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk10/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-read:
    - shard-dg2:          [SKIP][684] ([i915#2582]) -> [PASS][685]
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@fbdev@unaligned-read.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@fbdev@unaligned-read.html

  * igt@gem_ctx_freq@sysfs:
    - shard-mtlp:         [FAIL][686] ([i915#16505] / [i915#9561]) -> [PASS][687] +1 other test pass
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-2/igt@gem_ctx_freq@sysfs.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@gem_ctx_freq@sysfs.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [INCOMPLETE][688] ([i915#13356]) -> [PASS][689]
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][690] ([i915#15733] / [i915#5138]) -> [PASS][691] +2 other tests pass
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          [DMESG-WARN][692] ([i915#13363]) -> [PASS][693]
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
    - shard-tglu:         [DMESG-WARN][694] ([i915#13363]) -> [PASS][695]
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-tglu-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - shard-tglu:         [DMESG-WARN][696] ([i915#17147]) -> [PASS][697]
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-tglu-2/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
    - shard-rkl:          [DMESG-WARN][698] ([i915#17147]) -> [PASS][699]
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][700] ([i915#17158]) -> [PASS][701]
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-edp-1.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [INCOMPLETE][702] ([i915#15582]) -> [PASS][703] +1 other test pass
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html

  * igt@kms_color@degamma:
    - shard-dg2:          [SKIP][704] ([i915#12655] / [i915#17373]) -> [PASS][705] +1 other test pass
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_color@degamma.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_color@degamma.html

  * igt@kms_color_pipeline@plane-ctm3x4:
    - shard-dg2:          [SKIP][706] ([i915#15529]) -> [PASS][707]
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_color_pipeline@plane-ctm3x4.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_color_pipeline@plane-ctm3x4.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          [FAIL][708] ([i915#13566]) -> [PASS][709] +3 other tests pass
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html
    - shard-tglu:         [FAIL][710] ([i915#13566]) -> [PASS][711] +1 other test pass
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - shard-dg2:          [SKIP][712] ([i915#11190] / [i915#17356]) -> [PASS][713] +1 other test pass
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-dg2:          [SKIP][714] ([i915#1849]) -> [PASS][715]
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_fbcon_fbt@fbc.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2:          [SKIP][716] ([i915#5354]) -> [PASS][717] +12 other tests pass
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_flip@flip-vs-suspend.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-6/igt@kms_flip@flip-vs-suspend.html
    - shard-rkl:          [INCOMPLETE][718] ([i915#16276] / [i915#6113]) -> [PASS][719]
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2:          [SKIP][720] ([i915#3555] / [i915#8813]) -> [PASS][721] +2 other tests pass
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][722] ([i915#16708]) -> [PASS][723] +1 other test pass
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [SKIP][724] ([i915#16708] / [i915#5354]) -> [PASS][725] +7 other tests pass
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-glk:          [SKIP][726] ([i915#17517]) -> [PASS][727] +4 other tests pass
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-glk3/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt:
    - shard-rkl:          [SKIP][728] ([i915#15989]) -> [PASS][729] +12 other tests pass
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-dg2:          [SKIP][730] ([i915#17357]) -> [PASS][731] +1 other test pass
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-dg2:          [SKIP][732] ([i915#16746] / [i915#3555]) -> [PASS][733] +4 other tests pass
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_invalid_mode@uint-max-clock.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-tglu:         [DMESG-FAIL][734] ([i915#16772]) -> [PASS][735]
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-7/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-dg2:          [SKIP][736] ([i915#8825]) -> [PASS][737]
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-dg2:          [SKIP][738] ([i915#15329] / [i915#17356] / [i915#9423]) -> [PASS][739] +4 other tests pass
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
    - shard-dg2:          [SKIP][740] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423]) -> [PASS][741]
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:
    - shard-dg2:          [SKIP][742] ([i915#15329]) -> [PASS][743] +20 other tests pass
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:
    - shard-dg2:          [SKIP][744] ([i915#15329] / [i915#17356]) -> [PASS][745] +6 other tests pass
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-dg2:          [SKIP][746] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423]) -> [PASS][747]
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-dg2:          [SKIP][748] ([i915#13441]) -> [PASS][749]
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg1:          [DMESG-WARN][750] ([i915#4423]) -> [PASS][751]
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg1-12/igt@kms_pm_rpm@basic-rte.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][752] ([i915#15073]) -> [PASS][753]
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          [SKIP][754] ([i915#17446] / [i915#3547]) -> [PASS][755] +1 other test pass
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_pm_rpm@drm-resources-equal.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][756] ([i915#15073]) -> [PASS][757] +1 other test pass
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-dg2:          [SKIP][758] ([i915#11521]) -> [PASS][759]
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_properties@plane-properties-atomic.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_psr@psr2-suspend@edp-1:
    - shard-mtlp:         [FAIL][760] ([i915#17226]) -> [PASS][761] +1 other test pass
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-5/igt@kms_psr@psr2-suspend@edp-1.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@kms_psr@psr2-suspend@edp-1.html

  * igt@kms_universal_plane@universal-plane-sanity:
    - shard-dg2:          [SKIP][762] ([i915#17356]) -> [PASS][763] +66 other tests pass
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_universal_plane@universal-plane-sanity.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_universal_plane@universal-plane-sanity.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-mtlp:         [ABORT][764] ([i915#17146]) -> [PASS][765] +1 other test pass
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@device_reset@cold-reset-bound:
    - shard-rkl:          [SKIP][766] ([i915#11078] / [i915#14544]) -> [SKIP][767] ([i915#11078])
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@device_reset@cold-reset-bound.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@device_reset@cold-reset-bound.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          [SKIP][768] ([i915#7697]) -> [SKIP][769] ([i915#14544] / [i915#7697])
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-4/igt@gem_basic@multigpu-create-close.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          [SKIP][770] ([i915#14544] / [i915#280]) -> [SKIP][771] ([i915#280])
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@gem_ctx_sseu@engines.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][772] ([i915#14544] / [i915#4525]) -> [SKIP][773] ([i915#4525]) +2 other tests skip
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          [SKIP][774] ([i915#6334]) -> [SKIP][775] ([i915#14544] / [i915#6334]) +1 other test skip
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-7/igt@gem_exec_capture@capture-invisible@smem0.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          [SKIP][776] ([i915#14544] / [i915#3281]) -> [SKIP][777] ([i915#3281]) +9 other tests skip
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          [SKIP][778] ([i915#3281]) -> [SKIP][779] ([i915#14544] / [i915#3281]) +5 other tests skip
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_lmem_swapping@basic:
    - shard-rkl:          [SKIP][780] ([i915#14544] / [i915#4613]) -> [SKIP][781] ([i915#4613]) +1 other test skip
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@gem_lmem_swapping@basic.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          [SKIP][782] ([i915#4613]) -> [SKIP][783] ([i915#14544] / [i915#4613])
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          [SKIP][784] ([i915#3282]) -> [SKIP][785] ([i915#14544] / [i915#3282]) +2 other tests skip
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@snoop:
    - shard-rkl:          [SKIP][786] ([i915#14544] / [i915#3282]) -> [SKIP][787] ([i915#3282]) +4 other tests skip
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@gem_pread@snoop.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-1/igt@gem_pread@snoop.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [SKIP][788] ([i915#13717]) -> [SKIP][789] ([i915#13717] / [i915#14544])
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-context.html
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          [SKIP][790] ([i915#14544] / [i915#8411]) -> [SKIP][791] ([i915#8411])
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [SKIP][792] ([i915#8411]) -> [SKIP][793] ([i915#14544] / [i915#8411]) +1 other test skip
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          [SKIP][794] ([i915#14544] / [i915#17433] / [i915#3297]) -> [SKIP][795] ([i915#17433] / [i915#3297])
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          [SKIP][796] ([i915#14544] / [i915#3297]) -> [SKIP][797] ([i915#3297]) +1 other test skip
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-rkl:          [SKIP][798] ([i915#14544] / [i915#17455]) -> [SKIP][799] ([i915#17455])
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          [SKIP][800] ([i915#14544] / [i915#2527]) -> [SKIP][801] ([i915#2527]) +2 other tests skip
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          [SKIP][802] ([i915#2527]) -> [SKIP][803] ([i915#14544] / [i915#2527]) +1 other test skip
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-3/igt@gen9_exec_parse@bb-start-out.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          [SKIP][804] ([i915#14544] / [i915#8399]) -> [SKIP][805] ([i915#8399])
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][806] ([i915#8399]) -> [SKIP][807] ([i915#14544] / [i915#8399])
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          [SKIP][808] ([i915#14544] / [i915#16080] / [i915#16166]) -> [SKIP][809] ([i915#16080] / [i915#16166])
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][810] ([i915#14544] / [i915#4387]) -> [SKIP][811] ([i915#4387])
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@i915_pm_sseu@full-enable.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][812] ([i915#17150]) -> [ABORT][813] ([i915#17175]) +1 other test abort
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          [SKIP][814] ([i915#1769] / [i915#3555]) -> [SKIP][815] ([i915#17356])
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          [SKIP][816] ([i915#17356]) -> [SKIP][817] ([i915#1769] / [i915#3555])
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][818] ([i915#17356]) -> [SKIP][819] ([i915#17431]) +1 other test skip
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          [SKIP][820] ([i915#4538] / [i915#5286]) -> [SKIP][821] ([i915#14544] / [i915#4538] / [i915#5286]) +2 other tests skip
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][822] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][823] ([i915#4538] / [i915#5286])
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          [SKIP][824] ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][825] ([i915#17431] / [i915#3638]) +4 other tests skip
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][826] ([i915#14544] / [i915#3828]) -> [SKIP][827] ([i915#3828])
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2:          [SKIP][828] ([i915#17431]) -> [SKIP][829] ([i915#17356]) +3 other tests skip
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][830] ([i915#14544] / [i915#4538]) -> [SKIP][831] ([i915#4538]) +5 other tests skip
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2:          [SKIP][832] ([i915#4538] / [i915#5190]) -> [SKIP][833] ([i915#17356] / [i915#5190]) +3 other tests skip
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-rkl:          [SKIP][834] ([i915#4538]) -> [SKIP][835] ([i915#14544] / [i915#4538]) +1 other test skip
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][836] ([i915#17356] / [i915#5190]) -> [SKIP][837] ([i915#4538] / [i915#5190]) +11 other tests skip
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][838] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][839] ([i915#14098] / [i915#6095]) +8 other tests skip
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][840] ([i915#12313]) -> [SKIP][841] ([i915#12313] / [i915#14544])
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][842] ([i915#17356]) -> [SKIP][843] ([i915#12313]) +4 other tests skip
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          [SKIP][844] ([i915#10307] / [i915#6095]) -> [SKIP][845] ([i915#17356]) +8 other tests skip
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][846] ([i915#17356]) -> [SKIP][847] ([i915#10307] / [i915#10434] / [i915#6095])
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-rkl:          [SKIP][848] ([i915#14098] / [i915#6095]) -> [SKIP][849] ([i915#14098] / [i915#14544] / [i915#6095]) +5 other tests skip
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][850] ([i915#17356]) -> [SKIP][851] ([i915#12805])
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][852] ([i915#12805]) -> [SKIP][853] ([i915#12805] / [i915#14544])
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-mtlp:         [FAIL][854] ([i915#17158]) -> [INCOMPLETE][855] ([i915#15582])
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-dg2:          [SKIP][856] ([i915#6095]) -> [SKIP][857] ([i915#17356])
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2:          [SKIP][858] ([i915#17356]) -> [SKIP][859] ([i915#6095])
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          [SKIP][860] ([i915#17356]) -> [SKIP][861] ([i915#10307] / [i915#6095]) +10 other tests skip
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
    - shard-rkl:          [SKIP][862] ([i915#17427]) -> [SKIP][863] ([i915#14544] / [i915#17427])
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-rkl:          [SKIP][864] ([i915#14544] / [i915#16471] / [i915#17427]) -> [SKIP][865] ([i915#16471] / [i915#17427])
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-rkl:          [SKIP][866] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][867] ([i915#11151] / [i915#7828]) +1 other test skip
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-rkl:          [SKIP][868] ([i915#11151]) -> [SKIP][869] ([i915#11151] / [i915#14544])
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-rkl:          [SKIP][870] ([i915#11151] / [i915#7828]) -> [SKIP][871] ([i915#11151] / [i915#14544] / [i915#7828])
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          [SKIP][872] ([i915#17356]) -> [SKIP][873] ([i915#15865])
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          [SKIP][874] ([i915#15865]) -> [SKIP][875] ([i915#17356]) +2 other tests skip
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-6/igt@kms_content_protection@content-type-change.html
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          [SKIP][876] ([i915#17356]) -> [SKIP][877] ([i915#15330] / [i915#3299])
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_content_protection@dp-mst-type-1.html
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-rkl:          [SKIP][878] ([i915#14544] / [i915#15330]) -> [SKIP][879] ([i915#15330])
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          [SKIP][880] ([i915#13049]) -> [SKIP][881] ([i915#13049] / [i915#14544])
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          [SKIP][882] ([i915#17356]) -> [SKIP][883] ([i915#13049])
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          [SKIP][884] ([i915#3555]) -> [SKIP][885] ([i915#14544] / [i915#3555]) +1 other test skip
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          [SKIP][886] ([i915#3555]) -> [SKIP][887] ([i915#17356]) +5 other tests skip
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          [SKIP][888] ([i915#17356]) -> [SKIP][889] ([i915#13046] / [i915#17454] / [i915#5354]) +3 other tests skip
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          [SKIP][890] ([i915#11190] / [i915#17356]) -> [SKIP][891] ([i915#4103])
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][892] ([i915#14544] / [i915#4103]) -> [SKIP][893] ([i915#4103])
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2:          [SKIP][894] ([i915#13046] / [i915#17454] / [i915#5354]) -> [SKIP][895] ([i915#17356]) +4 other tests skip
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          [SKIP][896] ([i915#14544] / [i915#9067]) -> [SKIP][897] ([i915#9067])
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          [SKIP][898] ([i915#17356]) -> [SKIP][899] ([i915#4103])
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          [SKIP][900] ([i915#17356]) -> [SKIP][901] ([i915#13691])
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_display_modes@extended-mode-basic.html
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2:          [SKIP][902] ([i915#17356]) -> [SKIP][903] ([i915#17289])
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst.html
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-dg2:          [SKIP][904] ([i915#17356]) -> [SKIP][905] ([i915#17285]) +1 other test skip
   [904]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
   [905]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][906] ([i915#13748]) -> [SKIP][907] ([i915#13748] / [i915#14544])
   [906]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst.html
   [907]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          [SKIP][908] ([i915#17356]) -> [SKIP][909] ([i915#8812])
   [908]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html
   [909]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          [SKIP][910] ([i915#14544] / [i915#16361]) -> [SKIP][911] ([i915#16361])
   [910]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html
   [911]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-dg2:          [SKIP][912] ([i915#17356]) -> [SKIP][913] ([i915#16361]) +4 other tests skip
   [912]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html
   [913]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          [SKIP][914] ([i915#16361]) -> [SKIP][915] ([i915#17356])
   [914]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [915]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-rkl:          [SKIP][916] ([i915#16361]) -> [SKIP][917] ([i915#14544] / [i915#16361]) +1 other test skip
   [916]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [917]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          [SKIP][918] ([i915#16599]) -> [SKIP][919] ([i915#16599] / [i915#4423])
   [918]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg1-14/igt@kms_feature_discovery@dp-mst.html
   [919]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg1:          [SKIP][920] ([i915#4423] / [i915#9934]) -> [SKIP][921] ([i915#9934])
   [920]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [921]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-rkl:          [SKIP][922] ([i915#9934]) -> [SKIP][923] ([i915#14544] / [i915#9934]) +4 other tests skip
   [922]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-4/igt@kms_flip@2x-flip-vs-modeset.html
   [923]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][924] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][925] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113])
   [924]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-glk1/igt@kms_flip@2x-flip-vs-suspend.html
   [925]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][926] ([i915#12745] / [i915#13356] / [i915#17183]) -> [INCOMPLETE][927] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [926]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html
   [927]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          [SKIP][928] ([i915#14544] / [i915#9934]) -> [SKIP][929] ([i915#9934]) +2 other tests skip
   [928]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [929]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-dg1:          [SKIP][930] ([i915#9934]) -> [SKIP][931] ([i915#4423] / [i915#9934])
   [930]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg1-15/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [931]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][932] ([i915#14544] / [i915#15643]) -> [SKIP][933] ([i915#15643]) +1 other test skip
   [932]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [933]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][934] ([i915#15643]) -> [SKIP][935] ([i915#14544] / [i915#15643]) +2 other tests skip
   [934]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [935]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][936] ([i915#15104] / [i915#15990]) -> [SKIP][937] ([i915#16708])
   [936]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [937]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][938] ([i915#14544] / [i915#17428]) -> [SKIP][939] ([i915#17428]) +40 other tests skip
   [938]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [939]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][940] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][941] ([i915#17428] / [i915#1825]) +2 other tests skip
   [940]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [941]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-dg2:          [SKIP][942] ([i915#16708] / [i915#5354]) -> [SKIP][943] ([i915#15990] / [i915#8708]) +12 other tests skip
   [942]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
   [943]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          [SKIP][944] ([i915#16708]) -> [SKIP][945] ([i915#15989]) +13 other tests skip
   [944]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [945]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][946] ([i915#17428]) -> [SKIP][947] ([i915#14544] / [i915#17428]) +23 other tests skip
   [946]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html
   [947]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          [SKIP][948] ([i915#17428] / [i915#4423]) -> [SKIP][949] ([i915#17428])
   [948]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg1-12/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt.html
   [949]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][950] ([i915#15991]) -> [SKIP][951] ([i915#16708]) +19 other tests skip
   [950]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite.html
   [951]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
    - shard-dg2:          [SKIP][952] ([i915#15989]) -> [SKIP][953] ([i915#16708]) +10 other tests skip
   [952]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html
   [953]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html
    - shard-dg1:          [SKIP][954] ([i915#15989]) -> [SKIP][955] ([i915#15989] / [i915#4423])
   [954]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html
   [955]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][956] ([i915#16708]) -> [SKIP][957] ([i915#15104] / [i915#15990]) +1 other test skip
   [956]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [957]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][958] ([i915#16708] / [i915#5354]) -> [SKIP][959] ([i915#15102]) +14 other tests skip
   [958]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
   [959]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][960] ([i915#15990] / [i915#8708]) -> [SKIP][961] ([i915#16708] / [i915#5354]) +9 other tests skip
   [960]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [961]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][962] ([i915#17428] / [i915#1825]) -> [SKIP][963] ([i915#14544] / [i915#17428] / [i915#1825]) +2 other tests skip
   [962]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [963]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][964] ([i915#16708] / [i915#5354]) -> [SKIP][965] ([i915#15991] / [i915#5354]) +33 other tests skip
   [964]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [965]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][966] ([i915#15990]) -> [SKIP][967] ([i915#15990] / [i915#4423])
   [966]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [967]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][968] ([i915#16708]) -> [SKIP][969] ([i915#15990]) +25 other tests skip
   [968]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [969]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][970] ([i915#15990]) -> [SKIP][971] ([i915#16708]) +14 other tests skip
   [970]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
   [971]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          [SKIP][972] ([i915#16708]) -> [SKIP][973] ([i915#15991]) +34 other tests skip
   [972]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html
   [973]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2:          [SKIP][974] ([i915#16708] / [i915#4342] / [i915#5354]) -> [SKIP][975] ([i915#9766])
   [974]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [975]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2:          [SKIP][976] ([i915#15991] / [i915#5354]) -> [SKIP][977] ([i915#16708] / [i915#5354]) +20 other tests skip
   [976]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
   [977]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          [SKIP][978] ([i915#15102]) -> [SKIP][979] ([i915#16708] / [i915#5354]) +8 other tests skip
   [978]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [979]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          [SKIP][980] ([i915#14544] / [i915#15102]) -> [SKIP][981] ([i915#15102]) +24 other tests skip
   [980]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html
   [981]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][982] ([i915#15102]) -> [SKIP][983] ([i915#16708]) +12 other tests skip
   [982]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render.html
   [983]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - shard-rkl:          [SKIP][984] ([i915#15102]) -> [SKIP][985] ([i915#14544] / [i915#15102]) +19 other tests skip
   [984]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
   [985]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy:
    - shard-dg1:          [SKIP][986] ([i915#15102]) -> [SKIP][987] ([i915#15102] / [i915#4423])
   [986]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy.html
   [987]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite:
    - shard-dg2:          [SKIP][988] ([i915#16708]) -> [SKIP][989] ([i915#15102]) +21 other tests skip
   [988]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html
   [989]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          [SKIP][990] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][991] ([i915#17356])
   [990]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-6/igt@kms_hdr@bpc-switch.html
   [991]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][992] ([i915#14544] / [i915#16644]) -> [SKIP][993] ([i915#12713] / [i915#16644])
   [992]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html
   [993]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][994] ([i915#14544] / [i915#16644] / [i915#3555] / [i915#8228]) -> [SKIP][995] ([i915#16644] / [i915#3555] / [i915#8228])
   [994]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_hdr@invalid-hdr.html
   [995]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [SKIP][996] ([i915#17356]) -> [SKIP][997] ([i915#16518] / [i915#3555] / [i915#8228]) +1 other test skip
   [996]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_hdr@static-toggle.html
   [997]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          [SKIP][998] ([i915#14544] / [i915#15458]) -> [SKIP][999] ([i915#15458])
   [998]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html
   [999]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          [SKIP][1000] ([i915#15459]) -> [SKIP][1001] ([i915#14544] / [i915#15459])
   [1000]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [1001]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-rkl:          [SKIP][1002] ([i915#14544] / [i915#16451]) -> [SKIP][1003] ([i915#16451])
   [1002]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_mst@mst-suspend-read-crc.html
   [1003]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][1004] ([i915#15815]) -> [SKIP][1005] ([i915#14544] / [i915#15815])
   [1004]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [1005]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][1006] ([i915#6301]) -> [SKIP][1007] ([i915#14544] / [i915#6301])
   [1006]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-8/igt@kms_panel_fitting@legacy.html
   [1007]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-rkl:          [SKIP][1008] ([i915#14544] / [i915#14712]) -> [SKIP][1009] ([i915#14712])
   [1008]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [1009]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          [SKIP][1010] ([i915#13705]) -> [SKIP][1011] ([i915#17356])
   [1010]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [1011]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-rkl:          [SKIP][1012] ([i915#14544] / [i915#15709]) -> [SKIP][1013] ([i915#15709])
   [1012]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
   [1013]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-rkl:          [SKIP][1014] ([i915#15709]) -> [SKIP][1015] ([i915#14544] / [i915#15709]) +1 other test skip
   [1014]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
   [1015]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-rkl:          [SKIP][1016] ([i915#14544] / [i915#3555]) -> [SKIP][1017] ([i915#3555])
   [1016]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html
   [1017]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          [SKIP][1018] ([i915#13958] / [i915#14544]) -> [SKIP][1019] ([i915#13958])
   [1018]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html
   [1019]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2:          [SKIP][1020] ([i915#13958]) -> [SKIP][1021] ([i915#17356]) +1 other test skip
   [1020]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-x.html
   [1021]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          [SKIP][1022] ([i915#17356]) -> [SKIP][1023] ([i915#13958])
   [1022]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-y.html
   [1023]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-rkl:          [SKIP][1024] ([i915#13958]) -> [SKIP][1025] ([i915#13958] / [i915#14544])
   [1024]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-yf.html
   [1025]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          [SKIP][1026] ([i915#17356]) -> [SKIP][1027] ([i915#14259])
   [1026]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_plane_multiple@tiling-y.html
   [1027]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
    - shard-rkl:          [SKIP][1028] ([i915#14544] / [i915#15329]) -> [SKIP][1029] ([i915#15329]) +3 other tests skip
   [1028]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html
   [1029]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-rkl:          [SKIP][1030] ([i915#16914]) -> [SKIP][1031] ([i915#14544] / [i915#16914])
   [1030]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-3/igt@kms_pm_dc@dc5-psr-suspend-resume.html
   [1031]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][1032] ([i915#11520] / [i915#14544]) -> [SKIP][1033] ([i915#11520]) +3 other tests skip
   [1032]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [1033]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][1034] ([i915#11520]) -> [SKIP][1035] ([i915#11520] / [i915#14544]) +2 other tests skip
   [1034]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [1035]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][1036] ([i915#1072] / [i915#9732]) -> [SKIP][1037] ([i915#1072] / [i915#14544] / [i915#9732]) +8 other tests skip
   [1036]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [1037]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          [SKIP][1038] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][1039] ([i915#1072] / [i915#9732]) +12 other tests skip
   [1038]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html
   [1039]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          [SKIP][1040] ([i915#12755] / [i915#15867]) -> [SKIP][1041] ([i915#17356])
   [1040]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-5/igt@kms_rotation_crc@primary-rotation-270.html
   [1041]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          [SKIP][1042] ([i915#14544] / [i915#17432] / [i915#5289]) -> [SKIP][1043] ([i915#17432] / [i915#5289])
   [1042]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [1043]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          [SKIP][1044] ([i915#17356] / [i915#5190]) -> [SKIP][1045] ([i915#12755] / [i915#15867] / [i915#5190]) +1 other test skip
   [1044]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [1045]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          [SKIP][1046] ([i915#17356]) -> [SKIP][1047] ([i915#12755] / [i915#15867])
   [1046]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html
   [1047]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg2:          [SKIP][1048] ([i915#17356]) -> [SKIP][1049] ([i915#3555]) +3 other tests skip
   [1048]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_scaling_modes@scaling-mode-center.html
   [1049]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_vrr@flip-suspend:
    - shard-dg2:          [SKIP][1050] ([i915#17356]) -> [SKIP][1051] ([i915#15243] / [i915#3555])
   [1050]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_vrr@flip-suspend.html
   [1051]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          [SKIP][1052] ([i915#9906]) -> [SKIP][1053] ([i915#17356])
   [1052]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-3/igt@kms_vrr@max-min.html
   [1053]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_vrr@max-min.html
    - shard-rkl:          [SKIP][1054] ([i915#14544] / [i915#9906]) -> [SKIP][1055] ([i915#9906])
   [1054]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@kms_vrr@max-min.html
   [1055]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [SKIP][1056] ([i915#17356]) -> [SKIP][1057] ([i915#3555] / [i915#9906])
   [1056]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-dg2-7/igt@kms_vrr@negative-basic.html
   [1057]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_vrr@negative-basic.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-rkl:          [SKIP][1058] ([i915#14544] / [i915#17416]) -> [SKIP][1059] ([i915#17416]) +1 other test skip
   [1058]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@perf_pmu@event-wait@rcs0.html
   [1059]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          [SKIP][1060] ([i915#14544] / [i915#17448] / [i915#3291] / [i915#3708]) -> [SKIP][1061] ([i915#17448] / [i915#3291] / [i915#3708])
   [1060]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19416/shard-rkl-6/igt@prime_vgem@basic-fence-read.html
   [1061]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@prime_vgem@basic-fence-read.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16108
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16505
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16772]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16772
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17104
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116
  [i915#17146]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146
  [i915#17147]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17147
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17160]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17160
  [i915#17175]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17175
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
  [i915#17208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17208
  [i915#17226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17226
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17288]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288
  [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
  [i915#17356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
  [i915#17357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357
  [i915#17359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359
  [i915#17373]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
  [i915#17394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17394
  [i915#17405]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17405
  [i915#17415]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17415
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17446]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17446
  [i915#17447]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17447
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17456]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17472]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17472
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
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529
  [i915#17530]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17530
  [i915#17531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17531
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17535]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17535
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537
  [i915#17538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17538
  [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17542
  [i915#17545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17545
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
  [i915#17552]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17552
  [i915#17554]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554
  [i915#17556]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17556
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561
  [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
  [i915#17566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17566
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17568]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568
  [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
  [i915#17570]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17570
  [i915#17572]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17572
  [i915#17573]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17573
  [i915#17576]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576
  [i915#17580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580
  [i915#17582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17582
  [i915#17586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586
  [i915#17587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17587
  [i915#17588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588
  [i915#17590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17590
  [i915#17592]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17592
  [i915#17593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17593
  [i915#17594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17594
  [i915#17595]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17595
  [i915#17599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17599
  [i915#17601]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17601
  [i915#17603]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17603
  [i915#17605]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17605
  [i915#17621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17621
  [i915#17624]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17624
  [i915#17625]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17625
  [i915#17628]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17628
  [i915#17631]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17631
  [i915#17632]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17632
  [i915#17635]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17635
  [i915#17639]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17639
  [i915#17664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17664
  [i915#17678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17678
  [i915#17680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17680
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17690]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17690
  [i915#17697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17697
  [i915#17698]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17698
  [i915#17703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703
  [i915#17706]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17706
  [i915#17707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17707
  [i915#17709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17709
  [i915#17711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17711
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
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
  * IGT: IGT_9171 -> IGTPW_16075
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_19416: d8a353e238652bec29fd452babdaae0044d30b9b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16075: 16075
  IGT_9171: 9171
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/index.html

--===============1268508009330377488==
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
<tr><td><b>Series:</b></td><td>tests/msm/msm_bo: Add mapping and free tests=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/177182/">https://patchwork.freedesktop.org/series/177182/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16075/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16075/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19416_full -&gt; IGTPW_16075_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16075_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_16075_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/index=
.html</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1607=
5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_linear_blits@interruptible:<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg1-16/igt@gem_linear_blits@interruptible.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/sha=
rd-dg1-14/igt@gem_linear_blits@interruptible.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16075_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@api_intel_bb@crc32.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576">=
i915#17576</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@api_intel_bb@crc32.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">=
i915#6230</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@api_intel_bb@crc32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230"=
>i915#6230</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@api_intel_bb@crc32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230"=
>i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-ca=
che.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@device_reset@cold-reset-bound.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17537">i915#17537</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_read@empty-block:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@drm_read@empty-block.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/ig=
t@drm_read@empty-block.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17359">i915#17359</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@fbdev@read.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@fbdev@re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2582">i915#2582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17697">i915#17697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@gem_busy@semaphore.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936"=
>i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk6/igt@gem_ccs@block-copy-compressed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17499">i915#17499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@gem_ccs@block-multicopy-compresse=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9323">i915#9323</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb6/igt@gem_ccs@block-multicopy-compressed=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17499">i915#17499</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@gem_ccs@block-multicopy-compress=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@gem_ccs@block-multicopy-compress=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_ccs@ctrl-surf-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-1/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/=
igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348<=
/a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk1/igt@gem_close_race@multigpu-basic-proc=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17568">i915#17568</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@gem_compute@compute-square.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17552">i915#17552</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@gem_create@create-ext-cpu-access=
-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@gem_create@create-ext-cpu-access-s=
anity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17513">i915#17513</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@gem_create@create-ext-cpu-access-=
sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_create@create-ext-set-pat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17530">i915#17530</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@gem_create@create-ext-set-pat.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8562">i915#8562</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@gem_create@create-ext-set-pat.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb5/igt@gem_ctx_isolation@nonpriv.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17639">i915#17639</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s=
3@vcs1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17176">i915#17176</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@gem_ctx_param@set-priority-not-sup=
ported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17535">i915#17535</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-cl=
ose.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb7/igt@gem_ctx_persistence@legacy-engines=
-hostile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb4/igt@gem_ctx_persistence@saturated-host=
ile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17621">i915#17621</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_ctx_sseu@engines.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1749=
6">i915#17496</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
80">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-tglu-3/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt=
@gem_eio@hibernate.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17415">i915#17415</a>)</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-4/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-8/igt=
@gem_eio@hibernate.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17415">i915#17415</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-2/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@g=
em_eio@hibernate.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17415">i915#17415</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@gem_exec_balancer@bonded-dual.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb4/igt@gem_exec_balancer@full.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/175=
87">i915#17587</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabu=
f-import-out-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk1/igt@gem_exec_balancer@parallel-keep-in=
-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17547">i915#17547</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-i=
n-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@gem_exec_balancer@parallel-order=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_exec_balancer@parallel-out-fe=
nce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17547">i915#17547</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-2/igt@gem_exec_big@single.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-8/i=
gt@gem_exec_big@single.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15871">i915#15871</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_exec_capture@capture-invisibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_exec_capture@capture-recovera=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17711">i915#17711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@gem_exec_fence@submit.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/481=
2">i915#4812</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb1/igt@gem_exec_fence@submit.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1759=
9">i915#17599</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-8/igt@gem_exec_fence@submit.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/48=
12">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@gem_exec_flush@basic-batch-kerne=
l-default-cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3711">i915#3711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-6/igt@gem_exec_flush@basic-uc-prw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@gem_exec_flush@basic-wb-prw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@gem_exec_flush@basic-wb-prw-defa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@gem_exec_params@secure-non-maste=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-active.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@gem_exec_reloc@basic-cpu-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@gem_exec_reloc@basic-write-read-=
active.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@gem_exec_schedule@preempt-queue.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@wide:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb5/igt@gem_exec_schedule@wide.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/175=
90">i915#17590</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mt=
lp-5/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17160">i915#17160</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-glk4/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk9=
/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13196">i915#13196</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13=
356</a>) +1 other test incomplete</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-8/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl=
-1/igt@gem_exec_suspend@basic-s3.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542">i915#155=
42</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb5/igt@gem_exec_whisper@basic-queues-prio=
rity-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17628">i915#17628</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@gem_fence_thrash@bo-write-verify-=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4860">i915#4860</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify=
-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4860">i915#4860</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@gem_fence_thrash@bo-write-verify=
-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_huc_copy@huc-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
56">i915#17456</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_lmem_evict@dontneed-evict-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17605">i915#17605</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@gem_lmem_evict@dontneed-evict-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@gem_lmem_swapping@heavy-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@gem_lmem_swapping@heavy-verify-m=
ulti.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4613">i915#4613</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb5/igt@gem_lmem_swapping@heavy-verify-mul=
ti.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4565">i915#4565</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@gem_lmem_swapping@parallel-random-=
engines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17503">i915#17503</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@gem_lmem_swapping@parallel-random=
-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>) +5 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@gem_lmem_swapping@parallel-rando=
m-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12193">i915#12193</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_lmem_swapping@verify.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@gem_mmap@basic.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i91=
5#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-cpu-read-gtt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_mmap_gtt@basic-write-cpu-read=
-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17572">i915#17572</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@gem_mmap_gtt@coherency.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/175=
82">i915#17582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-big-copy-odd=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@gem_mmap_offset@clear-via-pagefa=
ult.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16108">i915#16108</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17394">i915#17394</a>) +1 other test inco=
mplete</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write-distinct:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@gem_mmap_wc@read-write-distinct.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@gem_mmap_wc@write-wc-read-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4083">i915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@gem_partial_pwrite_pread@write-di=
splay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@gem_partial_pwrite_pread@write-di=
splay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@gem_partial_pwrite_pread@write-d=
isplay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb7/igt@gem_ppgtt@flink-and-close-vma-leak=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17635">i915#17635</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@gem_pread@exhaustion.html">WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/265=
8">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@gem_pwrite@basic-exhaustion.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@gem_pxp@reject-modify-context-prot=
ection-off-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17521">i915#17521</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@gem_pxp@reject-modify-context-pr=
otection-off-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_pxp@verify-pxp-stale-buf-exec=
ution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17521">i915#17521</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_pxp@verify-pxp-stale-ctx-exec=
ution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17521">i915#17521</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@gem_readwrite@write-bad-handle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@gem_render_copy@x-tiled-to-vebox-=
yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17492">i915#17492</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@gem_render_copy@y-tiled-to-vebox-y=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17492">i915#17492</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-linear:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_render_copy@yf-tiled-to-vebox=
-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17492">i915#17492</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@gem_render_copy@yf-tiled-to-vebox=
-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb4/igt@gem_render_copy@yf-tiled-to-vebox-=
linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17492">i915#17492</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-8/igt@gem_render_copy@yf-tiled-to-vebo=
x-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@gem_set_tiling_vs_blt@tiled-to-t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17430">i915#17430</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk4/igt@gem_softpin@evict-snoop.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
551">i915#17551</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-2/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-=
3/igt@gem_softpin@noreloc-s3.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17405">i915#17405</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_tiled_pread_pwrite.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@gem_userptr_blits@coherency-sync=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@gem_userptr_blits@coherency-unsync=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@gem_userptr_blits@dmabuf-sync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@gem_userptr_blits@invalid-mmap-of=
fset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@gem_userptr_blits@readonly-pwrit=
e-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@gem_userptr_blits@readonly-unsync=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17507">i915#17507</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb7/igt@gem_userptr_blits@readonly-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17507">i915#17507</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@gem_userptr_blits@relocations.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@gem_userptr_blits@relocations.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@gem_userptr_blits@relocations.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@gem_userptr_blits@relocations.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@gem_userptr_blits@sd-probe.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb5/igt@gen3_render_tiledx_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7511">i915#17511</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@gen7_exec_parse@basic-offset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17505">i915#17505</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@gen7_exec_parse@basic-rejected.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17455">i915#17455</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@gen7_exec_parse@basic-rejected.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17455">i915#17455</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb5/igt@gen7_exec_parse@basic-rejected.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17505">i915#17505</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@gen7_exec_parse@cmd-crossing-pag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@gen7_exec_parse@load-register-re=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@gen9_exec_parse@bb-start-cmd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gen9_exec_parse@bb-start-cmd.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-10/igt@gen9_exec_parse@cmd-crossing-pa=
ge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@gen9_exec_parse@cmd-crossing-page=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@gen9_exec_parse@unaligned-access=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@gen9_exec_parse@valid-registers.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@i915_drm_fdinfo@isolation@rcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-active:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb4/igt@i915_drm_fdinfo@memory-info-active=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17603">i915#17603</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@i915_drm_fdinfo@virtual-busy-idl=
e-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14118">i915#14118</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@i915_hangman@gt-engine-error@bcs0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17580">i915#17580</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@i915_module_load@reload-no-displ=
ay.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@i915_module_load@reload-no-displ=
ay.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@i915_module_load@resize-bar.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6412">i915#6412</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@i915_module_load@resize-bar.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17566">i915#17566</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk2/igt@i915_pm_freq_api@freq-reset-multip=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17526">i915#17526</a>) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-mult=
iple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@i915_pm_freq_api@freq-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17526">i915#17526</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/s=
hard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6590">i915#6590</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb6/igt@i915_pm_freq_mult@media-freq@gt0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17624">i915#17624</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@i915_pm_freq_mult@media-freq@gt0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@i915_pm_freq_mult@media-freq@gt1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6590">i915#6590</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17690">i915#17690</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17706">i915#17706</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk1/igt@i915_pm_rpm@system-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@i915_pm_rps@min-max-config-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@i915_pm_rps@thresholds-park.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@i915_query@query-topology-known-=
pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk1/igt@intel_hwmon@hwmon-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/116=
80">i915#11680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-hang:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-6/igt@kms_async_flips@async-flip-hang.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/sha=
rd-dg2-7/igt@kms_async_flips@async-flip-hang.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)=
 +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_atomic@plane-primary-overlay-=
mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_atomic_transition@plane-all-mo=
deset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_big_fb@4-tiled-16bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17478">i915#17478</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_big_fb@4-tiled-16bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_big_fb@4-tiled-32bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_big_fb@4-tiled-32bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17478">i915#17478</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_big_fb@4-tiled-addfb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5286">i915#5286</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_big_fb@4-tiled-addfb.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17556">i915#17556</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +9 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb1/igt@kms_big_fb@linear-max-hw-stride-32=
bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_big_fb@linear-max-hw-stride-32=
bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17524">i915#17524</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_big_fb@linear-max-hw-stride-3=
2bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-6=
4bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_big_fb@x-tiled-16bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17500">i915#17500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@kms_big_fb@x-tiled-32bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17431">i915#17431</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_big_fb@x-tiled-64bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17500">i915#17500</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_big_fb@x-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_big_fb@y-tiled-16bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17500">i915#17500</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_big_fb@y-tiled-max-hw-stride-=
32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_big_fb@yf-tiled-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17478">i915#17478</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_big_fb@yf-tiled-addfb-size-o=
ffset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17432">i915#17432</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb5/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +3 other tests ski=
p</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-6/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_big_fb@yf-tiled-max-hw-stride=
-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4538">i915#4538</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_busy@extended-pageflip-hang-=
newfb.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_ccs@bad-aux-stride-4-tiled-mt=
l-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +15 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-=
dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +14 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-=
dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb4/igt@kms_ccs@bad-pixel-format-y-tiled-g=
en12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17594">i915#17594</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_ccs@bad-rotation-90-4-tiled-d=
g2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +41 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +205 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-mc-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +94 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-tiled=
-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a=
-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#1=
7491</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_ccs@crc-primary-suspend-4-tile=
d-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +49 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-c=
cs@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-c=
cs@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-mc-ccs@pipe-b-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +2 other t=
ests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tile=
d-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) =
+1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +107 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +97 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-y=
-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +65=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_ccs@random-ccs-data-y-tiled-=
gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_ccs@random-ccs-data-y-tiled-ge=
n12-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +130 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_cdclk@mode-rejected-max-dotcl=
ock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17550">i915#17550</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_cdclk@mode-transition.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3742">i915#3742</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb6/igt@kms_cdclk@mode-transition.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17550">i915#17550</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@kms_cdclk@mode-transition@pipe-b=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13781">i915#13781</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hd=
mi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_chamelium_audio@dp-audio.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17483">i915#17483</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_chamelium_audio@dp-audio-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_chamelium_audio@hdmi-audio.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17483">i915#17483</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@kms_chamelium_color@ctm-limited-=
range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_chamelium_color@ctm-max.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17489">i915#17489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_chamelium_color@ctm-negative.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_chamelium_color@ctm-red-to-bl=
ue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17489">i915#17489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_chamelium_color@gamma.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17427">i915#17427</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_chamelium_color_pipeline@pla=
ne-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other =
test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb1/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 othe=
r tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-10/igt@kms_chamelium_color_pipeline@pl=
ane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#174=
27</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-mu=
ltiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-non=
planar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_chamelium_hpd@dp-hpd-after-run=
time-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17483">i915#17483</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_chamelium_hpd@dp-hpd-enable-d=
isable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-storm-d=
isable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +11 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-after-=
runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-after=
-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_chamelium_hpd@hdmi-hpd-after=
-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_chamelium_hpd@hdmi-hpd-with-e=
nabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests ski=
p</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb1/igt@kms_chamelium_hpd@hdmi-hpd-with-en=
abled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17483">i915#17483</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-with-=
enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_color@ctm-0-50.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655"=
>i915#12655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17373">i915#17373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-3/igt@kms_color@ctm-red-to-blue.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2=
-7/igt@kms_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_color_pipeline@plane-ctm3x4@p=
ipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb5/igt@kms_color_pipeline@plane-fixed-mat=
rix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk9/igt@kms_color_pipeline@plane-fixed-mat=
rix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_color_pipeline@plane-lut1d.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_color_pipeline@plane-lut1d-c=
tm3x4-lut1d@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +31 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_color_pipeline@plane-lut1d-l=
ut1d@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16990">i915#16990</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-1:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg1-12/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@p=
ipe-a-plane-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_color_pipeline@plane-lut1d-pos=
t-ctm3x4@pipe-a-plane-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17116">i915#17116</a>) +3 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_color_pipeline@plane-lut1d-po=
st-ctm3x4@pipe-a-plane-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17116">i915#17116</a>) +3 other tests fail=
</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_color_pipeline@plane-lut1d-p=
ost-ctm3x4@pipe-a-plane-2.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17116">i915#17116</a>) +3 other tests fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_color_pipeline@plane-lut1d-po=
st-ctm3x4@pipe-c-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_content_protection@atomic-dpm=
s-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_content_protection@atomic-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_content_protection@content-typ=
e-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17508">i915#17508</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_content_protection@dp-mst-lic=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb6/igt@kms_content_protection@dp-mst-lic-=
type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17502">i915#17502</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_content_protection@dp-mst-lic=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_content_protection@dp-mst-type=
-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17502">i915#17502</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_content_protection@dp-mst-typ=
e-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_content_protection@mei-interf=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_content_protection@suspend-re=
sume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_content_protection@uevent.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_cursor_crc@cursor-offscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17533">i915#17533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-6=
4x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_cursor_crc@cursor-onscreen-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17504">i915#17504</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x=
42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_cursor_crc@cursor-random-32x3=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_cursor_crc@cursor-random-max-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17504">i915#17504</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movem=
ent-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) +7 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb1/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17504">i915#17504</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hd=
mi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16075/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a=
-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk1/igt@kms_cursor_crc@cursor-suspend.html=
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
/tree/drm-tip/IGTPW_16075/shard-glk1/igt@kms_cursor_crc@cursor-suspend@pipe=
-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#141=
52</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk1/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17457">i915#17457</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-at=
omic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16075/shard-dg2-7/igt@kms_cursor_legacy@basic-flip-before-cursor-a=
tomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_cursor_legacy@cursora-vs-fli=
pb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#174=
54</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flip=
a-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17428">i915#17428</a>) +73 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-fl=
ipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flip=
b-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17356">i915#17356</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_cursor_legacy@cursorb-vs-flip=
b-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-fli=
pb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-10/igt@kms_cursor_legacy@short-busy-fl=
ip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17515">i915#17515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17515">i915#17515</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3804">i915#3804</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
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
/tree/drm-tip/IGTPW_16075/shard-glk2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17487">i915#17487</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17486">i915#17486</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_dp_aux_dev@basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257=
">i915#1257</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_dp_aux_dev@basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257=
">i915#1257</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_dp_aux_dev@basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/125=
7">i915#1257</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_dp_aux_dev@basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/125=
7">i915#1257</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_dp_aux_dev@basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17538=
">i915#17538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-6/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17288">i915#17288</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17288">i915#17288</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17288">i915#17288</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb1/igt@kms_dp_link_training@non-uhbr-sst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17664">i915#17664</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-7/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17288">i915#17288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_dp_link_training@non-uhbr-sst=
-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17531">i915#17531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_dp_link_training@uhbr-mst-di=
rect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_dp_link_training@uhbr-sst.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17477">i915#17477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst-tb=
talt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_dp_linktrain_fallback@dp-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16867">i915#16867</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16867">i915#16867</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_dp_linktrain_fallback@dp-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17625">i915#17625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb4/igt@kms_dp_linktrain_fallback@dsc-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17680">i915#17680</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-8/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_dsc@dsc-fractional-bpp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_dsc@dsc-fractional-bpp-ultrajo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17458">i915#17458</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@kms_dsc@dsc-fractional-bpp-ultra=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_dsc@dsc-with-bpc-bigjoiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16361">i915#16361</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_dsc@dsc-with-formats.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_dsc@dsc-with-formats-bigjoine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16361">i915#16361</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_dsc@dsc-with-formats-bigjoine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16361">i915#16361</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_dsc@dsc-with-formats-bigjoin=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-=
ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_fbcon_fbt@fbc-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_fbcon_fbt@psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680"=
>i915#16680</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516">=
i915#17516</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_feature_discovery@display-2x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16081">i915#16081</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_feature_discovery@display-2x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_feature_discovery@dp-mst.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17570">i915#17570</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_feature_discovery@dsc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17539">i915#17539</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_feature_discovery@hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_feature_discovery@psr1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17707">i915#17707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-1/igt@kms_feature_discovery@vrr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_flip@2x-blocking-wf_vblank.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_flip@2x-flip-vs-fences.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_flip@2x-flip-vs-panning-vs-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_flip@2x-flip-vs-panning-vs-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interr=
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
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interr=
uptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_flip@2x-plain-flip.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/99=
34">i915#9934</a>) +6 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-7/igt@kms_flip@2x-plain-flip.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9934">i915#9934</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs=
-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-3/igt@kms_flip@dpms-off-confusion-interruptible.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16075/shard-dg2-7/igt@kms_flip@dpms-off-confusion-interruptible.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/53=
54">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb6/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17593">i915#17593</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp=
-xtile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp=
-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#156=
43</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +7 other te=
sts skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests =
skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_flip_scaled_crc@flip-64bpp-lin=
ear-to-32bpp-linear-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-=
shrfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p=
-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +97 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb4/igt@kms_frontbuffer_tracking@fbchdr-1p=
-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17588">i915#17588</a>) +22 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-1p=
-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +58 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-=
2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>)=
 +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@kms_frontbuffer_tracking@fbchdr-=
2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +102 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_frontbuffer_tracking@fbchdr-2=
p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-ti=
ling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17559">i915#17559</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +33 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +60 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#174=
28</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +50 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +19 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +44 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-1p-=
offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +27 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +30 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +23 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +4 other tes=
ts skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +19 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_frontbuffer_tracking@hdr-2p-=
primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb1/igt@kms_frontbuffer_tracking@hdr-2p-pr=
imscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-shrfb=
-plflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16075/shard-glk3/igt@kms_frontbuffer_tracking@hdr-2p-scndsc=
rn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17517">i915#17517</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-ind=
fb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15989">i915#15989</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-rgb1=
01010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15990">i915#15990</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprim=
ary.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16075/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15989">i915#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk1/igt@kms_frontbuffer_tracking@psr-1p-pr=
i-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17482">i915#17482</a>) +132 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +32 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) =
+4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>=
) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/182=
5">i915#1825</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +50 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +25 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-1=
p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +8 other tests s=
kip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb4/igt@kms_frontbuffer_tracking@psrhdr-1p=
-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +14 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-2=
p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-tglu-9/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
75/shard-tglu-4/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17104">i91=
5#17104</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_hdmi_audio_bw@audio-bw-hblank1=
60.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17102">i915#17102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_hdmi_audio_bw@suspend-disk-a=
udio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17101">i915#17101</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188">i915#17188</a>=
)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_hdmi_audio_bw@suspend-disk-au=
dio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17101">i915#17101</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb4/igt@kms_hdmi_inject@inject-audio.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17472">i915#17472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_hdr@bpc-switch.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498"=
>i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_hdr@bpc-switch-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_hdr@static-swap.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498"=
>i915#17498</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@kms_hdr@static-swap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1271=
3">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16490">i915#16490</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-5/igt@kms_invalid_mode@bad-vsync-end.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shar=
d-dg2-7/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i9=
15#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_joiner@basic-big-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15460">i915#15460</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15460">i915#15460</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15460">i915#15460</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_joiner@basic-big-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17512">i915#17512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15459">i915#15459</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15459">i915#15459</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15459">i915#15459</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_joiner@basic-force-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17567">i915#17567</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_joiner@basic-force-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15458">i915#15458</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_joiner@invalid-modeset-force-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17678">i915#17678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_pipe_b_c_ivb@enable-pipe-c-w=
hile-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17455">i915#17455</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_pipe_b_c_ivb@enable-pipe-c-w=
hile-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17455">i915#17455</a>) +8 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_pipe_b_c_ivb@enable-pipe-c-wh=
ile-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_pipe_stress@stress-xrgb8888-4=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17601">i915#17601</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_plane@pixel-format-4-tiled-bmg=
-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +8 other tests=
 skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-b=
mg-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_plane@pixel-format-4-tiled-dg=
2-mc-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-=
modifier.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-cc=
s-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_plane@pixel-format-4-tiled-mo=
difier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-m=
tl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_plane@pixel-format-x-tiled-mod=
ifier@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_plane@pixel-format-y-tiled-g=
en12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</=
li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_plane@pixel-format-y-tiled-ge=
n12-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_plane@pixel-format-y-tiled-gen=
12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane=
-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-1/igt@kms_plane@pixel-format-y-tiled-ge=
n12-rc-ccs-cc-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 ot=
her tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:=
</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_plane@pixel-format-yf-tiled-m=
odifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_plane@planar-pixel-format-set=
tings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_plane@planar-pixel-format-set=
tings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-7/igt@kms_plane@plane-panning-bottom-right-suspend=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16075/shard-mtlp-5/igt@kms_plane@plane-panning-bottom-right-suspend.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17208">i915#17208</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb6/igt@kms_plane_alpha_blend@alpha-7efc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17595">i915#17595</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaqu=
e-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaqu=
e-fb@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_plane_lowres@tiling-4.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17509">i915#17509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>) +2 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_plane_multiple@2x-tiling-4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17586">i915#17586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_plane_multiple@2x-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-1/igt@kms_plane_multiple@2x-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13958">i915#13958</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_plane_multiple@tiling-4.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17542">i915#17542</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-1/igt@kms_plane_scaling@invalid-parameters.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1607=
5/shard-dg2-7/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#=
17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@plane-downscale=
-factor-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i9=
15#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@plane-downscale=
-factor-0-5-with-modifiers@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b:<=
/p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb6/igt@kms_plane_scaling@plane-downscale-=
factor-0-5-with-modifiers@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@plane-downscale=
-factor-0-5-with-modifiers@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_plane_scaling@plane-scaler-uni=
ty-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +1 other tes=
t skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-u=
nity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_plane_scaling@plane-scaler-uni=
ty-scaling-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-mo=
difiers.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-wit=
h-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-mo=
difiers@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20=
x20-with-modifiers@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-mo=
difiers@pipe-d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20=
x20-with-modifiers@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb4/igt@kms_plane_scaling@planes-scaler-un=
ity-scaling@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17529">i915#17529</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9812">i915#9812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17462">i915#17462</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_pm_backlight@basic-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk1/igt@kms_pm_backlight@fade-with-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17462">i915#17462</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_pm_dc@dc5-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_pm_dc@dc6-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361"=
>i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_pm_dc@dc6-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">=
i915#17564</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703">=
i915#17703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_pm_lpsp@screens-disabled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17573">i915#17573</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_pm_rpm@dpms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/150=
73">i915#15073</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473=
">i915#17473</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_pm_rpm@dpms-non-lpsp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-8/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@km=
s_pm_rpm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17446">i915#17446</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg1-12/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@k=
ms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7=
/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shar=
d-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_pm_rpm@modeset-lpsp-stress-no-=
wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no=
-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_pm_rpm@modeset-pc8-residency-s=
tress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17709">i915#17709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_pm_rpm@pc8-residency.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17450">i915#17450</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_pm_rpm@pc8-residency.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17450">i915#17450</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-12/igt@kms_pm_rpm@pc8-residency.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17450">i915#17450</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_pm_rpm@pc8-residency.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17450">i915#17450</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@kms_pm_rpm@pc8-residency.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-caching:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_pm_rpm@pm-caching.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
77">i915#4077</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shar=
d-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-glk4/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/sh=
ard-glk8/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553">i915#10=
553</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6524">i915#6524</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_prime@basic-crc-hybrid.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17569">i915#17569</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-5/igt@kms_prime@basic-crc-hybrid.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6524">i915#6524</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@kms_prime@basic-crc-hybrid.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@kms_properties@colorop-properties-=
legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_psr2_sf@fbc-pr-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_psr2_sf@fbc-psr2-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-=
edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-7/igt@kms_psr2_sf@pr-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_psr2_sf@pr-overlay-primary-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-u=
pdate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_psr2_sf@psr2-primary-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_psr@fbc-pr-sprite-mmap-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-mmap-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_psr@fbc-psr-sprite-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17480">i915#17480</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk1/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17480">i915#17480</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_psr@fbc-psr2-cursor-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17480">i915#17480</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_psr@fbc-psr2-sprite-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) +22 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb6/igt@kms_psr@fbc-psr2-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17480">i915#17480</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-mtlp-4/igt@kms_psr@fbc-psr2-sprite-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9688">i915#9688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_psr@psr-cursor-plane-move.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17480">i915#17480</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_psr@psr-cursor-plane-onoff.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-14/igt@kms_psr@psr-sprite-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_psr_stress_test@flip-primary-=
invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb7/igt@kms_psr_stress_test@invalidate-pri=
mary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_psr_stress_test@invalidate-pr=
imary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_psr_stress_test@invalidate-pr=
imary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-top.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15492">i915#15492</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_rotation_crc@primary-x-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_rotation_crc@primary-y-tiled-r=
eflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17488">i915#17488</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-f=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +9 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_scaling_modes@scaling-mode-fu=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_scaling_modes@scaling-mode-fu=
ll-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@kms_selftest@drm_framebuffer.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_setmode@invalid-clone-exclusiv=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17463">i915#17463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-15/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10959">i915#10959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-s=
uspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15132">i915#15132</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk6/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) =
+1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-8/igt@kms_vblank@ts-continuation-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/=
shard-rkl-7/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i91=
5#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_vblank@ts-continuation-suspen=
d@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk4/igt@kms_vrr@flip-basic-fastset.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17520">i915#17520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@kms_vrr@flip-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">=
i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_vrr@flipline.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i=
915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@kms_vrr@lobf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561">i915#1=
7561</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-3/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@perf@gen12-group-exclusive-stream=
-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk3/igt@perf@gen12-oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@perf@gen12-unprivileged-single-ct=
x-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb7/igt@perf@polling-parameterized.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17592">i915#17592</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk5/igt@perf_pmu@event-wait.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17698"=
>i915#17698</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk2/igt@perf_pmu@rc6-suspend.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14242">i915#14242</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16236">i915#16236</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@prime_udl@share-import-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16420">i915#16420</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@prime_udl@share-import-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk11/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17467">i915#17467</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-1/igt@prime_vgem@fence-read-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17448">i915#17448</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@invalid@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb5/igt@sysfs_preempt_timeout@invalid@bcs0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17632">i915#17632</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@invalid@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-snb5/igt@sysfs_preempt_timeout@invalid@rcs0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17631">i915#17631</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17447">i915#17447</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-tglu-4/igt@tools_test@sysfs_l3_parity.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17447">i915#17447</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-glk10/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17545">i915#17545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@fbdev@unaligned-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075=
/shard-dg2-1/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-2/igt@gem_ctx_freq@sysfs.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16505">i915#165=
05</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9561">i915#9561</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16075/shard-mtlp-3/igt@gem_ctx_freq@sysfs.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@gem_workarounds@suspend-resume-co=
ntext.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> +2 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-res=
et.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13363">i915#13363</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_busy@extended-modese=
t-hang-newfb-with-reset.html">PASS</a></li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-tglu-2/igt@kms_busy@extended-modeset-hang-newfb-with-re=
set.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13363">i915#13363</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_busy@extended-mode=
set-hang-newfb-with-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-tglu-2/igt@kms_busy@extended-modeset-hang-newfb-with-re=
set@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17147">i915#17147</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-tglu-9/igt@kms_busy@extend=
ed-modeset-hang-newfb-with-reset@pipe-a.html">PASS</a></li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-res=
et@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17147">i915#17147</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_busy@extended=
-modeset-hang-newfb-with-reset@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-c=
cs@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@kms_ccs@crc-prim=
ary-suspend-4-tiled-mtl-rc-ccs@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-c=
cs@pipe-c-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-3/igt@kms_ccs@cr=
c-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_color@degamma.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
73">i915#17373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16075/shard-dg2-4/igt@kms_color@degamma.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_color_pipeline@plane-ctm3x4.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529=
">i915#15529</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16075/shard-dg2-3/igt@kms_color_pipeline@plane-ctm3x4.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16075/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html=
">PASS</a> +3 other tests pass</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-tglu-7/igt@kms_cursor_crc@cursor-sliding-256x85.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16075/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-256x85.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_cursor_legacy@basic-flip-before-cursor-va=
rying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_cu=
rsor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/sha=
rd-dg2-3/igt@kms_fbcon_fbt@fbc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5=
354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
075/shard-dg2-6/igt@kms_flip@flip-vs-suspend.html">PASS</a> +12 other tests=
 pass</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276"=
>i915#16276</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6113">i915#6113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_flip@flip-vs-suspend.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-=
8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscali=
ng.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_frontbuffe=
r_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_frontbuffer_=
tracking@fbc-rgb565-draw-render.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-glk3/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-i=
ndfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk8/igt@kms_frontbuffer=
_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> +4 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-farfromfence-mma=
p-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_tracking@hd=
r-farfromfence-mmap-gtt.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17357">i915#17357</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16075/shard-dg2-3/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746=
">i915#16746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_invalid_mode@uint-max-clock.=
html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-untiled.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16772">i915#16772</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16075/shard-tglu-7/igt@kms_pipe_stress@stress-xrgb888=
8-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-mod=
ifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_plane@pixel-format-4-tile=
d-dg2-mc-ccs-modifier.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75=
-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shar=
d-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.htm=
l">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
423">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16075/shard-dg2-8/igt@kms_plane_scaling@plane-scaler-with-clipping=
-clamping-modifiers.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe=
-b:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-modifiers@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_pla=
ne_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html">PASS<=
/a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-ro=
tation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-6/igt@km=
s_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html">PASS</a> +6 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#695=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9423">i915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16075/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-2=
5-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441">i9=
15#13441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16075/shard-dg2-5/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg1-12/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i91=
5#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16075/shard-dg1-17/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16075/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17446"=
>i915#17446</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3547">i915#3547</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_pm_rpm@drm-resources-equal.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-=
no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_properties@plane-properties-atomic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11521">i915#11521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_properties@plane-properties-atomic.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend@edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-5/igt@kms_psr@psr2-suspend@edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17226">i9=
15#17226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16075/shard-mtlp-3/igt@kms_psr@psr2-suspend@edp-1.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-sanity:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_universal_plane@universal-plane-sanity.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_universal_plane@universal-plane=
-sanity.html">PASS</a> +66 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17146">i915#17146</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_vblank@ts-continuation-dpms-sus=
pend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@device_reset@cold-reset-bound.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">=
i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@device_reset@cold-reset-bound.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-4/igt@gem_basic@multigpu-create-close.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697"=
>i915#7697</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16075/shard-rkl-6/igt@gem_basic@multigpu-create-close.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16075/shard-rkl-8/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@gem_exec_balancer@parallel-b=
alancer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-7/igt@gem_exec_capture@capture-invisible@smem0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6334">i915#6334</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16075/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16075/shard-rkl-3/igt@gem_lmem_swapping@basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i9=
15#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-u=
ncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@gem_partial_pwrite_pread@wr=
ites-after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@gem_pread@snoop.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"=
>i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16075/shard-rkl-1/igt@gem_pread@snoop.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717"=
>i915#13717</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16075/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i=
915#13717</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@gem_set_tiling_vs_blt@til=
ed-to-untiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-5/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16075/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17433">i915#17433</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@gem_userptr_bli=
ts@coherency-sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17433">i915#17433</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@gem_userptr_blits@dmabuf-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17455">i915#17455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16075/shard-rkl-5/igt@gen7_exec_parse@bitmasks.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1745=
5">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@gen9_exec_parse@batch-inval=
id-length.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-3/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i9=
15#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16075/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@i915_pm_freq_api@freq-reset=
-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i=
915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16075/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@i915_=
pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#161=
66</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4387">i915#4387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16075/shard-rkl-2/igt@i915_pm_sseu@full-enable.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">=
i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume@pi=
pe-d-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17150">i915#17150</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16075/shard-mtlp-7/igt@kms_async_flips@async=
-flip-suspend-resume@pipe-d-edp-1.html">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17175">i915#17175</a>) +1 other =
test abort</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-d=
g2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-interna=
l-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_atomic_=
transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#=
1769</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16075/shard-dg2-3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/453=
8">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-1/=
igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i91=
5#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_big_fb@lin=
ear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_big_fb@=
linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7431">i915#17431</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16075/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-r=
otate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4538">i915#4538</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_big_fb@yf-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16075/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_big_fb@yf-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5190">i915#5190</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@k=
ms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16075/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-bm=
g-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12313">i915#12313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-cc=
s-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_ccs@crc-pr=
imary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +8 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-=
mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i91=
5#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-=
rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_ccs@crc-=
primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12805">i915#12805</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12805">i915#12805</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-c=
cs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17158">i915#17158</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16075/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-=
cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_ccs@random-ccs-data-y-tile=
d-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matr=
ix-yuv-rgb-bt2020.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_chamelium_c=
olor_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
27">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-=
ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-=
2/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i9=
15#16471</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_chame=
lium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspen=
d-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-=
after-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">=
i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-fast.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16075/shard-dg2-8/igt@kms_content_protection@atomic-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-6/igt@kms_content_protection@content-type-change.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_content_protection@content-type=
-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_content_protection@dp-mst-type-1.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16075/shard-dg2-3/igt@kms_content_protection@dp-mst-type-1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-=
resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_conten=
t_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x51=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-512x170.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16075/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16075/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_cursor_legacy@2x-cursor-vs-flip=
-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_cur=
sor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@km=
s_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i9=
15#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tra=
nsitions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#53=
54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
75/shard-dg2-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-va=
rying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17356">i915#17356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotsp=
ot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9067">i915#9067</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_cursor_legac=
y@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_cursor_=
legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#=
4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_display_modes@extended-mode-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16075/shard-dg2-8/igt@kms_display_modes@extended-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
56">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16075/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_dp_link_training@uhbr-mst-tbtal=
t-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">=
i915#13748</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16075/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i91=
5#13748</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16075/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812=
">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16075/shard-rkl-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915=
#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-ul=
trajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg1-14/igt@kms_feature_discovery@dp-mst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">=
i915#16599</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16075/shard-dg1-16/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i91=
5#16599</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg1-12/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt@kms_flip@2=
x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-4/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i91=
5#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16075/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-glk1/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1274=
5">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075=
/shard-glk5/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#123=
14</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6=
113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-glk5=
/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i9=
15#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_flip@2x-modeset-vs-vblank=
-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg1-15/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16075/shard-dg1-16/igt@kms_flip@2x-modeset-vs-vblank-race.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bp=
p-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/=
igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bp=
p-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_flip_scale=
d_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/i=
gt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@km=
s_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915=
#17428</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075=
/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mm=
ap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-m=
map-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_frontbu=
ffer_tracking@fbc-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i91=
5#8708</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-s=
pr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_frontbuf=
fer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#1=
5989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_t=
racking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">=
i915#17428</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg1-12/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-=
spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-19/igt=
@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
28">i915#17428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-s=
pr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuf=
fer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#1=
6708</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dra=
w-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking=
@fbchdr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +10 other test=
s skip</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dr=
aw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_frontbuffer_tracki=
ng@fbchdr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-5/igt@kms_front=
buffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">=
i915#15104</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15990">i915#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-c=
ur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-4/ig=
t@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15102">i915#15102</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-p=
ri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/=
igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5354">i915#5354</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-c=
ur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-p=
ri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15991">i915#15991</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5354">i915#5354</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscr=
een-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_f=
rontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5990">i915#15990</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscr=
n-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990=
">i915#15990</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-f=
liptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer=
_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</=
a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-8/igt@kms_frontbuffer_=
tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>=
) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4342">i915#4342</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-6/igt@kms_frontbuf=
fer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@km=
s_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i9=
15#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5354">i915#5354</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbuffer_tracking@ps=
r-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +8 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_frontbuffer_tracking@=
psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15102">i915#15102</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-=
pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_frontbu=
ffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915=
#16708</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-s=
pr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_frontbuffer_tra=
cking@psrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915=
#15102</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-modesetfrombusy:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-modesetfromb=
usy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16075/shard-dg1-16/igt@kms_frontbuffer_tracking@psr=
hdr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-dra=
w-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-3/igt@kms_frontbuffer_tracking=
@psrhdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-6/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_hdr@bpc-switch.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16644">i915#16644</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16644">i915#16644</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_hdr@inva=
lid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
75/shard-dg2-1/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16075/shard-rkl-3/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15459">i915#15459</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16451">i915#16451</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_mst@mst-suspend-read-crc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-chec=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15815">i915#15815</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_multipipe_modeset@basic-max=
-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6=
301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
075/shard-rkl-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">=
i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14712">i915#14712</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@kms_pipe_stress@stress=
-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13705">i915#13705</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-=
modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-4/igt@kms_plan=
e@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-m=
odifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_plane@pixel-format-y-=
tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16075/shard-rkl-5/igt@kms_plane_lowres@tiling-4.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-4.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16075/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i=
915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16075/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i=
915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958=
">i915#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16075/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i9=
15#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16075/shard-dg2-1/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14=
259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-5/i=
gt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-3/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1691=
4">i915#16914</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16075/shard-rkl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-contin=
uous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-2/igt@km=
s_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i9=
15#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-8/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dm=
g-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-p=
rimary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/107=
2">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16075/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-7/igt@kms_psr@psr2-cursor-m=
map-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-5/igt@kms_rotation_crc@primary-rotation-270.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-7/igt@kms_rotation_crc@primary=
-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@=
kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/528=
9">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-dg2-1/igt@kms_rotation_crc@=
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
/CI_DRM_19416/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16075/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-270.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_scaling_modes@scaling-mode-center.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16075/shard-dg2-5/igt@kms_scaling_modes@scaling-mode-center.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_160=
75/shard-dg2-3/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-3/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard=
-dg2-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906"=
>i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16075/shard-rkl-4/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-dg2-7/igt@kms_vrr@negative-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17=
356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
075/shard-dg2-3/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915=
#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17416">i915#17416</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16075/shard-rkl-8/igt@perf_pmu@event-wait@rcs0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1741=
6">i915#17416</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19416/shard-rkl-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16075/shard-rkl-8/igt@prime_=
vgem@basic-fence-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708=
</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9171 -&gt; IGTPW_16075</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19416: d8a353e238652bec29fd452babdaae0044d30b9b @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_16075: 16075<br />
  IGT_9171: 9171<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============1268508009330377488==--
