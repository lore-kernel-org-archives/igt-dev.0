Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D23606A326
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 13:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1386112A68;
	Fri, 20 Nov 2026 13:30:54 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB3C112A55;
 Fri, 20 Nov 2026 13:29:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5971509368501720767=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fpm=5Fre?=
 =?utf-8?q?sidency=3A_Wait_for_a_stable_C6_before_measuring_residency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Nov 2026 13:29:57 -0000
Message-ID: <179518139761.59281.5301920798688526425@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261119005009.364632-1-zongyao.bai@intel.com>
In-Reply-To: <20261119005009.364632-1-zongyao.bai@intel.com>
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

--===============5971509368501720767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pm_residency: Wait for a stable C6 before measuring residency
URL   : https://patchwork.freedesktop.org/series/178990/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9198_full -> IGTPW_16177_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16177_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16177_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16177_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-tglu:         ([PASS][1], [PASS][2]) -> [SKIP][3]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-10/igt@i915_pm_rpm@system-suspend-devices.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-3/igt@i915_pm_rpm@system-suspend-devices.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-3:
    - shard-glk11:        NOTRUN -> [FAIL][4] +3 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-3.html

  
Known issues
------------

  Here are the changes found in IGTPW_16177_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-glk:          NOTRUN -> [SKIP][5] ([i915#17576])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk4/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#6230])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@api_intel_bb@crc32.html

  * igt@gem_basic@multigpu-create-close:
    - shard-snb:          NOTRUN -> [SKIP][7] ([i915#17675])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_basic@multigpu-create-close.html
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#7697])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gem_basic@multigpu-create-close.html
    - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#7697])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@gem_basic@multigpu-create-close.html
    - shard-glk:          NOTRUN -> [SKIP][10] ([i915#17697])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@gem_basic@multigpu-create-close.html
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#7697])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-glk11:        NOTRUN -> [SKIP][12] ([i915#17499]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-glk:          NOTRUN -> [SKIP][13] ([i915#17499]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk6/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#3555] / [i915#9323]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#9323])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gem_ccs@suspend-resume.html
    - shard-snb:          NOTRUN -> [SKIP][16] ([i915#17499]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][17] ([i915#13356] / [i915#16348])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-snb:          NOTRUN -> [SKIP][18] ([i915#17568])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_compute@compute-square:
    - shard-glk:          NOTRUN -> [SKIP][19] ([i915#17552])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk3/igt@gem_compute@compute-square.html
    - shard-snb:          NOTRUN -> [SKIP][20] ([i915#17552])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_compute@compute-square.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#8555])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8555]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#8555]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][24] ([i915#1099]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_shared@q-in-order:
    - shard-snb:          NOTRUN -> [SKIP][25] ([i915#17342]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_ctx_shared@q-in-order.html

  * igt@gem_ctx_sseu@engines:
    - shard-glk:          NOTRUN -> [SKIP][26] ([i915#17496])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@gem_ctx_sseu@engines.html
    - shard-snb:          NOTRUN -> [SKIP][27] ([i915#17496])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#280]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@gem_ctx_sseu@mmap-args.html
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#280]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4771])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_exec_balancer@bonded-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#4771])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel:
    - shard-snb:          NOTRUN -> [SKIP][32] ([i915#17587]) +8 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-glk:          NOTRUN -> [SKIP][33] ([i915#17547])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#4525])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#4525])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-glk11:        NOTRUN -> [SKIP][36] ([i915#17547])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         ([PASS][37], [PASS][38]) -> [FAIL][39] ([i915#15816])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-8/igt@gem_exec_big@single.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-7/igt@gem_exec_big@single.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-3/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-snb:          NOTRUN -> [SKIP][40] ([i915#17610])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#6334]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gem_exec_capture@capture-invisible@lmem0.html
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#6334]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][43] ([i915#6334]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#6334]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][45] ([i915#16904]) +4 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@gem_exec_capture@capture@vecs0-lmem0.html
    - shard-dg1:          NOTRUN -> [FAIL][46] ([i915#16904]) +2 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit3:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4812]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines:
    - shard-snb:          NOTRUN -> [SKIP][48] ([i915#17599])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#3539])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@gem_exec_flush@basic-uc-set-default.html
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3539])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3539] / [i915#4852]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3539] / [i915#4852]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#17453] / [i915#5107])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#17453])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#17416])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-glk10:        NOTRUN -> [SKIP][56] ([i915#17523])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@gem_exec_params@secure-non-root.html
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#17416])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_exec_params@secure-non-root.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#17416])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_exec_params@secure-non-root.html
    - shard-snb:          NOTRUN -> [SKIP][59] ([i915#17523])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#3281]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@gem_exec_reloc@basic-cpu-wc-active.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#3281]) +10 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3281]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#3281]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4537] / [i915#4812])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_schedule@u-semaphore-noskip:
    - shard-snb:          NOTRUN -> [SKIP][65] ([i915#17590]) +9 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_exec_schedule@u-semaphore-noskip.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-rkl:          [PASS][66] -> [INCOMPLETE][67] ([i915#13356]) +2 other tests incomplete
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_exec_suspend@basic-s0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          [PASS][68] -> [INCOMPLETE][69] ([i915#13196] / [i915#13356]) +1 other test incomplete
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk5/igt@gem_exec_suspend@basic-s3.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk5/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][70] ([i915#17844] / [i915#7975]) +1 other test abort
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-dg1:          NOTRUN -> [ABORT][71] ([i915#17844] / [i915#7975]) +1 other test abort
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-snb:          NOTRUN -> [SKIP][72] ([i915#17628])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-snb:          NOTRUN -> [SKIP][73] ([i915#17655]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_exercise_blt@fast-copy-emit:
    - shard-snb:          NOTRUN -> [SKIP][74] ([i915#17622])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gem_exercise_blt@fast-copy-emit.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4860]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4860]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#4613] / [i915#7582])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-snb:          NOTRUN -> [SKIP][78] ([i915#17605])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-glk11:        NOTRUN -> [SKIP][79] ([i915#17503])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#4613])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][81] ([i915#17503] / [i915#4613]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-glk10:        NOTRUN -> [SKIP][82] ([i915#17503])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#12193])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-snb:          NOTRUN -> [SKIP][84] ([i915#17503]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#4613])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#4613])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4565])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-snb:          NOTRUN -> [SKIP][88] ([i915#17661])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@gem_media_fill@media-fill.html
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#8289])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@gem_media_fill@media-fill.html
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#8289])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#4083]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4077]) +9 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4083]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4083]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#3282])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#3282]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-snb:          NOTRUN -> [SKIP][97] ([i915#17635])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_ppgtt@shrink-vs-evict-pinned:
    - shard-snb:          NOTRUN -> [SKIP][98] ([i915#17615]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gem_ppgtt@shrink-vs-evict-pinned.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][99] ([i915#14702] / [i915#2658])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          [PASS][100] -> [SKIP][101] ([i915#4270])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#4270]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_pxp@display-protected-crc.html
    - shard-snb:          NOTRUN -> [SKIP][103] ([i915#17521]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@gem_pxp@display-protected-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#4270]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@gem_pxp@display-protected-crc.html
    - shard-glk11:        NOTRUN -> [SKIP][105] ([i915#17521])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-glk:          NOTRUN -> [SKIP][106] ([i915#17521]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3282]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@gem_readwrite@beyond-eob.html
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3282]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@y-tiled-ccs-to-x-tiled:
    - shard-snb:          NOTRUN -> [SKIP][109] ([i915#17591]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_render_copy@y-tiled-ccs-to-x-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][110] ([i915#17492]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#5190] / [i915#8428]) +10 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-linear.html
    - shard-glk11:        NOTRUN -> [SKIP][112] ([i915#17492])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-snb:          NOTRUN -> [SKIP][113] ([i915#17492]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#8428]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-glk:          NOTRUN -> [SKIP][115] ([i915#17492]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4079]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4079])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@allocator-fork:
    - shard-snb:          NOTRUN -> [SKIP][118] ([i915#17471]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gem_softpin@allocator-fork.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4885]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gem_softpin@evict-snoop.html
    - shard-glk:          NOTRUN -> [SKIP][120] ([i915#17551])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk9/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4885]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#15657])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gem_tiled_pread_basic@basic.html
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#15657])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#3297]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3297]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-glk10:        NOTRUN -> [SKIP][126] ([i915#17507])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-glk:          NOTRUN -> [SKIP][127] ([i915#17507]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk9/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-glk11:        NOTRUN -> [SKIP][128] ([i915#17507])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#3281] / [i915#3297])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#3281] / [i915#3297])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-snb:          NOTRUN -> [SKIP][131] ([i915#17507]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#3297])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-6/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_vm_create@create-ext:
    - shard-snb:          NOTRUN -> [SKIP][133] ([i915#17596])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_vm_create@create-ext.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          ([PASS][134], [PASS][135]) -> [INCOMPLETE][136] ([i915#13356] / [i915#17880])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@gem_workarounds@suspend-resume.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@gem_workarounds@suspend-resume.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          NOTRUN -> [INCOMPLETE][137] ([i915#13356])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk9/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_mixed_blits:
    - shard-snb:          NOTRUN -> [SKIP][138] ([i915#17688])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gen3_mixed_blits.html

  * igt@gen3_render_tiledx_blits:
    - shard-glk:          NOTRUN -> [SKIP][139] ([i915#17511])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk1/igt@gen3_render_tiledx_blits.html
    - shard-snb:          NOTRUN -> [SKIP][140] ([i915#17511])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#17455]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@gen7_exec_parse@basic-allocation.html
    - shard-glk10:        NOTRUN -> [SKIP][142] ([i915#17505])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@gen7_exec_parse@basic-allocation.html
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#17455])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-8/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-glk:          NOTRUN -> [SKIP][144] ([i915#17505]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk5/igt@gen7_exec_parse@chained-batch.html
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#17455]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gen7_exec_parse@chained-batch.html
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#17455]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@gen7_exec_parse@chained-batch.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-snb:          NOTRUN -> [SKIP][147] ([i915#17505]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#17455])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#2527])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#2527] / [i915#2856])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#2856]) +4 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@gen9_exec_parse@shadow-peek.html
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#2527]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-snb:          NOTRUN -> [SKIP][153] ([i915#17597]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#14123])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@i915_drm_fdinfo@all-busy-idle-check-all.html
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#14123])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@busy-idle@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#14073]) +11 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@i915_drm_fdinfo@busy-idle@bcs0.html

  * igt@i915_drm_fdinfo@busy@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#14073]) +6 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@i915_drm_fdinfo@busy@rcs0.html

  * igt@i915_drm_fdinfo@busy@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#14073]) +15 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@i915_drm_fdinfo@busy@vecs1.html

  * igt@i915_drm_fdinfo@memory-info-active:
    - shard-snb:          NOTRUN -> [SKIP][159] ([i915#17603]) +7 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@i915_drm_fdinfo@memory-info-active.html

  * igt@i915_drm_fdinfo@virtual-busy:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#14118]) +2 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@i915_drm_fdinfo@virtual-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#14118]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@i915_drm_fdinfo@virtual-busy.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - shard-glk10:        NOTRUN -> [SKIP][162] ([i915#17580])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-snb:          NOTRUN -> [SKIP][163] ([i915#17526])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@i915_pm_freq_api@freq-suspend.html
    - shard-glk:          NOTRUN -> [SKIP][164] ([i915#17526])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][165] ([i915#13356])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          NOTRUN -> [INCOMPLETE][166] ([i915#13356] / [i915#15172])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#11681] / [i915#6621]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#11681] / [i915#6621]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#11681]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@i915_pm_rps@thresholds-idle-park.html
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#11681]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#11681])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#7984])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@i915_power@sanity.html

  * igt@i915_query@query-topology-unsupported:
    - shard-glk11:        NOTRUN -> [SKIP][173] ([i915#17563])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@i915_query@query-topology-unsupported.html
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#16079])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@i915_query@query-topology-unsupported.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][175] ([i915#4817] / [i915#7443])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@i915_suspend@basic-s3-without-i915.html
    - shard-glk:          ([PASS][176], [PASS][177]) -> [INCOMPLETE][178] ([i915#13356] / [i915#16182] / [i915#4817])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk9/igt@i915_suspend@basic-s3-without-i915.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk1/igt@i915_suspend@basic-s3-without-i915.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][179] ([i915#13356] / [i915#16182] / [i915#4817])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk5/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#4077]) +5 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk:          [PASS][181] -> [INCOMPLETE][182] ([i915#13356] / [i915#16182] / [i915#4817])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk4/igt@i915_suspend@fence-restore-untiled.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk9/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#4212]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#4212])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_addfb_basic@basic-x-tiled-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#4212])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-snb:          NOTRUN -> [SKIP][186] ([i915#17562])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
    - shard-glk:          NOTRUN -> [SKIP][187] ([i915#17562])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][188] ([i915#17614]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][189] ([i915#17613]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-glk:          NOTRUN -> [SKIP][190] ([i915#17485])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#9531])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-snb:          NOTRUN -> [SKIP][192] ([i915#17485])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#9531])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][194] ([i915#1769])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#1769] / [i915#3555])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#1769] / [i915#3555])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#17431]) +5 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#4538] / [i915#5286]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#17432] / [i915#5286]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#4538] / [i915#5286]) +10 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-snb:          NOTRUN -> [SKIP][201] ([i915#17557])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-glk:          NOTRUN -> [SKIP][202] ([i915#17544])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#5286])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-glk11:        NOTRUN -> [SKIP][204] ([i915#17478]) +3 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][205] ([i915#17500]) +5 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#17431] / [i915#3638]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#17431]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-snb:          NOTRUN -> [SKIP][208] ([i915#17524])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#17431])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-glk10:        NOTRUN -> [SKIP][210] ([i915#17500]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-snb:          NOTRUN -> [SKIP][211] ([i915#17500]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#3638]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
    - shard-glk11:        NOTRUN -> [SKIP][213] ([i915#17500]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#17432]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#4538] / [i915#5190]) +14 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-glk10:        NOTRUN -> [SKIP][216] ([i915#17478]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#14544] / [i915#4538])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][218] ([i915#17478]) +6 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#4538]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#5190])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#17432])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-snb:          NOTRUN -> [SKIP][222] ([i915#17478]) +16 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#4538])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#17432]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [SKIP][225] ([i915#17491]) +34 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#14098] / [i915#14544] / [i915#6095]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#10307] / [i915#6095]) +125 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][228] ([i915#17491]) +35 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-glk:          NOTRUN -> [SKIP][229] ([i915#17525]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-snb:          NOTRUN -> [SKIP][230] ([i915#17594]) +23 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#12313]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#12313]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][233] ([i915#17490] / [i915#17491]) +13 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#6095]) +39 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#10307] / [i915#10434] / [i915#6095])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][236] ([i915#17490] / [i915#17491]) +11 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#14544] / [i915#6095]) +3 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#6095]) +90 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][239] ([i915#17491]) +26 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#12805])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#12805])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-glk11:        NOTRUN -> [SKIP][242] ([i915#17525])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#6095]) +34 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#14098] / [i915#6095]) +28 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#12805])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [PASS][246] -> [FAIL][247] ([i915#17158])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-mtlp:         ([PASS][248], [PASS][249]) -> [INCOMPLETE][250] ([i915#15582]) +1 other test incomplete
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         ([PASS][251], [PASS][252]) -> [FAIL][253] ([i915#17158])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][254] -> [INCOMPLETE][255] ([i915#15582]) +1 other test incomplete
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#6095]) +4 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#12313])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-glk10:        NOTRUN -> [SKIP][258] ([i915#17490] / [i915#17491]) +9 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#6095]) +41 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#16017])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#3742])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-glk10:        NOTRUN -> [SKIP][262] ([i915#17550])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#11151])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#11151] / [i915#7828]) +10 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-snb:          NOTRUN -> [SKIP][265] ([i915#17483]) +10 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#11151] / [i915#7828]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-snb:          NOTRUN -> [SKIP][267] ([i915#17489]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#17427]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-glk:          NOTRUN -> [SKIP][269] ([i915#17489])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk6/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#17427]) +6 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][271] ([i915#17497])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#17427])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:
    - shard-glk11:        NOTRUN -> [SKIP][273] ([i915#17497]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#17427]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html
    - shard-snb:          NOTRUN -> [SKIP][275] ([i915#17497]) +5 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html
    - shard-glk:          NOTRUN -> [SKIP][276] ([i915#17497])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#17427]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#16471] / [i915#17427]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#16471] / [i915#17427]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#16471] / [i915#17427])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#16464] / [i915#16471] / [i915#17427])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#11151] / [i915#7828]) +12 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#11151] / [i915#7828]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-glk11:        NOTRUN -> [SKIP][284] ([i915#17483]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-glk:          NOTRUN -> [SKIP][285] ([i915#17483]) +6 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-glk10:        NOTRUN -> [SKIP][286] ([i915#17483])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#11151] / [i915#7828]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d:
    - shard-glk11:        NOTRUN -> [SKIP][288] ([i915#17510]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][289] ([i915#17510]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][290] ([i915#17510]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-snb:          NOTRUN -> [SKIP][291] ([i915#17510]) +5 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#16990]) +15 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#16990]) +15 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#15330] / [i915#3299])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-glk:          NOTRUN -> [SKIP][295] ([i915#17502]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#15330] / [i915#3299]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_content_protection@dp-mst-type-1.html
    - shard-snb:          NOTRUN -> [SKIP][297] ([i915#17502]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#15865]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_content_protection@legacy.html
    - shard-glk10:        NOTRUN -> [SKIP][299] ([i915#17508])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-glk:          NOTRUN -> [SKIP][300] ([i915#17508]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_content_protection@legacy-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#15865]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_content_protection@legacy-hdcp14.html
    - shard-snb:          NOTRUN -> [SKIP][302] ([i915#17508]) +3 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#15865])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@kms_content_protection@srm.html
    - shard-glk11:        NOTRUN -> [SKIP][304] ([i915#17508]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#15865]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-glk10:        NOTRUN -> [SKIP][306] ([i915#17504])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][307] ([i915#8814]) +2 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [PASS][308] -> [FAIL][309] ([i915#13566]) +3 other tests fail
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1:
    - shard-mtlp:         ([PASS][310], [PASS][311]) -> [FAIL][312] ([i915#13566] / [i915#15733]) +2 other tests fail
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-3/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#3555]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_cursor_crc@cursor-random-32x32.html
    - shard-snb:          NOTRUN -> [SKIP][314] ([i915#17504]) +4 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-snb:          NOTRUN -> [SKIP][315] ([i915#17533]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#3555]) +6 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-glk11:        NOTRUN -> [SKIP][317] ([i915#17533])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-glk:          NOTRUN -> [SKIP][318] ([i915#17533])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-glk:          NOTRUN -> [SKIP][319] ([i915#17504])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#3555]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#3555] / [i915#8814])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-snb:          NOTRUN -> [ABORT][322] ([i915#15840]) +12 other tests abort
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_cursor_crc@cursor-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][323] ([i915#12358] / [i915#13356] / [i915#14152] / [i915#7882])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][324] ([i915#12358] / [i915#13356] / [i915#14152])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#4103]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#4103])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-snb:          NOTRUN -> [SKIP][327] ([i915#17457]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#17428] / [i915#17454]) +2 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#17428] / [i915#9809]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#13046] / [i915#17454] / [i915#5354]) +8 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][331] ([i915#15804])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [SKIP][332] ([i915#17457]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#4103])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-snb:          NOTRUN -> [SKIP][334] ([i915#17486]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][335] ([i915#17487])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][336] ([i915#17486]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#3804])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-tglu:         NOTRUN -> [SKIP][338] ([i915#17287])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#17287])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-glk11:        NOTRUN -> [SKIP][340] ([i915#17519])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#17287])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#14544] / [i915#17287])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-dg1:          NOTRUN -> [SKIP][343] ([i915#17287])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-snb:          NOTRUN -> [SKIP][344] ([i915#17519])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-snb:          NOTRUN -> [SKIP][345] ([i915#17664])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#17288])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][347] ([i915#17477]) +2 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-dg2:          NOTRUN -> [SKIP][348] ([i915#17285]) +3 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
    - shard-rkl:          NOTRUN -> [SKIP][349] ([i915#17285]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#17285]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
    - shard-snb:          NOTRUN -> [SKIP][351] ([i915#17477]) +3 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#13748])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#13748])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-mtlp:         NOTRUN -> [SKIP][354] ([i915#17297])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@kms_dp_link_training@uhbr-sst-direct-train.html
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#17285])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-9/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#13707])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-snb:          NOTRUN -> [SKIP][357] ([i915#17680])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][358] ([i915#13707])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-glk:          NOTRUN -> [SKIP][359] ([i915#17680])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#16867] / [i915#16870])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#8812])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#8812])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-glk:          NOTRUN -> [SKIP][363] ([i915#17458]) +5 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#16361]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#16361]) +2 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-dg1:          NOTRUN -> [SKIP][366] ([i915#16361]) +5 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
    - shard-snb:          NOTRUN -> [SKIP][367] ([i915#17458]) +7 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][368] ([i915#16361]) +4 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
    - shard-glk11:        NOTRUN -> [SKIP][369] ([i915#17458]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-dg2:          NOTRUN -> [SKIP][370] ([i915#16361]) +8 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-glk10:        NOTRUN -> [SKIP][371] ([i915#17458])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][372] ([i915#14544] / [i915#16361])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#16680])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_fbcon_fbt@psr.html
    - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#16680])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-glk10:        NOTRUN -> [SKIP][375] ([i915#17679])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][376] ([i915#658])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_feature_discovery@psr2.html
    - shard-snb:          NOTRUN -> [SKIP][377] ([i915#17585])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_feature_discovery@psr2.html
    - shard-tglu:         NOTRUN -> [SKIP][378] ([i915#658])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-3/igt@kms_feature_discovery@psr2.html
    - shard-glk:          NOTRUN -> [SKIP][379] ([i915#17585])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_feature_discovery@psr2.html
    - shard-dg2:          NOTRUN -> [SKIP][380] ([i915#658])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_feature_discovery@psr2.html
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#658])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][382] ([i915#3637] / [i915#9934]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#9934]) +7 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][384] ([i915#3637] / [i915#9934])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][385] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839]) +1 other test incomplete
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][386] ([i915#12745] / [i915#13356] / [i915#17183]) +1 other test incomplete
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#9934]) +10 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#9934]) +2 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [FAIL][389] ([i915#13027]) +1 other test fail
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][390] ([i915#8381])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#15643])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-glk10:        NOTRUN -> [SKIP][392] ([i915#17484]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][393] ([i915#17484]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][394] ([i915#15643]) +2 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][395] ([i915#17493])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-snb:          NOTRUN -> [SKIP][396] ([i915#17593]) +5 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-glk11:        NOTRUN -> [SKIP][397] ([i915#17522]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][398] ([i915#17522]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][399] ([i915#15643] / [i915#5190]) +3 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][400] ([i915#15643])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-glk11:        NOTRUN -> [SKIP][401] ([i915#17484])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][402] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][403] ([i915#15643]) +3 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][404] ([i915#15643])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#17428]) +79 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][406] ([i915#15990] / [i915#8708]) +26 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][407] ([i915#15991] / [i915#5354]) +41 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-snb:          NOTRUN -> [SKIP][408] ([i915#17606]) +2 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][409] ([i915#17559])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][410] ([i915#5439])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][411] ([i915#10055])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-dg2:          NOTRUN -> [SKIP][412] ([i915#10055])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-snb:          NOTRUN -> [SKIP][413] ([i915#17609])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][414] ([i915#15989]) +15 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-rkl:          [PASS][415] -> [SKIP][416] ([i915#15989])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][417] ([i915#17588]) +110 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][418] ([i915#15989]) +7 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][419] ([i915#15989]) +5 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][420] ([i915#15990]) +39 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-mtlp:         NOTRUN -> [SKIP][421] ([i915#15991] / [i915#17428]) +19 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:
    - shard-glk:          [PASS][422] -> [SKIP][423] ([i915#17517])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-dg1:          NOTRUN -> [SKIP][424] ([i915#15989]) +20 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-glk:          NOTRUN -> [SKIP][425] ([i915#17482]) +84 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][426] ([i915#15990] / [i915#8708])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][427] ([i915#15102]) +40 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - shard-dg1:          NOTRUN -> [SKIP][428] ([i915#15102]) +26 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][429] ([i915#15102]) +18 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][430] ([i915#15990]) +5 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-snb:          NOTRUN -> [SKIP][431] ([i915#17559]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][432] ([i915#5439]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
    - shard-glk11:        NOTRUN -> [SKIP][433] ([i915#17559])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][434] ([i915#15989]) +28 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
    - shard-snb:          NOTRUN -> [SKIP][435] ([i915#17517]) +27 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][436] ([i915#17517]) +34 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][437] ([i915#14544] / [i915#17428]) +2 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          NOTRUN -> [SKIP][438] ([i915#15991]) +50 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][439] ([i915#15104] / [i915#15990]) +3 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][440] ([i915#15104] / [i915#15990]) +3 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][441] ([i915#15990] / [i915#8708]) +18 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
    - shard-snb:          NOTRUN -> [SKIP][442] ([i915#17482]) +42 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][443] ([i915#14544] / [i915#15102])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][444] ([i915#15991] / [i915#17428] / [i915#1825]) +15 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][445] ([i915#17428] / [i915#1825]) +3 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][446] ([i915#17428]) +32 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-glk11:        NOTRUN -> [SKIP][447] ([i915#17482]) +34 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][448] ([i915#15990]) +30 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][449] ([i915#17428]) +32 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk10:        NOTRUN -> [SKIP][450] ([i915#17482]) +25 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][451] ([i915#15102]) +18 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-8/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-snb:          NOTRUN -> [FAIL][452] ([i915#17104])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
    - shard-mtlp:         NOTRUN -> [SKIP][453] ([i915#17103])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-6/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-tglu:         NOTRUN -> [FAIL][454] ([i915#17101] / [i915#17108] / [i915#17188])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@bpc-switch:
    - shard-glk:          NOTRUN -> [SKIP][455] ([i915#17498]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@invalid-hdr:
    - shard-glk10:        NOTRUN -> [SKIP][456] ([i915#17498])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_hdr@invalid-hdr.html
    - shard-dg2:          NOTRUN -> [SKIP][457] ([i915#16518] / [i915#3555] / [i915#8228])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_hdr@invalid-hdr.html
    - shard-dg1:          NOTRUN -> [SKIP][458] ([i915#3555] / [i915#8228])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-snb:          NOTRUN -> [SKIP][459] ([i915#17498]) +2 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][460] ([i915#15459])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_joiner@basic-force-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][461] ([i915#15459])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][462] ([i915#15459])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-snb:          NOTRUN -> [SKIP][463] ([i915#17575])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-glk10:        NOTRUN -> [SKIP][464] ([i915#17512])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][465] ([i915#15458])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-dg2:          NOTRUN -> [SKIP][466] ([i915#16451])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_mst@mst-suspend-read-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][467] ([i915#16451])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_mst@mst-suspend-read-crc.html
    - shard-snb:          NOTRUN -> [SKIP][468] ([i915#17579])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-glk:          NOTRUN -> [SKIP][469] ([i915#17540])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html
    - shard-snb:          NOTRUN -> [SKIP][470] ([i915#17540]) +1 other test skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][471] ([i915#12756] / [i915#13476])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][472] ([i915#13476])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-dg1:          NOTRUN -> [SKIP][473] ([i915#14712])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
    - shard-snb:          NOTRUN -> [SKIP][474] ([i915#17601])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
    - shard-tglu:         NOTRUN -> [SKIP][475] ([i915#14712])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-8/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk11:        NOTRUN -> [DMESG-FAIL][476] ([i915#118])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][477] ([i915#15709])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-glk10:        NOTRUN -> [SKIP][478] ([i915#17479]) +2 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][479] ([i915#16386]) +3 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-glk11:        NOTRUN -> [SKIP][480] ([i915#17479])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
    - shard-rkl:          NOTRUN -> [SKIP][481] ([i915#14544] / [i915#15709])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-glk:          NOTRUN -> [SKIP][482] ([i915#17479]) +3 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][483] ([i915#16386]) +1 other test skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][484] ([i915#15709]) +3 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][485] ([i915#16386]) +3 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-4:
    - shard-glk11:        NOTRUN -> [SKIP][486] ([i915#17494]) +1 other test skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-4.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-snb:          NOTRUN -> [SKIP][487] ([i915#17479]) +8 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_plane@pixel-format-yf-tiled-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][488] ([i915#15709]) +5 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_plane@pixel-format-yf-tiled-modifier.html
    - shard-mtlp:         NOTRUN -> [SKIP][489] ([i915#15709]) +1 other test skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][490] ([i915#17494]) +1 other test skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-snb:          NOTRUN -> [DMESG-WARN][491] ([i915#17752] / [i915#17763])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-snb:          NOTRUN -> [SKIP][492] ([i915#17595]) +1 other test skip
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_plane_alpha_blend@alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][493] ([i915#12178])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][494] ([i915#7862]) +1 other test fail
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][495] ([i915#13958])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-snb:          NOTRUN -> [SKIP][496] ([i915#17586])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg1:          NOTRUN -> [SKIP][497] ([i915#13958])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][498] ([i915#14259])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][499] ([i915#14259])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][500] ([i915#17832])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-p010:
    - shard-glk:          NOTRUN -> [SKIP][501] ([i915#17833]) +17 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk5/igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-p010.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-p010:
    - shard-glk11:        NOTRUN -> [SKIP][502] ([i915#17833]) +8 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-p010.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-rgb565:
    - shard-glk11:        NOTRUN -> [SKIP][503] ([i915#17843]) +2 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-rgb565.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][504] ([i915#17832]) +3 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html
    - shard-dg1:          NOTRUN -> [SKIP][505] ([i915#17832])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html
    - shard-snb:          NOTRUN -> [SKIP][506] ([i915#17528]) +7 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][507] ([i915#17832])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][508] ([i915#17529])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:
    - shard-glk10:        NOTRUN -> [SKIP][509] ([i915#17529]) +1 other test skip
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:
    - shard-glk10:        NOTRUN -> [SKIP][510] ([i915#17528]) +1 other test skip
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-1-rgb565:
    - shard-glk:          NOTRUN -> [SKIP][511] ([i915#17843]) +2 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk4/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-1-rgb565.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-4-y210:
    - shard-dg1:          NOTRUN -> [SKIP][512] ([i915#17843]) +11 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-4-y210.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-glk11:        NOTRUN -> [SKIP][513] ([i915#17462])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_pm_backlight@basic-brightness.html
    - shard-rkl:          NOTRUN -> [SKIP][514] ([i915#12343] / [i915#14544] / [i915#5354])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html
    - shard-snb:          NOTRUN -> [SKIP][515] ([i915#17462])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_pm_backlight@basic-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][516] ([i915#12343] / [i915#9812])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][517] ([i915#12343] / [i915#5354]) +1 other test skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][518] ([i915#12343] / [i915#5354])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][519] ([i915#12343] / [i915#5354]) +1 other test skip
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-glk:          NOTRUN -> [SKIP][520] ([i915#17495])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_pm_dc@dc5-pageflip-negative.html
    - shard-dg2:          NOTRUN -> [SKIP][521] ([i915#9685])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_pm_dc@dc5-pageflip-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][522] ([i915#9685])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-glk10:        NOTRUN -> [SKIP][523] ([i915#17495])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-glk:          NOTRUN -> [SKIP][524] ([i915#17564]) +1 other test skip
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][525] ([i915#15948]) +1 other test skip
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_pm_dc@dc6-psr.html
    - shard-snb:          NOTRUN -> [SKIP][526] ([i915#17602]) +2 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_pm_dc@dc6-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][527] ([i915#15948])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-glk10:        NOTRUN -> [SKIP][528] ([i915#17573])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          ([PASS][529], [PASS][530]) -> [SKIP][531] ([i915#14544] / [i915#15073])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          [PASS][532] -> [SKIP][533] ([i915#15073])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-glk11:        NOTRUN -> [SKIP][534] ([i915#15073])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          ([PASS][535], [PASS][536]) -> [SKIP][537] ([i915#15073])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg2-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-dg1:          NOTRUN -> [SKIP][538] ([i915#4077]) +7 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_pm_rpm@fences.html
    - shard-snb:          NOTRUN -> [SKIP][539] ([i915#17473]) +4 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          ([PASS][540], [PASS][541]) -> [SKIP][542] ([i915#15073])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][543] ([i915#15073])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-dg1:          ([PASS][544], [PASS][545]) -> [SKIP][546] ([i915#15073])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][547] ([i915#6524] / [i915#6805])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-glk11:        NOTRUN -> [SKIP][548] ([i915#17569])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_prime@d3hot.html

  * igt@kms_properties@colorop-properties-atomic:
    - shard-glk:          NOTRUN -> [SKIP][549] ([i915#17481])
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk5/igt@kms_properties@colorop-properties-atomic.html
    - shard-snb:          NOTRUN -> [SKIP][550] ([i915#17481])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_properties@colorop-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][551] ([i915#11520]) +10 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][552] ([i915#11520]) +9 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
    - shard-glk10:        NOTRUN -> [SKIP][553] ([i915#11520]) +1 other test skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][554] ([i915#9808])
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][555] ([i915#12316]) +3 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][556] ([i915#11520]) +4 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-glk11:        NOTRUN -> [SKIP][557] ([i915#11520])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][558] ([i915#11520] / [i915#14544])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][559] ([i915#11520]) +4 other tests skip
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][560] ([i915#11520]) +14 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][561] ([i915#11520]) +5 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-mtlp:         NOTRUN -> [SKIP][562] ([i915#4348])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@kms_psr2_su@page_flip-nv12.html
    - shard-glk10:        NOTRUN -> [SKIP][563] ([i915#17546])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][564] ([i915#9683]) +2 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][565] ([i915#9683]) +1 other test skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-snb:          NOTRUN -> [SKIP][566] ([i915#17546]) +1 other test skip
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-glk:          NOTRUN -> [SKIP][567] ([i915#17546])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][568] ([i915#1072] / [i915#14544] / [i915#9732])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-mmap-gtt.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][569] ([i915#9732]) +8 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-glk10:        NOTRUN -> [SKIP][570] ([i915#17480]) +7 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-mtlp:         NOTRUN -> [SKIP][571] ([i915#9688]) +8 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-snb:          NOTRUN -> [SKIP][572] ([i915#17480]) +24 other tests skip
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-glk:          NOTRUN -> [SKIP][573] ([i915#17480]) +18 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-glk11:        NOTRUN -> [SKIP][574] ([i915#17480]) +4 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][575] ([i915#1072] / [i915#9732]) +8 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-suspend:
    - shard-mtlp:         NOTRUN -> [FAIL][576] ([i915#17226]) +1 other test fail
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-mtlp:         ([PASS][577], [PASS][578]) -> [FAIL][579] ([i915#17845]) +1 other test fail
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_psr@psr2-cursor-blt.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_psr@psr2-cursor-blt.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][580] ([i915#1072] / [i915#9732]) +31 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][581] ([i915#1072] / [i915#9732]) +26 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][582] ([i915#15949])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-snb:          NOTRUN -> [SKIP][583] ([i915#17554])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-glk11:        NOTRUN -> [SKIP][584] ([i915#17554])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][585] ([i915#15949])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][586] ([i915#4235])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_rotation_crc@exhaust-fences.html
    - shard-snb:          NOTRUN -> [SKIP][587] ([i915#17676])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][588] ([i915#4884])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_rotation_crc@exhaust-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][589] ([i915#4235])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][590] ([i915#12755] / [i915#15867]) +2 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-snb:          NOTRUN -> [SKIP][591] ([i915#17488]) +4 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][592] ([i915#15867]) +1 other test skip
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglu:         NOTRUN -> [SKIP][593] ([i915#17432] / [i915#5289])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-glk10:        NOTRUN -> [SKIP][594] ([i915#17488])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-glk11:        NOTRUN -> [SKIP][595] ([i915#17501])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_scaling_modes@scaling-mode-full-aspect.html
    - shard-snb:          NOTRUN -> [SKIP][596] ([i915#17501])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][597] ([i915#15106]) +6 other tests fail
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][598] ([i915#3555]) +4 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][599] ([i915#8623])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_tiled_display@basic-test-pattern.html
    - shard-snb:          NOTRUN -> [SKIP][600] ([i915#17672])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk:          NOTRUN -> [FAIL][601] ([i915#10959])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][602] ([i915#8623])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-glk11:        NOTRUN -> [SKIP][603] ([i915#17705])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2:          NOTRUN -> [ABORT][604] ([i915#17844]) +16 other tests abort
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_vblank@ts-continuation-dpms-suspend.html
    - shard-dg1:          NOTRUN -> [ABORT][605] ([i915#17844]) +13 other tests abort
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][606] ([i915#15840] / [i915#17752])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][607] ([i915#17752]) +1 other test dmesg-warn
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][608] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@flip-basic:
    - shard-dg2:          NOTRUN -> [SKIP][609] ([i915#15243] / [i915#3555]) +2 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_vrr@flip-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][610] ([i915#15243] / [i915#3555])
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_vrr@flip-basic.html
    - shard-mtlp:         NOTRUN -> [SKIP][611] ([i915#3555] / [i915#8808])
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@max-min:
    - shard-glk:          NOTRUN -> [SKIP][612] ([i915#17520]) +3 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][613] ([i915#9906])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-dg1:          NOTRUN -> [SKIP][614] ([i915#9906])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-snb:          NOTRUN -> [SKIP][615] ([i915#17520]) +3 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-glk:          NOTRUN -> [SKIP][616] ([i915#17536])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk4/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@stress-open-close:
    - shard-snb:          NOTRUN -> [SKIP][617] ([i915#17592]) +5 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@perf@stress-open-close.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][618] ([i915#17455] / [i915#2433])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-mtlp:         ([PASS][619], [PASS][620]) -> [FAIL][621] ([i915#4349])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@perf_pmu@busy-double-start@vecs0.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@perf_pmu@busy-double-start@vecs0.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-glk:          NOTRUN -> [SKIP][622] ([i915#17583])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk5/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-dg2:          NOTRUN -> [SKIP][623] ([i915#8516])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-rkl:          NOTRUN -> [SKIP][624] ([i915#8516])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-snb:          NOTRUN -> [SKIP][625] ([i915#17583])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][626] ([i915#8516])
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][627] ([i915#8516])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt0:
    - shard-snb:          NOTRUN -> [SKIP][628] ([i915#17687]) +1 other test skip
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@perf_pmu@rc6@runtime-pm-long-gt0.html

  * igt@prime_udl@share-import-addfb:
    - shard-glk:          NOTRUN -> [SKIP][629] ([i915#16420])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@prime_udl@share-import-addfb.html
    - shard-dg2:          NOTRUN -> [SKIP][630] ([i915#16420])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@prime_udl@share-import-addfb.html
    - shard-dg1:          NOTRUN -> [SKIP][631] ([i915#16420])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][632] ([i915#3708]) +1 other test skip
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@prime_vgem@fence-flip-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][633] ([i915#3708])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@prime_vgem@fence-flip-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][634] ([i915#3708])
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-glk:          NOTRUN -> [SKIP][635] ([i915#17467])
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@prime_vgem@fence-write-hang.html
    - shard-snb:          NOTRUN -> [SKIP][636] ([i915#17467])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb5/igt@prime_vgem@fence-write-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][637] ([i915#4818])
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][638] ([i915#17447] / [i915#4818])
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          ([PASS][639], [INCOMPLETE][640]) ([i915#13356]) -> [PASS][641] +1 other test pass
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_ctx_isolation@preservation-s3.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_eio@in-flight-suspend:
    - shard-mtlp:         [ABORT][642] ([i915#17217]) -> [PASS][643]
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@gem_eio@in-flight-suspend.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-mtlp:         ([ABORT][644], [FAIL][645]) ([i915#17146] / [i915#17160]) -> [PASS][646] +1 other test pass
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-5/igt@gem_exec_suspend@basic-s0.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@gem_exec_suspend@basic-s0.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          ([INCOMPLETE][647], [INCOMPLETE][648]) ([i915#13356]) -> [PASS][649] +1 other test pass
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@gem_exec_suspend@basic-s3.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          [FAIL][650] ([i915#17879]) -> [PASS][651] +1 other test pass
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-mtlp:         [FAIL][652] ([i915#17879]) -> [PASS][653] +1 other test pass
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@gem_exec_suspend@basic-s4-devices.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-tglu:         [ABORT][654] ([i915#15840]) -> [PASS][655]
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-7/igt@gem_workarounds@suspend-resume-fd.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@gem_workarounds@suspend-resume-fd.html
    - shard-glk:          ([INCOMPLETE][656], [INCOMPLETE][657]) ([i915#13356] / [i915#14586]) -> [PASS][658]
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk1/igt@gem_workarounds@suspend-resume-fd.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk5/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_suspend@forcewake:
    - shard-mtlp:         ([FAIL][659], [FAIL][660]) ([i915#17171]) -> [PASS][661]
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-6/igt@i915_suspend@forcewake.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-3/igt@i915_suspend@forcewake.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@i915_suspend@forcewake.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - shard-mtlp:         ([DMESG-WARN][662], [PASS][663]) ([i915#12935]) -> [PASS][664] +1 other test pass
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-mtlp:         [INCOMPLETE][665] ([i915#17037]) -> [PASS][666] +1 other test pass
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][667] ([i915#17150]) -> [PASS][668]
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-snb:          ([INCOMPLETE][669], [PASS][670]) ([i915#9878]) -> [PASS][671] +1 other test pass
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-rkl:          ([FAIL][672], [PASS][673]) ([i915#13566]) -> [PASS][674]
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_cursor_crc@cursor-random-128x42.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         ([FAIL][675], [FAIL][676]) ([i915#13566]) -> [PASS][677] +3 other tests pass
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          [FAIL][678] ([i915#13566]) -> [PASS][679] +1 other test pass
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_cursor_crc@cursor-random-64x21.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-rkl:          ([FAIL][680], [FAIL][681]) ([i915#13566]) -> [PASS][682] +1 other test pass
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-mtlp:         [FAIL][683] ([i915#17157]) -> [PASS][684] +1 other test pass
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-2/igt@kms_cursor_crc@cursor-suspend.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-rkl:          ([INCOMPLETE][685], [PASS][686]) ([i915#16276] / [i915#6113]) -> [PASS][687] +1 other test pass
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-to-linear:
    - shard-mtlp:         ([PASS][688], [FAIL][689]) ([i915#15733]) -> [PASS][690] +1 other test pass
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-to-linear.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-to-linear.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-to-linear.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          ([SKIP][691], [SKIP][692]) ([i915#15989]) -> [PASS][693] +4 other tests pass
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          ([SKIP][694], [SKIP][695]) ([i915#17517]) -> [PASS][696]
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-mtlp:         ([PASS][697], [ABORT][698]) ([i915#17175]) -> [PASS][699]
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][700] ([i915#15989]) -> [PASS][701] +2 other tests pass
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk:          [SKIP][702] ([i915#17517]) -> [PASS][703] +2 other tests pass
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-render.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-mtlp:         ([SKIP][704], [PASS][705]) ([i915#15725]) -> [PASS][706]
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-4/igt@kms_hdmi_inject@inject-audio.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-tglu:         [DMESG-WARN][707] ([i915#16696] / [i915#16772]) -> [PASS][708]
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-mtlp:         [FAIL][709] ([i915#15733]) -> [PASS][710] +2 other tests pass
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [INCOMPLETE][711] ([i915#14412]) -> [PASS][712] +1 other test pass
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-glk:          ([SKIP][713], [SKIP][714]) ([i915#17528]) -> [PASS][715]
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk5/igt@kms_plane_scaling@intel-max-src-size.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk2/igt@kms_plane_scaling@intel-max-src-size.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk6/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-tglu:         ([SKIP][716], [SKIP][717]) ([i915#17832] / [i915#6953]) -> [PASS][718]
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-10/igt@kms_plane_scaling@intel-max-src-size.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-mtlp:         [INCOMPLETE][719] ([i915#17032]) -> [PASS][720]
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_pm_backlight@fade-with-suspend.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-mtlp:         ([FAIL][721], [FAIL][722]) ([i915#17173]) -> [PASS][723]
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          ([SKIP][724], [PASS][725]) ([i915#15073]) -> [PASS][726] +2 other tests pass
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
    - shard-dg1:          ([SKIP][727], [PASS][728]) ([i915#15073]) -> [PASS][729]
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-mtlp:         [FAIL][730] ([i915#17209]) -> [PASS][731] +1 other test pass
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@perf_pmu@gt-awake:
    - shard-mtlp:         ([PASS][732], [FAIL][733]) ([i915#17696]) -> [PASS][734]
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-4/igt@perf_pmu@gt-awake.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-8/igt@perf_pmu@gt-awake.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@perf_pmu@gt-awake.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          ([INCOMPLETE][735], [PASS][736]) ([i915#13520]) -> [PASS][737]
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@perf_pmu@rc6-suspend.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@perf_pmu@rc6-suspend.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          ([SKIP][738], [SKIP][739]) ([i915#14544] / [i915#8411]) -> [SKIP][740] ([i915#8411])
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@api_intel_bb@blit-reloc-purge-cache.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          [SKIP][741] ([i915#14544] / [i915#3281]) -> [SKIP][742] ([i915#3281]) +2 other tests skip
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][743] ([i915#3555] / [i915#9323]) -> [SKIP][744] ([i915#14544] / [i915#3555] / [i915#9323])
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_ccs@block-copy-compressed.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          ([SKIP][745], [SKIP][746]) ([i915#14544] / [i915#9323]) -> [SKIP][747] ([i915#9323])
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          ([SKIP][748], [SKIP][749]) ([i915#14544] / [i915#8562]) -> [SKIP][750] ([i915#8562])
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_create@create-ext-set-pat.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_create@create-ext-set-pat.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-mtlp:         ([PASS][751], [FAIL][752]) ([i915#17176]) -> [ABORT][753] ([i915#17175]) +1 other test abort
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          ([SKIP][754], [SKIP][755]) ([i915#280]) -> [SKIP][756] ([i915#14544] / [i915#280])
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@gem_ctx_sseu@invalid-sseu.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          ([INCOMPLETE][757], [PASS][758]) ([i915#13390] / [i915#17327]) -> [INCOMPLETE][759] ([i915#13390] / [i915#17327])
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@gem_eio@in-flight-suspend.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          ([SKIP][760], [SKIP][761]) ([i915#14544] / [i915#4525]) -> [SKIP][762] ([i915#4525])
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_exec_balancer@parallel-bb-first.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_exec_balancer@parallel-bb-first.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_params@secure-non-root:
    - shard-rkl:          [SKIP][763] ([i915#17416]) -> [SKIP][764] ([i915#14544] / [i915#17416])
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_exec_params@secure-non-root.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-rkl:          ([SKIP][765], [SKIP][766]) ([i915#14544] / [i915#3281]) -> [SKIP][767] ([i915#3281]) +2 other tests skip
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_exec_reloc@basic-concurrent16.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_exec_reloc@basic-concurrent16.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-rkl:          [SKIP][768] ([i915#3281]) -> [SKIP][769] ([i915#14544] / [i915#3281]) +1 other test skip
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-read-noreloc.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-rkl:          ([SKIP][770], [SKIP][771]) ([i915#3281]) -> [SKIP][772] ([i915#14544] / [i915#3281])
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-rkl:          ([SKIP][773], [SKIP][774]) ([i915#4613]) -> [SKIP][775] ([i915#14544] / [i915#4613])
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@gem_lmem_swapping@heavy-random.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@gem_lmem_swapping@heavy-random.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@massive:
    - shard-rkl:          [SKIP][776] ([i915#14544] / [i915#4613]) -> [SKIP][777] ([i915#4613])
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_lmem_swapping@massive.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          ([SKIP][778], [SKIP][779]) ([i915#14544] / [i915#4613]) -> [SKIP][780] ([i915#4613]) +2 other tests skip
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          ([SKIP][781], [SKIP][782]) ([i915#3282]) -> [SKIP][783] ([i915#14544] / [i915#3282]) +1 other test skip
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          ([SKIP][784], [SKIP][785]) ([i915#14544] / [i915#3282]) -> [SKIP][786] ([i915#3282]) +4 other tests skip
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          [SKIP][787] ([i915#14544] / [i915#3282]) -> [SKIP][788] ([i915#3282])
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          ([SKIP][789], [SKIP][790]) ([i915#13717] / [i915#14544]) -> [SKIP][791] ([i915#13717])
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          ([SKIP][792], [SKIP][793]) ([i915#14544] / [i915#3297] / [i915#3323]) -> [SKIP][794] ([i915#3297] / [i915#3323])
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@gem_userptr_blits@dmabuf-sync.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          [SKIP][795] ([i915#3297]) -> [SKIP][796] ([i915#14544] / [i915#3297]) +1 other test skip
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gem_userptr_blits@dmabuf-unsync.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          ([SKIP][797], [SKIP][798]) ([i915#14544] / [i915#3297]) -> [SKIP][799] ([i915#3297]) +1 other test skip
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_render_mixed_blits:
    - shard-rkl:          [SKIP][800] ([i915#14544] / [i915#17455]) -> [SKIP][801] ([i915#17455])
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gen3_render_mixed_blits.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@gen3_render_mixed_blits.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-rkl:          ([SKIP][802], [SKIP][803]) ([i915#14544] / [i915#17455]) -> [SKIP][804] ([i915#17455]) +1 other test skip
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@gen7_exec_parse@bitmasks.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          ([SKIP][805], [SKIP][806]) ([i915#2527]) -> [SKIP][807] ([i915#14544] / [i915#2527])
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@gen9_exec_parse@batch-without-end.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          ([SKIP][808], [SKIP][809]) ([i915#14544] / [i915#2527]) -> [SKIP][810] ([i915#2527]) +2 other tests skip
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@gen9_exec_parse@bb-start-far.html
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          [SKIP][811] ([i915#14544] / [i915#2527]) -> [SKIP][812] ([i915#2527])
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          ([SKIP][813], [SKIP][814]) ([i915#14544] / [i915#15479]) -> [SKIP][815] ([i915#15479]) +4 other tests skip
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.html
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@i915_module_load@fault-injection@__uc_init.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          ([SKIP][816], [SKIP][817]) ([i915#14544] / [i915#6412]) -> [SKIP][818] ([i915#6412])
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@i915_module_load@resize-bar.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@i915_module_load@resize-bar.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          ([SKIP][819], [SKIP][820]) ([i915#14544] / [i915#8399]) -> [SKIP][821] ([i915#8399])
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          ([INCOMPLETE][822], [PASS][823]) ([i915#4817]) -> [INCOMPLETE][824] ([i915#4817])
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@i915_suspend@forcewake.html
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@i915_suspend@forcewake.html
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          ([SKIP][825], [SKIP][826]) ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][827] ([i915#4538] / [i915#5286]) +3 other tests skip
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-rkl:          ([SKIP][828], [SKIP][829]) ([i915#4538] / [i915#5286]) -> [SKIP][830] ([i915#14544] / [i915#4538] / [i915#5286]) +1 other test skip
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-rkl:          ([SKIP][831], [SKIP][832]) ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][833] ([i915#17431] / [i915#3638])
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][834] ([i915#17431] / [i915#3638]) -> [SKIP][835] ([i915#14544] / [i915#17431] / [i915#3638])
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          ([SKIP][836], [SKIP][837]) ([i915#14544] / [i915#4538]) -> [SKIP][838] ([i915#4538]) +3 other tests skip
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          ([SKIP][839], [SKIP][840]) ([i915#4538]) -> [SKIP][841] ([i915#14544] / [i915#4538])
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][842] ([i915#14544] / [i915#4538]) -> [SKIP][843] ([i915#4538])
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-rkl:          ([SKIP][844], [SKIP][845]) ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][846] ([i915#14098] / [i915#6095]) +10 other tests skip
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-rkl:          ([SKIP][847], [SKIP][848]) ([i915#14098] / [i915#6095]) -> [SKIP][849] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][850] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][851] ([i915#14098] / [i915#6095]) +4 other tests skip
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][852] ([i915#14544] / [i915#6095]) -> [SKIP][853] ([i915#6095]) +8 other tests skip
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][854] ([i915#12805]) -> [SKIP][855] ([i915#12805] / [i915#14544])
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][856] ([i915#17158]) -> [INCOMPLETE][857] ([i915#15582]) +3 other tests incomplete
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          ([SKIP][858], [SKIP][859]) ([i915#12313] / [i915#14544]) -> [SKIP][860] ([i915#12313]) +1 other test skip
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          ([SKIP][861], [SKIP][862]) ([i915#14544] / [i915#6095]) -> [SKIP][863] ([i915#6095]) +1 other test skip
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][864] ([i915#6095]) -> [SKIP][865] ([i915#14544] / [i915#6095]) +1 other test skip
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][866] ([i915#14098] / [i915#6095]) -> [SKIP][867] ([i915#14098] / [i915#14544] / [i915#6095])
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          ([SKIP][868], [SKIP][869]) ([i915#14544] / [i915#3742]) -> [SKIP][870] ([i915#3742])
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_cdclk@plane-scaling.html
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_cdclk@plane-scaling.html
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-rkl:          ([SKIP][871], [SKIP][872]) ([i915#14544] / [i915#17427]) -> [SKIP][873] ([i915#17427])
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_chamelium_color@ctm-green-to-red.html
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_chamelium_color@ctm-green-to-red.html
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-rkl:          ([SKIP][874], [SKIP][875]) ([i915#16471] / [i915#17427]) -> [SKIP][876] ([i915#14544] / [i915#16471] / [i915#17427])
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:
    - shard-rkl:          ([SKIP][877], [SKIP][878]) ([i915#17427]) -> [SKIP][879] ([i915#14544] / [i915#17427])
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:
    - shard-rkl:          [SKIP][880] ([i915#14544] / [i915#17427]) -> [SKIP][881] ([i915#17427])
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-rkl:          [SKIP][882] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][883] ([i915#11151] / [i915#7828])
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-rkl:          ([SKIP][884], [SKIP][885]) ([i915#11151] / [i915#7828]) -> [SKIP][886] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          ([SKIP][887], [SKIP][888]) ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][889] ([i915#11151] / [i915#7828]) +6 other tests skip
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          ([SKIP][890], [SKIP][891]) ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][892] ([i915#15330] / [i915#3116])
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          [SKIP][893] ([i915#15865]) -> [SKIP][894] ([i915#14544] / [i915#15865]) +1 other test skip
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_content_protection@legacy.html
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          ([SKIP][895], [SKIP][896]) ([i915#15865]) -> [SKIP][897] ([i915#14544] / [i915#15865])
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_content_protection@srm.html
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_content_protection@srm.html
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          ([SKIP][898], [SKIP][899]) ([i915#14544] / [i915#3555]) -> [SKIP][900] ([i915#3555]) +6 other tests skip
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          ([PASS][901], [FAIL][902]) ([i915#13566]) -> [FAIL][903] ([i915#13566]) +1 other test fail
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          ([SKIP][904], [SKIP][905]) ([i915#3555]) -> [SKIP][906] ([i915#14544] / [i915#3555]) +1 other test skip
   [904]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [905]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [906]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          ([SKIP][907], [SKIP][908]) ([i915#14544] / [i915#17428]) -> [SKIP][909] ([i915#17428]) +50 other tests skip
   [907]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [908]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [909]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          ([SKIP][910], [SKIP][911]) ([i915#14544] / [i915#9723]) -> [SKIP][912] ([i915#9723]) +1 other test skip
   [910]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [911]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [912]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev@basic:
    - shard-rkl:          [SKIP][913] ([i915#1257]) -> [SKIP][914] ([i915#1257] / [i915#14544])
   [913]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_dp_aux_dev@basic.html
   [914]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-rkl:          ([SKIP][915], [SKIP][916]) ([i915#14544] / [i915#17291]) -> [SKIP][917] ([i915#17291])
   [915]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
   [916]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
   [917]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-rkl:          [SKIP][918] ([i915#14544] / [i915#17290]) -> [SKIP][919] ([i915#17290])
   [918]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
   [919]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-rkl:          [SKIP][920] ([i915#16361]) -> [SKIP][921] ([i915#14544] / [i915#16361])
   [920]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
   [921]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-rkl:          ([SKIP][922], [SKIP][923]) ([i915#16361]) -> [SKIP][924] ([i915#14544] / [i915#16361])
   [922]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
   [923]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
   [924]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-rkl:          ([SKIP][925], [SKIP][926]) ([i915#14544] / [i915#16361]) -> [SKIP][927] ([i915#16361])
   [925]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [926]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [927]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          ([SKIP][928], [SKIP][929]) ([i915#14544] / [i915#16081]) -> [SKIP][930] ([i915#16081])
   [928]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_feature_discovery@display-3x.html
   [929]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_feature_discovery@display-3x.html
   [930]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          ([SKIP][931], [SKIP][932]) ([i915#14544] / [i915#16599]) -> [SKIP][933] ([i915#16599])
   [931]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html
   [932]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_feature_discovery@dp-mst.html
   [933]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@vrr:
    - shard-rkl:          [SKIP][934] ([i915#14544] / [i915#16600]) -> [SKIP][935] ([i915#16600])
   [934]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_feature_discovery@vrr.html
   [935]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-rkl:          ([SKIP][936], [SKIP][937]) ([i915#14544] / [i915#9934]) -> [SKIP][938] ([i915#9934]) +7 other tests skip
   [936]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_flip@2x-blocking-wf_vblank.html
   [937]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html
   [938]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          ([SKIP][939], [SKIP][940]) ([i915#9934]) -> [SKIP][941] ([i915#14544] / [i915#9934])
   [939]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [940]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [941]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          ([INCOMPLETE][942], [INCOMPLETE][943]) ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][944] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [942]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html
   [943]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk6/igt@kms_flip@2x-flip-vs-suspend.html
   [944]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][945] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839]) -> [INCOMPLETE][946] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [945]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [946]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][947] ([i915#12745] / [i915#13356] / [i915#17183]) -> [INCOMPLETE][948] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [947]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [948]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][949] ([i915#14544] / [i915#15643]) -> [SKIP][950] ([i915#15643])
   [949]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [950]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          ([SKIP][951], [SKIP][952]) ([i915#14544] / [i915#15643]) -> [SKIP][953] ([i915#15643]) +2 other tests skip
   [951]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [952]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [953]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-rkl:          [SKIP][954] ([i915#14544] / [i915#17428]) -> [SKIP][955] ([i915#17428]) +10 other tests skip
   [954]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html
   [955]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          ([SKIP][956], [SKIP][957]) ([i915#15102]) -> [SKIP][958] ([i915#14544] / [i915#15102]) +15 other tests skip
   [956]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [957]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [958]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][959] ([i915#14544] / [i915#15102]) -> [SKIP][960] ([i915#15102]) +3 other tests skip
   [959]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html
   [960]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-rkl:          ([SKIP][961], [SKIP][962]) ([i915#14544] / [i915#15102]) -> [SKIP][963] ([i915#15102]) +21 other tests skip
   [961]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
   [962]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
   [963]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          ([SKIP][964], [SKIP][965]) ([i915#14544] / [i915#5439]) -> [SKIP][966] ([i915#5439])
   [964]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [965]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [966]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:
    - shard-rkl:          ([SKIP][967], [SKIP][968]) ([i915#17428]) -> [SKIP][969] ([i915#14544] / [i915#17428]) +13 other tests skip
   [967]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html
   [968]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html
   [969]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          [SKIP][970] ([i915#5439]) -> [SKIP][971] ([i915#14544] / [i915#5439])
   [970]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
   [971]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          ([SKIP][972], [PASS][973]) ([i915#15989]) -> [SKIP][974] ([i915#15989]) +10 other tests skip
   [972]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [973]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [974]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          ([SKIP][975], [PASS][976]) ([i915#17517]) -> [SKIP][977] ([i915#17517]) +11 other tests skip
   [975]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [976]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [977]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          ([SKIP][978], [SKIP][979]) ([i915#14544] / [i915#9766]) -> [SKIP][980] ([i915#9766])
   [978]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [979]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [980]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          ([SKIP][981], [SKIP][982]) ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][983] ([i915#17428] / [i915#1825]) +1 other test skip
   [981]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [982]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [983]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          [SKIP][984] ([i915#17428]) -> [SKIP][985] ([i915#14544] / [i915#17428]) +7 other tests skip
   [984]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [985]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         ([SKIP][986], [SKIP][987]) ([i915#1187] / [i915#12713] / [i915#16490]) -> [SKIP][988] ([i915#12713] / [i915#16490])
   [986]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [987]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@kms_hdr@brightness-with-hdr.html
   [988]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          ([SKIP][989], [SKIP][990]) ([i915#1187] / [i915#12713] / [i915#16644]) -> [SKIP][991] ([i915#12713] / [i915#16644])
   [989]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html
   [990]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html
   [991]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][992] ([i915#16644] / [i915#3555] / [i915#8228]) -> [SKIP][993] ([i915#14544] / [i915#16644] / [i915#3555] / [i915#8228])
   [992]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_hdr@invalid-hdr.html
   [993]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          ([SKIP][994], [SKIP][995]) ([i915#14544] / [i915#15815]) -> [SKIP][996] ([i915#15815])
   [994]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [995]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [996]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          ([SKIP][997], [SKIP][998]) ([i915#14544] / [i915#6301]) -> [SKIP][999] ([i915#6301])
   [997]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.html
   [998]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html
   [999]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          ([SKIP][1000], [SKIP][1001]) ([i915#14544] / [i915#15709]) -> [SKIP][1002] ([i915#15709]) +1 other test skip
   [1000]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [1001]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [1002]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][1003] ([i915#14544] / [i915#15709]) -> [SKIP][1004] ([i915#15709])
   [1003]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
   [1004]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          ([SKIP][1005], [SKIP][1006]) ([i915#13958] / [i915#14544]) -> [SKIP][1007] ([i915#13958])
   [1005]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html
   [1006]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html
   [1007]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          ([SKIP][1008], [SKIP][1009]) ([i915#15329] / [i915#17832] / [i915#3555]) -> [SKIP][1010] ([i915#14544] / [i915#15329] / [i915#17832] / [i915#3555])
   [1008]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [1009]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [1010]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          ([SKIP][1011], [SKIP][1012]) ([i915#15329]) -> [SKIP][1013] ([i915#14544] / [i915#15329]) +1 other test skip
   [1011]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
   [1012]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
   [1013]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:
    - shard-rkl:          ([SKIP][1014], [SKIP][1015]) ([i915#15329] / [i915#17832]) -> [SKIP][1016] ([i915#14544] / [i915#15329] / [i915#17832])
   [1014]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html
   [1015]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html
   [1016]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled:
    - shard-rkl:          ([SKIP][1017], [SKIP][1018]) ([i915#14544] / [i915#17832]) -> [SKIP][1019] ([i915#17832])
   [1017]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html
   [1018]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html
   [1019]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-max-crc-yf-tiled.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][1020] ([i915#15739]) -> [SKIP][1021] ([i915#14544] / [i915#15739])
   [1020]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_pm_dc@dc9-dpms.html
   [1021]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          ([PASS][1022], [SKIP][1023]) ([i915#9340]) -> [SKIP][1024] ([i915#9340])
   [1022]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html
   [1023]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
   [1024]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][1025] ([i915#11520]) -> [SKIP][1026] ([i915#11520] / [i915#14544]) +1 other test skip
   [1025]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [1026]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          ([SKIP][1027], [SKIP][1028]) ([i915#11520] / [i915#14544]) -> [SKIP][1029] ([i915#11520]) +2 other tests skip
   [1027]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [1028]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [1029]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          [SKIP][1030] ([i915#9683]) -> [SKIP][1031] ([i915#14544] / [i915#9683])
   [1030]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms_psr2_su@page_flip-xrgb8888.html
   [1031]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-cursor-render:
    - shard-rkl:          [SKIP][1032] ([i915#1072] / [i915#9732]) -> [SKIP][1033] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [1032]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_psr@fbc-psr-cursor-render.html
   [1033]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-render.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-rkl:          ([SKIP][1034], [SKIP][1035]) ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][1036] ([i915#1072] / [i915#9732]) +10 other tests skip
   [1034]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html
   [1035]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_psr@pr-cursor-plane-onoff.html
   [1036]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@psr-sprite-mmap-gtt:
    - shard-rkl:          ([SKIP][1037], [SKIP][1038]) ([i915#1072] / [i915#9732]) -> [SKIP][1039] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [1037]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_psr@psr-sprite-mmap-gtt.html
   [1038]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_psr@psr-sprite-mmap-gtt.html
   [1039]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_psr@psr-sprite-mmap-gtt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          ([SKIP][1040], [SKIP][1041]) ([i915#17432] / [i915#5289]) -> [SKIP][1042] ([i915#14544] / [i915#17432] / [i915#5289])
   [1040]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [1041]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [1042]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-rkl:          [SKIP][1043] ([i915#14544] / [i915#3555]) -> [SKIP][1044] ([i915#3555])
   [1043]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-full.html
   [1044]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          [SKIP][1045] ([i915#14544] / [i915#9906]) -> [SKIP][1046] ([i915#9906])
   [1045]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
   [1046]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          ([SKIP][1047], [SKIP][1048]) ([i915#14544] / [i915#2436]) -> [SKIP][1049] ([i915#2436])
   [1047]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [1048]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [1049]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         ([PASS][1050], [FAIL][1051]) ([i915#4349]) -> [FAIL][1052] ([i915#4349]) +2 other tests fail
   [1050]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@perf_pmu@busy-double-start.html
   [1051]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-7/igt@perf_pmu@busy-double-start.html
   [1052]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@perf_pmu@busy-double-start.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          [SKIP][1053] ([i915#14544] / [i915#17448] / [i915#3708]) -> [SKIP][1054] ([i915#17448] / [i915#3708])
   [1053]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@prime_vgem@fence-write-hang.html
   [1054]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@prime_vgem@fence-write-hang.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12935]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12935
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15657]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
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
  [i915#16017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
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
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17032]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17032
  [i915#17037]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17037
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17103
  [i915#17104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17104
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17146]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17157]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17157
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17160]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17160
  [i915#17171]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17171
  [i915#17173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17173
  [i915#17175]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17175
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
  [i915#17209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17209
  [i915#17217]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17217
  [i915#17226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17226
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17288]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288
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
  [i915#17447]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17447
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
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
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17511]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511
  [i915#17512]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512
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
  [i915#17544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17544
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
  [i915#17552]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17552
  [i915#17554]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554
  [i915#17557]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17557
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
  [i915#17563]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17563
  [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
  [i915#17568]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568
  [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
  [i915#17573]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17573
  [i915#17575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17575
  [i915#17576]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576
  [i915#17579]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17579
  [i915#17580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580
  [i915#17583]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583
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
  [i915#17609]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17609
  [i915#17610]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610
  [i915#17613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17613
  [i915#17614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17614
  [i915#17615]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17615
  [i915#17622]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17622
  [i915#17628]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17628
  [i915#17635]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17635
  [i915#17655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17655
  [i915#17661]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17661
  [i915#17664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17664
  [i915#17672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17672
  [i915#17675]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17675
  [i915#17676]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17676
  [i915#17679]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17679
  [i915#17680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17680
  [i915#17687]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17687
  [i915#17688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17696
  [i915#17697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17697
  [i915#17705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17705
  [i915#17752]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752
  [i915#17763]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17763
  [i915#17832]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832
  [i915#17833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17833
  [i915#17843]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843
  [i915#17844]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844
  [i915#17845]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17845
  [i915#17879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17879
  [i915#17880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17880
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
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
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
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
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
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
  * IGT: IGT_9198 -> IGTPW_16177
  * Linux: CI_DRM_19561 -> CI_DRM_19563

  CI-20190529: 20190529
  CI_DRM_19561: 7f983558aaf724daeafb5904dbb078835857b51e @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19563: 2bdca9b1f8638ef27955d61c149bc6fac856d291 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16177: 16177
  IGT_9198: 9198

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/index.html

--===============5971509368501720767==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pm_residency: Wait for a stab=
le C6 before measuring residency</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/178990/">https://patchwork.freedesktop.org/series/178990/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16177/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16177/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9198_full -&gt; IGTPW_16177_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16177_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_16177_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/index=
.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1617=
7_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-tglu-10/igt@i915_pm_rpm@system-suspend-devices.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tgl=
u-3/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@i915=
_pm_rpm@system-suspend-devices.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-a-plane-=
3:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_plane@pixel-format-linear-mod=
ifier-source-clamping@pipe-a-plane-3.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16177_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk4/igt@api_intel_bb@crc32.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576">=
i915#17576</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@api_intel_bb@crc32.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230"=
>i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_basic@multigpu-create-close.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17675">i915#17675</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@gem_basic@multigpu-create-close.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17697">i915#17697</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@gem_ccs@block-multicopy-inplace.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17499">i915#17499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk6/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
99">i915#17499</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gem_ccs@suspend-resume.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
323">i915#9323</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_ccs@suspend-resume.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
99">i915#17499</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@gem_ccs@suspend-resume@tile64-com=
pressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#163=
48</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_close_race@multigpu-basic-proc=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17568">i915#17568</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk3/igt@gem_compute@compute-square.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17552">i915#17552</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_compute@compute-square.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17552">i915#17552</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-ho=
stile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-sto=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8555">i915#8555</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-st=
op.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_ctx_persistence@legacy-engines=
-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/1099">i915#1099</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-in-order:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_ctx_shared@q-in-order.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17342">i915#17342</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@gem_ctx_sseu@engines.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496=
">i915#17496</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_ctx_sseu@engines.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496=
">i915#17496</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@gem_ctx_sseu@mmap-args.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/28=
0">i915#280</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
80">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_exec_balancer@bonded-sync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4771">i915#4771</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_exec_balancer@parallel.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17587">i915#17587</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@gem_exec_balancer@parallel-keep-in=
-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-s=
ubmit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@gem_exec_balancer@parallel-order=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@gem_exec_balancer@parallel-out-fe=
nce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-tglu-8/igt@gem_exec_big@single.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-tglu-7/igt@gem_exec=
_big@single.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16177/shard-tglu-3/igt@gem_exec_big@single.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">=
i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@gem_exec_capture@capture-invisible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17610">i915#17610</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gem_exec_capture@capture-invisibl=
e@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@gem_exec_capture@capture-invisib=
le@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk4/igt@gem_exec_capture@capture-invisible=
@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@gem_exec_capture@capture-invisib=
le@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@gem_exec_capture@capture@vecs0-lm=
em0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16904">i915#16904</a>) +4 other tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@gem_exec_capture@capture@vecs0-l=
mem0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16904">i915#16904</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@gem_exec_fence@submit3.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-stationary-timeline-chain-engines:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gem_exec_fence@syncobj-stationary-=
timeline-chain-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17599">i915#17599</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@gem_exec_flush@basic-uc-set-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@gem_exec_flush@basic-uc-set-defa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_exec_flush@basic-wb-prw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@gem_exec_flush@basic-wb-rw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gem_exec_params@rsvd2-dirt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17453">i915#17453</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5107">i915#5107</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@gem_exec_params@rsvd2-dirt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17453">i915#17453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@gem_exec_params@secure-non-maste=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@gem_exec_params@secure-non-root.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17523">i915#17523</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_exec_params@secure-non-root.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17416">i915#17416</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_exec_params@secure-non-root.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17416">i915#17416</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17523">i915#17523</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@gem_exec_reloc@basic-cpu-wc-acti=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-cpu-acti=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3281">i915#3281</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gem_exec_reloc@basic-write-read.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@gem_exec_schedule@reorder-wide.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-noskip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_exec_schedule@u-semaphore-nosk=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17590">i915#17590</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/i=
gt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +2 other =
tests incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-glk5/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk5/igt=
@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13196">i915#13196</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356<=
/a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@gem_exec_suspend@basic-s4-devices=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17844">i915#17844</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7975">i915#7975</a>) +1 other test abort</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gem_exec_suspend@basic-s4-device=
s.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17844">i915#17844</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7975">i915#7975</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@gem_exec_whisper@basic-fds-priorit=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17628">i915#17628</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gem_exec_whisper@basic-queues-fork=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17655">i915#17655</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy-emit:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gem_exercise_blt@fast-copy-emit.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17622">i915#17622</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-f=
ences-busy-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</l=
i>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-=
fences-busy-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@gem_lmem_evict@dontneed-evict-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_lmem_evict@dontneed-evict-race=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17605">i915#17605</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@gem_lmem_swapping@heavy-random.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-m=
ulti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@gem_lmem_swapping@massive-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17503">i915#17503</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@gem_lmem_swapping@parallel-multi.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12193">i915#12193</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_lmem_swapping@verify-random-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17503">i915#17503</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@gem_lmem_swapping@verify-random-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_lmem_swapping@verify-random-=
ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@gem_media_fill@media-fill.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17661">i915#17661</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@gem_media_fill@media-fill.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8289">i915#8289</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@gem_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@gem_mmap@big-bo.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i9=
15#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gem_mmap_gtt@cpuset-big-copy-odd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_mmap_wc@bad-offset.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
83">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@gem_mmap_wc@write-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@gem_partial_pwrite_pread@writes-=
after-reads-snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_ppgtt@flink-and-close-vma-leak=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17635">i915#17635</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@shrink-vs-evict-pinned:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gem_ppgtt@shrink-vs-evict-pinned.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17615">i915#17615</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk5/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14702">i915#14702</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-r=
kl-7/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_pxp@display-protected-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4270">i915#4270</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@gem_pxp@display-protected-crc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17521">i915#17521</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@gem_pxp@display-protected-crc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4270">i915#4270</a>) +3 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@gem_pxp@display-protected-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17521">i915#17521</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@gem_pxp@verify-pxp-stale-ctx-execu=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17521">i915#17521</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@gem_readwrite@beyond-eob.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gem_readwrite@beyond-eob.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_render_copy@y-tiled-ccs-to-x-t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17591">i915#17591</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@gem_render_copy@y-tiled-mc-ccs-to=
-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17492">i915#17492</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-=
linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +10 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@gem_render_copy@y-tiled-to-vebox-=
linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_render_copy@y-tiled-to-vebox-x=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17492">i915#17492</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@gem_render_copy@y-tiled-to-vebox=
-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@gem_render_copy@y-tiled-to-vebox-y=
f-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17492">i915#17492</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_render_tiled_blits@basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-fork:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gem_softpin@allocator-fork.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17471">i915#17471</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk9/igt@gem_softpin@evict-snoop.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
551">i915#17551</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@gem_softpin@evict-snoop-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4885">i915#4885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gem_tiled_pread_basic@basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15657">i915#15657</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_tiled_pread_basic@basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15657">i915#15657</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@gem_userptr_blits@dmabuf-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@gem_userptr_blits@dmabuf-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk9/igt@gem_userptr_blits@invalid-mmap-off=
set-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17507">i915#17507</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@gem_userptr_blits@readonly-pwrite=
-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gem_userptr_blits@relocations.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@gem_userptr_blits@relocations.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gem_userptr_blits@unsync-overlap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17507">i915#17507</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-6/igt@gem_userptr_blits@unsync-unmap-a=
fter-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@create-ext:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gem_vm_create@create-ext.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7596">i915#17596</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@gem_workarounds@suspend-resume.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt=
@gem_workarounds@suspend-resume.html">PASS</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@gem_workarounds@=
suspend-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17880">i915#17880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk9/igt@gem_workarounds@suspend-resume-con=
text.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@gen3_mixed_blits.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688">i9=
15#17688</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk1/igt@gen3_render_tiledx_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7511">i915#17511</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gen3_render_tiledx_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7511">i915#17511</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@gen7_exec_parse@basic-allocation=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17455">i915#17455</a>) +2 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@gen7_exec_parse@basic-allocation.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17505">i915#17505</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-8/igt@gen7_exec_parse@basic-allocation=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk5/igt@gen7_exec_parse@chained-batch.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17505">i915#17505</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@gen7_exec_parse@chained-batch.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17455">i915#17455</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@gen7_exec_parse@chained-batch.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@gen7_exec_parse@oacontrol-tracking=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17505">i915#17505</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@gen7_exec_parse@oacontrol-trackin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@gen9_exec_parse@bb-start-cmd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2856">i915#2856</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@gen9_exec_parse@shadow-peek.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@gen9_exec_parse@valid-registers.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17597">i915#17597</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@i915_drm_fdinfo@all-busy-idle-che=
ck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14123">i915#14123</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@i915_drm_fdinfo@all-busy-idle-ch=
eck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@i915_drm_fdinfo@busy-idle@bcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@i915_drm_fdinfo@busy@rcs0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@i915_drm_fdinfo@busy@vecs1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14073">i915#14073</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-active:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@i915_drm_fdinfo@memory-info-active=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17603">i915#17603</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@i915_drm_fdinfo@virtual-busy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14118">i915#14118</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@i915_drm_fdinfo@virtual-busy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14118">i915#14118</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@i915_hangman@gt-engine-error@bcs0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17580">i915#17580</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@i915_pm_freq_api@freq-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17526">i915#17526</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk6/igt@i915_pm_freq_api@freq-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17526">i915#17526</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@i915_pm_rpm@system-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15172">i915#15172</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@i915_pm_rps@basic-api.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@i915_pm_rps@min-max-config-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@i915_pm_rps@thresholds-idle-park.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11681">i915#11681</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@i915_pm_rps@thresholds-idle-park=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11681">i915#11681</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@i915_pm_rps@thresholds-park.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@i915_power@sanity.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i=
915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@i915_query@query-topology-unsuppo=
rted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17563">i915#17563</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@i915_query@query-topology-unsuppo=
rted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@i915_suspend@basic-s3-without-i=
915.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4817">i915#4817</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk9/igt@i915_suspend@basic-s3-without-i915.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-glk1/i=
gt@i915_suspend@basic-s3-without-i915.html">PASS</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk6/igt@i915_suspen=
d@basic-s3-without-i915.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817"=
>i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk5/igt@i915_suspend@debugfs-reader.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@i915_suspend@fence-restore-tiled=
2untiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-glk4/igt@i915_suspend@fence-restore-untiled.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard=
-glk9/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16182">i915#16182</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x-tiled-=
mismatch-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_addfb_basic@basic-x-tiled-leg=
acy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_addfb_basic@basic-x-tiled-le=
gacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_async_flips@async-flip-with-pa=
ge-flip-events-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_async_flips@async-flip-with-pa=
ge-flip-events-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_async_flips@invalid-async-flip=
-atomic@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17614">i915#17614</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_async_flips@invalid-async-flip=
-atomic@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17613">i915#17613</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_atomic@plane-primary-overlay-m=
utable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17485">i915#17485</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_atomic@plane-primary-overlay-=
mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9531">i915#9531</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_atomic@plane-primary-overlay-m=
utable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17485">i915#17485</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_atomic_transition@plane-all-mo=
deset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_atomic_transition@plane-all-m=
odeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@kms_big_fb@4-tiled-64bpp-rotate=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5286">i915#5286</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_big_fb@4-tiled-addfb-size-offs=
et-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17557">i915#17557</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_big_fb@4-tiled-addfb-size-over=
flow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17544">i915#17544</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_big_fb@linear-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17500">i915#17500</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_big_fb@linear-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_big_fb@linear-max-hw-stride-32=
bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@kms_big_fb@x-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_big_fb@x-tiled-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17500">i915#17500</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_big_fb@x-tiled-max-hw-stride-3=
2bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_big_fb@y-tiled-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_big_fb@y-tiled-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17500">i915#17500</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17432">i915#17432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>=
) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17478">i915#17478</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk6/igt@kms_big_fb@yf-tiled-64bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17478">i915#17478</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_big_fb@yf-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17478">i915#17478</a>) +16 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-=
dg2-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +34 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-=
dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_ccs@bad-pixel-format-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +125 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_ccs@bad-pixel-format-y-tiled-g=
en12-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +35 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk1/igt@kms_ccs@bad-rotation-90-4-tiled-ln=
l-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17525">i915#17525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_ccs@ccs-on-another-bo-yf-tiled=
-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17594">i915#17594</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled=
-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_ccs@crc-primary-basic-4-tiled=
-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) =
+13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:=
</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_ccs@crc-primary-rotation-180-4=
-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#174=
91</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a=
-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a=
-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +90 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a=
-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +26 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-til=
ed-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-ti=
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
e/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-=
mtl-mc-ccs@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-=
cc.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_=
9198/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.htm=
l">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16177/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-=
cc@pipe-c-edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGT_9198/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-=
rc-ccs-cc@pipe-c-edp-1.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_ccs@crc-primary-susp=
end-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@=
pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 oth=
er test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_ccs@random-ccs-data-y-tiled-c=
cs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_cdclk@mode-transition-all-out=
puts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16017">i915#16017</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3742">i915#3742</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_cdclk@mode-transition-all-out=
puts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17550">i915#17550</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_chamelium_audio@dp-audio-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_chamelium_audio@hdmi-audio-edi=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17483">i915#17483</a>) +10 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@kms_chamelium_audio@hdmi-audio-=
edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_chamelium_color@ctm-0-50.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17489">i915#17489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_chamelium_color@ctm-blue-to-=
red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17427">i915#17427</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk6/igt@kms_chamelium_color@ctm-blue-to-re=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_chamelium_color@degamma.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17427">i915#17427</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_chamelium_color_pipeline@plan=
e-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt2020.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:<=
/p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt2020-lim.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 othe=
r tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +5 other =
tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 othe=
r tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 oth=
er tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16464">i915#16464</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_chamelium_edid@dp-mode-timing=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@kms_chamelium_frames@dp-crc-multi=
ple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_chamelium_frames@hdmi-crc-sin=
gle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17483">i915#17483</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk4/igt@kms_chamelium_hpd@dp-hpd-after-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17483">i915#17483</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_chamelium_hpd@dp-hpd-with-ena=
bled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17483">i915#17483</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_chamelium_hpd@hdmi-hpd-enabl=
e-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_color_pipeline@plane-ctm3x4-l=
ut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17510">i915#17510</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_color_pipeline@plane-fixed-ma=
trix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_color_pipeline@plane-fixed-mat=
rix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_color_pipeline@plane-lut1d.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17510">i915#17510</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-ct=
m3x4@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_color_pipeline@plane-lut1d-c=
tm3x4@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17502">i915#17502</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17502">i915#17502</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_content_protection@legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15865">i915#15865</a>) +3 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_content_protection@legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_content_protection@legacy-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17508">i915#17508</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_content_protection@legacy-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_content_protection@legacy-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17508">i915#17508</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15865">i915#15865</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_content_protection@srm.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17508">i915#17508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_cursor_crc@cursor-offscreen-3=
2x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8814">i915#8814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/=
shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#=
13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp=
-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_=
9198/shard-mtlp-3/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.htm=
l">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16177/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13566">i915#13566</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15733">i915#15733</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_cursor_crc@cursor-random-32x3=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_cursor_crc@cursor-random-32x32=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17504">i915#17504</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_cursor_crc@cursor-random-512x5=
12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17533">i915#17533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk6/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_cursor_crc@cursor-suspend.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15840">i915#15840</a>) +12 other tests abort</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk4/igt@kms_cursor_crc@cursor-suspend.html=
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
/tree/drm-tip/IGTPW_16177/shard-glk4/igt@kms_cursor_crc@cursor-suspend@pipe=
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
/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@kms_cursor_legacy@cursora-vs-fl=
ipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +2 other te=
sts skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-fli=
pb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flip=
b-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +8 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15804">i915#15804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>) +1 other te=
st skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17486">i915#17486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17487">i915#17487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@p=
ipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17486">i915#17486</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_dp_link_training@non-uhbr-mst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17519">i915#17519</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_dp_link_training@non-uhbr-mst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_dp_link_training@non-uhbr-mst-=
direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17519">i915#17519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_dp_link_training@non-uhbr-sst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17664">i915#17664</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@kms_dp_link_training@non-uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17288">i915#17288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_dp_link_training@uhbr-mst-dire=
ct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbt=
alt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst-tbt=
alt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_dp_link_training@uhbr-mst-tb=
talt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_dp_link_training@uhbr-mst-tbta=
lt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_dp_link_training@uhbr-sst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@kms_dp_link_training@uhbr-sst-di=
rect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17297">i915#17297</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-9/igt@kms_dp_link_training@uhbr-sst-di=
rect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@kms_dp_linktrain_fallback@dsc-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_dp_linktrain_fallback@dsc-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17680">i915#17680</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_dp_linktrain_fallback@dsc-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17680">i915#17680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16867">i915#16867</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16870">i915#16870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_draw_crc@draw-method-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8812">i915#8812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_draw_crc@draw-method-mmap-gtt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_dsc@dsc-basic-bigjoiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17458">i915#17458</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_dsc@dsc-basic-ultrajoiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16361">i915#16361</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@kms_dsc@dsc-basic-ultrajoiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-bigjo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_dsc@dsc-fractional-bpp-bigjoin=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17458">i915#17458</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@kms_dsc@dsc-fractional-bpp-bigjo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_dsc@dsc-fractional-bpp-bigjoi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17458">i915#17458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp-ultraj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/16361">i915#16361</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_dsc@dsc-with-bpc-formats-ultr=
ajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-b=
igjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">=
i915#16680</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_fbcon_fbt@psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680"=
>i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_feature_discovery@display-3x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17679">i915#17679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_feature_discovery@psr2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17585">i915#17585</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-3/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_feature_discovery@psr2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17585">i915#17585</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_feature_discovery@psr2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_feature_discovery@psr2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_flip@2x-dpms-vs-vblank-race-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_flip@2x-flip-vs-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-=
modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-inter=
ruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839=
">i915#4839</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-inter=
ruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17183">i915#17183</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_flip@2x-modeset-vs-vblank-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_flip@2x-single-buffer-flip-vs=
-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-in=
terruptible@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@kms_flip@flip-vs-fences.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-4t=
ile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +1 other test sk=
ip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk6/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17593">i915#17593</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 other te=
st skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-x=
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
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +79 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>=
) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +41 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_frontbuffer_tracking@fbc-shrfb=
-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17606">i915#17606</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_frontbuffer_tracking@fbc-tilin=
g-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17559">i915#17559</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-til=
ing-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10055">i915#10055</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-tili=
ng-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10055">i915#10055</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_frontbuffer_tracking@fbc-tilin=
g-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17609">i915#17609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-=
1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-i=
ndfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchd=
r-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_frontbuffer_tracking@fbchdr-1p=
-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17588">i915#17588</a>) +110 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@kms_frontbuffer_tracking@fbchdr-=
1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-2=
p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +39 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbchdr-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428<=
/a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mma=
p-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16177/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dra=
w-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17517">i915#17517</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-=
stridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15989">i915#15989</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +84 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-=
cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +40 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +26 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +18 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsrhdr=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17559">i915#17559</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17559">i915#17559</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-o=
ffscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +28 other tes=
ts skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_frontbuffer_tracking@hdr-1p-of=
fscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +27 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-pr=
imscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +34 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-p=
rimscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-p=
rimscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +50 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</=
a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>=
) +18 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_frontbuffer_tracking@psr-1p-pr=
imscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +42 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i91=
5#1825</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-p=
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
/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +32 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_frontbuffer_tracking@psr-mode=
setfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17482">i915#17482</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-=
2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +30 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-2=
p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +32 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2=
p-scndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +25 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-8/igt@kms_frontbuffer_tracking@psrhdr-=
rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +18 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_hdmi_audio_bw@audio-bw-hblank8=
0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17104">i915#17104</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-6/igt@kms_hdmi_audio_bw@audio-bw-hblan=
k80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17103">i915#17103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@kms_hdmi_audio_bw@suspend-disk-a=
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
/tree/drm-tip/IGTPW_16177/shard-glk1/igt@kms_hdr@bpc-switch.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">=
i915#17498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498=
">i915#17498</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-5/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518=
">i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_hdr@invalid-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_hdr@static-toggle.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1749=
8">i915#17498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15459">i915#15459</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15459">i915#15459</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_joiner@basic-max-non-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17575">i915#17575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_joiner@invalid-modeset-big-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17512">i915#17512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-8/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_mst@mst-suspend-read-crc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16451">i915#16451</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_mst@mst-suspend-read-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16451">i915#16451</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_mst@mst-suspend-read-crc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17579">i915#17579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_pipe_b_c_ivb@disable-pipe-b-en=
able-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17540">i915#17540</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_pipe_b_c_ivb@disable-pipe-b-en=
able-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17540">i915#17540</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-c=
rc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-c=
rc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_pipe_stress@stress-xrgb8888-=
4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_pipe_stress@stress-xrgb8888-4t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17601">i915#17601</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-8/igt@kms_pipe_stress@stress-xrgb8888-=
4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_pipe_stress@stress-xrgb8888-x=
tiled.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-=
bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_plane@pixel-format-4-tiled-dg=
2-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17479">i915#17479</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg=
2-mc-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_plane@pixel-format-4-tiled-dg2=
-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-9/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_plane@pixel-format-y-tiled-ge=
n12-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_plane@pixel-format-y-tiled-mo=
difier@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_plane@pixel-format-yf-tiled-mo=
difier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17479">i915#17479</a>) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_plane@pixel-format-yf-tiled-=
modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_plane@pixel-format-yf-tiled-=
modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_plane@pixel-format-yf-tiled-mo=
difier@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend@pipe-b.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17752">i915#17752</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17763">i915#17763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_plane_alpha_blend@alpha-basic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17595">i915#17595</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@=
pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_plane_multiple@2x-tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17586">i915#17586</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_plane_multiple@2x-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_plane_multiple@tiling-yf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_plane_scaling@plane-downscale=
-max-crc-4-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-linear@pipe-c-hdmi-a-1-p01=
0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk5/igt@kms_plane_scaling@plane-downscale-=
max-crc-linear@pipe-c-hdmi-a-1-p010.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17833">i915#17833</a>) +17 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-=
b-hdmi-a-1-p010:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_plane_scaling@plane-downscale=
-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-p010.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17833">i915#178=
33</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-270-y-tiled@pipe-=
b-hdmi-a-1-rgb565:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_plane_scaling@plane-downscale=
-max-crc-rotation-270-y-tiled@pipe-b-hdmi-a-1-rgb565.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#17=
843</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_plane_scaling@plane-downscale=
-max-crc-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17832">i915#17832</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_plane_scaling@plane-downscal=
e-max-crc-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_plane_scaling@plane-downscale-=
max-crc-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17528">i915#17528</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_plane_scaling@plane-downscal=
e-max-crc-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-pixel-formats@pipe-a.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
a:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_plane_scaling@plane-scaler-wi=
th-clipping-clamping-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
c:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_plane_scaling@plane-scaler-wi=
th-clipping-clamping-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-=
hdmi-a-1-rgb565:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk4/igt@kms_plane_scaling@plane-upscale-ma=
x-crc-rotation-270-y-tiled@pipe-c-hdmi-a-1-rgb565.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#178=
43</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-270-y-tiled@pipe-c-=
hdmi-a-4-y210:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_plane_scaling@plane-upscale-=
max-crc-rotation-270-y-tiled@pipe-c-hdmi-a-4-y210.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915#178=
43</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17462">i915#17462</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_pm_backlight@basic-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17462">i915#17462</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-2/igt@kms_pm_backlight@basic-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_pm_backlight@fade-with-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_pm_dc@dc5-pageflip-negative.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17495">i915#17495</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_pm_dc@dc5-pageflip-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9685">i915#9685</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_pm_dc@dc5-pageflip-negative.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_pm_dc@dc5-psr-suspend-resume.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17495">i915#17495</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">i=
915#17564</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">=
i915#15948</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17602">i=
915#17602</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17573">i915#17573</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_pm_rp=
m@dpms-lpsp.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-18/igt@=
kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-dg2-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg2-=
3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_pm=
_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@kms_pm_rpm@fences.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">=
i915#4077</a>) +7 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_pm_rpm@fences.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473">i=
915#17473</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@kms_p=
m_rpm@modeset-lpsp.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg1-=
16/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_p=
m_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_prime@d3hot.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569">i9=
15#17569</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk5/igt@kms_properties@colorop-properties-=
atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17481">i915#17481</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_properties@colorop-properties-=
atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_psr2_sf@fbc-pr-overlay-primary=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_psr2_sf@fbc-pr-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</l=
i>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_psr2_sf@fbc-pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-e=
dp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_psr2_sf@pr-cursor-plane-move-c=
ontinuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-move=
-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-8/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +14 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4348">i915#4348</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_psr2_su@page_flip-nv12.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_psr2_su@page_flip-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9683">i915#9683</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17546">i915#17546</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk3/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-mmap-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-10/igt@kms_psr@fbc-psr-cursor-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_psr@fbc-psr-sprite-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17480">i915#17480</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_psr@fbc-psr-sprite-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9688">i915#9688</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_psr@fbc-psr2-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17480">i915#17480</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_psr@fbc-psr2-no-drrs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7480">i915#17480</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_psr@pr-sprite-plane-move.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17480">i915#17480</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@kms_psr@psr-cursor-plane-move.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_psr@psr-suspend.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1722=
6">i915#17226</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-7/igt@kms_psr@psr2-cursor-blt.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1/igt@kms_=
psr@psr2-cursor-blt.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_psr@psr2-cursor-blt.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17845">i915#17845</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@kms_psr@psr2-primary-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-19/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_psr_stress_test@invalidate-pri=
mary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_psr_stress_test@invalidate-pr=
imary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_psr_stress_test@invalidate-pr=
imary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-3/igt@kms_rotation_crc@exhaust-fences.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4235">i915#4235</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_rotation_crc@exhaust-fences.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17676">i915#17676</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4884">i915#4884</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-3/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-4/igt@kms_rotation_crc@primary-rotation=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb6/igt@kms_rotation_crc@primary-rotation-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17488">i915#17488</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-6/igt@kms_rotation_crc@primary-rotatio=
n-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk10/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_scaling_modes@scaling-mode-fu=
ll-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17501">i915#17501</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_scaling_modes@scaling-mode-ful=
l-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_setmode@basic.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i=
915#15106</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_setmode@basic-clone-single-cr=
tc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@kms_tiled_display@basic-test-patte=
rn.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17672">i915#17672</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10959">i915#10959</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_tiled_display@basic-test-patt=
ern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk11/igt@kms_tiled_display@basic-test-patt=
ern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17705">i915#17705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_vblank@ts-continuation-dpms-s=
uspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17844">i915#17844</a>) +16 other tests abort</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_vblank@ts-continuation-dpms-=
suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17844">i915#17844</a>) +13 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752">i915#17752</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-b-vga-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17752">i915#17752</a>) +1 other test dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk4/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) =
+1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@kms_vrr@flip-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8808">i915#8808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_vrr@max-min.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i91=
5#17520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-16/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9906">i915#9906</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb4/igt@kms_vrr@seamless-rr-switch-vrr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17520">i915#17520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk4/igt@perf@gen12-unprivileged-single-ctx=
-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@perf@stress-open-close.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/175=
92">i915#17592</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@perf@unprivileged-single-ctx-cou=
nters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17455">i915#17455</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-7/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-1=
/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@perf_pmu@=
busy-double-start@vecs0.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk5/igt@perf_pmu@rc6@other-idle-gt0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17583">i915#17583</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@perf_pmu@rc6@other-idle-gt0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17583">i915#17583</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-17/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-tglu-5/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@perf_pmu@rc6@runtime-pm-long-gt0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17687">i915#17687</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@prime_udl@share-import-addfb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16420">i915#16420</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-7/igt@prime_udl@share-import-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16420">i915#16420</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-14/igt@prime_udl@share-import-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@prime_vgem@fence-flip-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-2/igt@prime_vgem@fence-flip-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-glk2/igt@prime_vgem@fence-write-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17467">i915#17467</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-snb5/igt@prime_vgem@fence-write-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17467">i915#17467</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg2-6/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4818">i915#4818</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-dg1-15/igt@tools_test@sysfs_l3_parity.html"=
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shar=
d-rkl-2/igt@gem_ctx_isolation@preservation-s3.html">PASS</a> +1 other test =
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
6177/shard-mtlp-7/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
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
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-m=
tlp-8/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/ig=
t@gem_exec_suspend@basic-s3.html">INCOMPLETE</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/ig=
t@gem_exec_suspend@basic-s3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@gem_exec_suspend@basic-s4-devices.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17879">=
i915#17879</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16177/shard-rkl-2/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a>=
 +1 other test pass</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-7/igt@gem_exec_suspend@basic-s4-devices.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17879"=
>i915#17879</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16177/shard-mtlp-7/igt@gem_exec_suspend@basic-s4-devices.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-tglu-7/igt@gem_workarounds@suspend-resume-fd.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840=
">i915#15840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16177/shard-tglu-5/igt@gem_workarounds@suspend-resume-fd.html">PASS<=
/a></li>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk9/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLET=
E</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-g=
lk1/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
586">i915#14586</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16177/shard-glk5/igt@gem_workarounds@suspend-resume-fd.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-6/igt@i915_suspend@forcewake.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-mtlp-3/igt@i915=
_suspend@forcewake.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17171">i915#17171</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@i915_suspend=
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
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-7/igt@kms_=
async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">PASS</a> +1=
 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17037">i915#17037</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@kms_async_flips@async-flip-suspe=
nd-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-a=
-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17150">i915#17150</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@kms_async_flips@async-fli=
p-suspend-resume@pipe-a-edp-1.html">PASS</a></li>
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
/tree/drm-tip/IGTPW_16177/shard-snb1/igt@kms_atomic_transition@plane-all-mo=
deset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_cursor_crc@cursor-random-128x42.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
5/igt@kms_cursor_crc@cursor-random-128x42.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-=
rkl-4/igt@kms_cursor_crc@cursor-random-128x42.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdm=
i-a-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_9198/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-=
1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_16177/shard-tglu-7/igt@kms_cursor_crc@cursor-random-=
128x42@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566"=
>i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16177/shard-rkl-3/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</=
a> +1 other test pass</li>
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shar=
d-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-2/igt@kms_cursor_crc@cursor-suspend.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17157">i91=
5#17157</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16177/shard-mtlp-8/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2=
.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_9198/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16276">i915#16276</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6113">i915#6113</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_flip@flip-vs-su=
spend-interruptible@a-hdmi-a2.html">PASS</a> +1 other test pass</li>
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
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_flip_tilin=
g@flip-change-tiling@pipe-a-edp-1-4-to-linear.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-=
indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-prim=
scrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_f=
rontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">PASS</a>=
 +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_9198/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-2p-scnds=
crn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_fr=
ontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-mtlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard=
-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">ABORT</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17175">i915#1=
7175</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6177/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tr=
acking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> +2 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-glk5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb=
-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk8/igt@kms_frontbuffer_track=
ing@hdr-2p-scndscrn-spr-indfb-draw-render.html">PASS</a> +2 other tests pas=
s</li>
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
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-8/igt@k=
ms_hdmi_inject@inject-audio.html">PASS</a></li>
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
-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-tglu-4/igt@kms_pipe_stress@st=
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
ee/drm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_plane@plane-panning-bottom-righ=
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
ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_plane@plane-panning-=
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-=
glk6/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a></li>
<li>shard-tglu:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-tglu-10/igt@kms_plane_scaling@intel-max-src-size.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-t=
glu-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/695=
3">i915#6953</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16177/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size.html">PA=
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
rm-tip/IGTPW_16177/shard-mtlp-5/igt@kms_pm_backlight@fade-with-suspend.html=
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
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mt=
lp-1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt=
@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@=
kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +2 other tests pass</li>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg1-14/i=
gt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg1-15/i=
gt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17209">i915#17209</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16177/shard-mtlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.=
html">PASS</a> +1 other test pass</li>
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
ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-1/igt@perf_pmu@gt-awake.html"=
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
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@perf_pmu@rc6-s=
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
W_16177/shard-rkl-3/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i=
915#8411</a>)</li>
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
ree/drm-tip/IGTPW_16177/shard-rkl-8/igt@gem_bad_reloc@negative-reloc-lut.ht=
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
rm-tip/IGTPW_16177/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP=
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
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/sh=
ard-rkl-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</=
li>
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shar=
d-rkl-4/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href=3D"https:=
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
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mt=
lp-7/igt@gem_ctx_isolation@preservation-s3.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17175">i915#17175</a>) =
+1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-3/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt@gem_=
ctx_sseu@invalid-sseu.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@gem_ctx_sseu@i=
nvalid-sseu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shar=
d-rkl-7/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327">=
i915#17327</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
6/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i9=
15#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16177/shard-rkl-8/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i=
915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i9=
15#17416</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16177/shard-rkl-6/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17416">i915#17416</a>)</li>
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
177/shard-rkl-5/igt@gem_exec_reloc@basic-concurrent16.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#32=
81</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-read-noreloc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
1">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_16177/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-read-noreloc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
3/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rk=
l-6/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i=
915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-3/igt@gem_lmem_swapping@heavy-random.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-7/igt=
@gem_lmem_swapping@heavy-random.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@ge=
m_lmem_swapping@heavy-random.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@gem_lmem_swapping@massive.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16177/shard-rkl-5/igt@gem_lmem_swapping@massive.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i9=
15#4613</a>)</li>
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
/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@gem_lmem_swapping@parallel-random=
-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-disp=
lay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
_9198/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-display.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16177/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-aft=
er-reads-display.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test=
 skip</li>
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
el-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@gem_partial_pwrit=
e_pread@writes-after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other t=
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
rm-tip/IGTPW_16177/shard-rkl-8/igt@gem_pwrite@basic-exhaustion.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282=
">i915#3282</a>)</li>
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
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/sh=
ard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)<=
/li>
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
TPW_16177/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#=
3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i91=
5#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16177/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3297">i915#3297</a>) +1 other test skip</li>
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
IGTPW_16177/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
297">i915#3297</a>) +1 other test skip</li>
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
rm-tip/IGTPW_16177/shard-rkl-2/igt@gen3_render_mixed_blits.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i=
915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-5/igt@gen7_=
exec_parse@bitmasks.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/=
igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +1 other test s=
kip</li>
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
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/=
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-=
rkl-5/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href=3D"https://g=
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
e/drm-tip/IGTPW_16177/shard-rkl-2/igt@gen9_exec_parse@bb-start-param.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/sha=
rd-rkl-8/igt@i915_module_load@fault-injection@__uc_init.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15479">i915#15479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16177/shard-rkl-5/igt@i915_module_load@fault-injection@__=
uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
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
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rk=
l-8/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl=
-5/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">=
i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16177/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399=
">i915#8399</a>)</li>
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
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@i915_suspend=
@forcewake.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/=
igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4=
538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16177/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-=
async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGT_9198/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-=
0-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_big=
_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i=
915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431"=
>i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-27=
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
p/IGT_9198/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl=
-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">=
i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16177/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538=
">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-=
4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rk=
l-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i=
915#4538</a>)</li>
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
/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-9=
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
ree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6095">i915#6095</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198=
/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +1 other test skip</li>
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
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-r=
kl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
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
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@=
kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12805">i915#12805</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bm=
g-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12805">i915#12805</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@p=
ipe-d-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-6/igt@kms_ccs@crc-primary-=
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
i.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@kms_ccs@crc-sprite-planes=
-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-=
b-hdmi-a-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGT_9198/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-b-hdmi-a-2.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pip=
e-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_ccs@random-ccs-dat=
a-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pip=
e-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915=
#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_cdclk@plane-scaling.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt@kms_c=
dclk@plane-scaling.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-4/igt=
@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
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
IGTPW_16177/shard-rkl-4/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_919=
8/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16471">i915#16471</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17427">i915#17427</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_chamelium_color_pipel=
ine@plane-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#=
17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:<=
/p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-=
yuv-rgb-bt2020-lim.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-fix=
ed-matrix-yuv-rgb-bt2020-lim.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@km=
s_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17427">i915#17427</a>)</li>
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
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@km=
s_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">=
i915#17427</a>)</li>
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
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@km=
s_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828=
">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-n=
on-4k.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_9198/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-=
4k.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_chamelium_e=
did@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7828">i915#7828</a>) +1 other test skip</li>
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
p/IGTPW_16177/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"=
>i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
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
i.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_content_protection@dp=
-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@kms_content_protection@legacy.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915=
#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16177/shard-rkl-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_content_protection@srm.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-4/igt@kms=
_content_protection@srm.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
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
TPW_16177/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-=
a-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
_9198/shard-rkl-8/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x=
85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/sha=
rd-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16177/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
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
ree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor=
-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17428">i915#17428</a>) +50 other tests skip</li>
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shar=
d-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-3/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shar=
d-rkl-6/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
>)</li>
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
01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_dp_link_training@non-uh=
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
-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_dp_link_trainin=
g@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1636=
1">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16177/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-r=
kl-5/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/=
shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16361">i915#16361</a>)</li>
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
W_16177/shard-rkl-5/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i=
915#16361</a>)</li>
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
177/shard-rkl-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a hre=
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shar=
d-rkl-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16600">i915#16600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16177/shard-rkl-2/igt@kms_feature_discovery@vrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600"=
>i915#16600</a>)</li>
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
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/sh=
ard-rkl-3/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interrupt=
ible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_9198/shard-rkl-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_flip@2x-flip-vs-absolute-wf_v=
blank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
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
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk6/igt@kms_flip@2x-=
flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#1=
7183</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-gl=
k8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#123=
14</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk8/i=
gt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i9=
15#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
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
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-2/igt@km=
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
77/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rc=
ccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
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
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@=
kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7428">i915#17428</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri=
-indfb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGT_9198/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-o=
ffscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt=
@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15102">i915#15102</a>) +15 other tests skip</li>
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
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#1=
5102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap=
-gtt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@kms_frontbuffer=
_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard=
-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16177/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-s=
pr-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_9198/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scnds=
crn-spr-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuff=
er_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
428">i915#17428</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tilin=
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
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_fro=
ntbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i9=
15#15989</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrf=
b-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGT_9198/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pr=
i-shrfb-draw-mmap-wc.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-glk2/igt@kms_frontbuf=
fer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#175=
17</a>) +11 other tests skip</li>
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
IGTPW_16177/shard-rkl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKI=
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
_16177/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-d=
raw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-ms=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#174=
28</a>) +7 other tests skip</li>
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
TPW_16177/shard-mtlp-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
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
W_16177/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#127=
13</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16644">i915#16644</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-3/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_hdr@invalid-hdr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198=
/shard-rkl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15815">i915#15815</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16177/shard-rkl-8/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/i=
gt@kms_panel_fitting@atomic-fastset.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#630=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1617=
7/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifi=
er.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_=
9198/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.htm=
l">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_plane@pixel-for=
mat-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other tes=
t skip</li>
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
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_pl=
ane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#1=
5709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-6/igt=
@kms_plane_multiple@2x-tiling-x.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/=
shard-rkl-2/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-cla=
mping-rotation.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGT_9198/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clippi=
ng-clamping-rotation.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_161=
77/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-ro=
tation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-cla=
mping-rotation@pipe-b.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGT_9198/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with=
-clipping-clamping-rotation@pipe-b.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/i=
gt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15329">i915#15329</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
c:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-cla=
mping-rotation@pipe-c.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGT_9198/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-with=
-clipping-clamping-rotation@pipe-c.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#178=
32</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_161=
77/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-ro=
tation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>=
)</li>
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
-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_plane_scaling@plane=
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shar=
d-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-dg2-8/igt@kms_pm_lp=
sp@kms-lpsp.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16177/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-p=
rimary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-are=
a.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9=
198/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_psr2_sf@pr-overla=
y-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915=
#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16177/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-8/igt@kms_psr@fbc-psr-cursor-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#=
1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16177/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-render.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
72">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-8/igt@=
kms_psr@pr-cursor-plane-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">=
i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16177/shard-rkl-7/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#=
1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-7/igt@kms_psr@psr-sprite-mmap-gtt.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9198/shard-rkl-2/igt@km=
s_psr@psr-sprite-mmap-gtt.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-=
6/igt@kms_psr@psr-sprite-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/973=
2">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_9198/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_919=
8/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17432">i915#17432</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16177/shard-rkl-6/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#528=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9198/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_16177/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-f=
ull.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
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
e/drm-tip/IGTPW_16177/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-vrr.html">=
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
e/drm-tip/IGTPW_16177/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-cou=
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
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16177/shard-mtlp-5/igt@perf_pm=
u@busy-double-start.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2 other tests fail</li>
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
ci.01.org/tree/drm-tip/IGTPW_16177/shard-rkl-3/igt@prime_vgem@fence-write-h=
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
<li>IGT: IGT_9198 -&gt; IGTPW_16177</li>
<li>Linux: CI_DRM_19561 -&gt; CI_DRM_19563</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19561: 7f983558aaf724daeafb5904dbb078835857b51e @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  CI_DRM_19563: 2bdca9b1f8638ef27955d61c149bc6fac856d291 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_16177: 16177<br />
  IGT_9198: 9198</p>

</body>
</html>

--===============5971509368501720767==--
