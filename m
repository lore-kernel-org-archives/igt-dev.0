Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60937C0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 17:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BF710E726;
	Tue, 11 Feb 2025 17:22:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945E210E726;
 Tue, 11 Feb 2025 17:22:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1053112040922200654=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_XE_support_for_i915?=
 =?utf-8?q?=5Fpipe=5Fstress?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 11 Feb 2025 17:22:06 -0000
Message-ID: <173929452658.974576.12677995070148431563@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250211122743.329838-1-swati2.sharma@intel.com>
In-Reply-To: <20250211122743.329838-1-swati2.sharma@intel.com>
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

--===============1053112040922200654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add XE support for i915_pipe_stress
URL   : https://patchwork.freedesktop.org/series/144665/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_16107_full -> IGTPW_12574_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12574_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12574_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12574_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_params@larger-than-life-batch:
    - shard-dg1:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg1-13/igt@gem_exec_params@larger-than-life-batch.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_exec_params@larger-than-life-batch.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-glk:          NOTRUN -> [ABORT][3] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk6/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_mmap_offset@open-flood:
    - shard-rkl:          [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-8/igt@gem_mmap_offset@open-flood.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@gem_mmap_offset@open-flood.html

  * {igt@kms_pipe_stress@stress-xrgb8888-ytiled} (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  
New tests
---------

  New tests have been introduced between CI_DRM_16107_full and IGTPW_12574_full:

### New IGT tests (4) ###

  * igt@gem_exec_schedule@fifo@vecs1:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_atomic@plane-cursor-legacy@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - Statuses : 7 pass(s)
    - Exec time: [6.08, 13.68] s

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - Statuses : 4 pass(s) 3 skip(s)
    - Exec time: [0.0, 14.36] s

  

Known issues
------------

  Here are the changes found in IGTPW_12574_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#11078])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-tglu-1:       NOTRUN -> [SKIP][9] ([i915#11078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][10] ([i915#11814] / [i915#11815] / [i915#9413])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8414]) +15 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@busy-check-all@bcs0:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8414]) +12 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@drm_fdinfo@busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#8414]) +17 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-2/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2-9:        NOTRUN -> [SKIP][14] ([i915#8414])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#4873]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-1/igt@gem_caching@writes.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#9323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#3555] / [i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@gem_ccs@ctrl-surf-copy.html
    - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#3555] / [i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#13008])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][24] -> [INCOMPLETE][25] ([i915#13356])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#7697]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#7697]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@gem_close_race@multigpu-basic-process.html
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#7697])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-4/igt@gem_close_race@multigpu-basic-process.html
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#7697])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#7697])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#6335])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#8555])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#8555]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-1/igt@gem_ctx_persistence@heartbeat-stop.html
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#8555])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-hang:
    - shard-snb:          NOTRUN -> [SKIP][35] ([i915#1099])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-snb1/igt@gem_ctx_persistence@legacy-engines-hang.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2-9:        NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#280])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-internal-immediate:
    - shard-mtlp:         NOTRUN -> [ABORT][38] ([i915#13193]) +1 other test abort
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@gem_eio@in-flight-internal-immediate.html

  * igt@gem_eio@kms:
    - shard-dg2:          NOTRUN -> [FAIL][39] ([i915#5784])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@gem_eio@kms.html
    - shard-dg1:          NOTRUN -> [FAIL][40] ([i915#5784])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][41] -> [FAIL][42] ([i915#12543] / [i915#5784])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg1-17/igt@gem_eio@reset-stress.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@gem_eio@reset-stress.html

  * igt@gem_eio@wait-immediate:
    - shard-mtlp:         [PASS][43] -> [ABORT][44] ([i915#13193])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-mtlp-8/igt@gem_eio@wait-immediate.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@gem_eio@wait-immediate.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4771]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4812]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@gem_exec_balancer@bonded-semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4812]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@bonded-true-hang:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4812]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@gem_exec_balancer@bonded-true-hang.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([i915#4036])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-3/igt@gem_exec_balancer@invalid-bonds.html
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#4036])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_exec_balancer@invalid-bonds.html
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#4036])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglu-1:       NOTRUN -> [SKIP][52] ([i915#4525])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#4525]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#6334]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][55] ([i915#6334]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk3/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#6344])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-5/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fence@concurrent:
    - shard-dg2-9:        NOTRUN -> [SKIP][57] ([i915#4812])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3539])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_exec_flush@basic-uc-prw-default.html
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3539])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3539] / [i915#4852])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#3281]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#3281]) +8 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#3281]) +10 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3281]) +10 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg2-9:        NOTRUN -> [SKIP][65] ([i915#3281])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2-9:        NOTRUN -> [SKIP][66] ([i915#4537] / [i915#4812])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4537] / [i915#4812]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][68] -> [INCOMPLETE][69] ([i915#11441] / [i915#13304]) +1 other test incomplete
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4860]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg2-9:        NOTRUN -> [SKIP][71] ([i915#4860])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4860])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_fenced_exec_thrash@2-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4860]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-1/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#4613]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#4613]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#4613]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][77] ([i915#4613]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk1/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#4613]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-2/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4077]) +18 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-4/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4077]) +12 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4083]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@write:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4083]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@gem_mmap_wc@write.html
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4083])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@gem_mmap_wc@write.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-dg2-9:        NOTRUN -> [SKIP][84] ([i915#4083]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#3282]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#3282]) +6 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3282]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg2-9:        NOTRUN -> [SKIP][88] ([i915#3282]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@snoop:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#3282]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@gem_pread@snoop.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4270]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4270])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][92] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#13398])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#13398]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-rkl:          [PASS][95] -> [TIMEOUT][96] ([i915#12917] / [i915#12964])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2-9:        NOTRUN -> [SKIP][97] ([i915#4270])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#8428]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-ccs-to-linear:
    - shard-dg2-9:        NOTRUN -> [SKIP][99] ([i915#5190] / [i915#8428])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_render_copy@yf-tiled-ccs-to-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#5190] / [i915#8428]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#4079]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2-9:        NOTRUN -> [SKIP][102] ([i915#4885])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4077]) +16 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4079])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@gem_tiled_pread_basic.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2-9:        NOTRUN -> [SKIP][105] ([i915#4079]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_tiled_pread_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#4879])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-4/igt@gem_unfence_active_buffers.html
    - shard-dg2-9:        NOTRUN -> [SKIP][107] ([i915#4879])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#3297])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-4/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][109] ([i915#3323])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#3297])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2-9:        NOTRUN -> [SKIP][111] ([i915#3297]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#3282] / [i915#3297])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-5/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#3297]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#3297] / [i915#4880])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#3297] / [i915#4880])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2-9:        NOTRUN -> [SKIP][116] ([i915#3297] / [i915#4880])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#3297])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#3297])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen3_render_tiledx_blits:
    - shard-dg2-9:        NOTRUN -> [SKIP][119] +8 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][120] +12 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-2/igt@gen7_exec_parse@bitmasks.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          NOTRUN -> [SKIP][121] +21 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#2856]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@gen9_exec_parse@allowed-single.html
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#2856]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#2527] / [i915#2856]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-dg2-9:        NOTRUN -> [SKIP][125] ([i915#2856]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#2527]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#2527] / [i915#2856]) +3 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-7/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#2527]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][129] -> [ABORT][130] ([i915#9820])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [PASS][131] -> [ABORT][132] ([i915#10887] / [i915#12817] / [i915#9820])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#7178])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#8399]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#8399])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-tglu-1:       NOTRUN -> [WARN][136] ([i915#2681]) +4 other tests warn
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#11681] / [i915#6621]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#11681])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg2-9:        NOTRUN -> [SKIP][139] ([i915#11681])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#7984])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][141] ([i915#6245])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@i915_query@hwconfig_table.html
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#6245])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#5723])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live:
    - shard-rkl:          [PASS][144] -> [DMESG-FAIL][145] ([i915#12964] / [i915#13550])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-3/igt@i915_selftest@live.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [PASS][146] -> [DMESG-FAIL][147] ([i915#13550])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-3/igt@i915_selftest@live@gt_pm.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2-9:        NOTRUN -> [DMESG-WARN][148] ([i915#9311]) +1 other test dmesg-warn
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@i915_selftest@mock@memory_region.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#4212])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#4212]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2-9:        NOTRUN -> [SKIP][151] ([i915#4212]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#12454] / [i915#12712])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#4212])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-rc-ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#8709]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#8709]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][156] ([i915#8709]) +7 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#4538] / [i915#5286]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#5286]) +4 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#5286]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#5286]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#5286])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][162] -> [FAIL][163] ([i915#5138])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         NOTRUN -> [FAIL][164] ([i915#5138])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][165] +23 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#3638]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#3638]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-9:        NOTRUN -> [SKIP][168] ([i915#4538] / [i915#5190]) +4 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#4538] / [i915#5190]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#6187]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#4538]) +4 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          [PASS][172] -> [DMESG-WARN][173] ([i915#12964]) +34 other tests dmesg-warn
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#6095]) +167 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#12313])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#12313]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#12313]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#12313])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#12313]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-snb:          NOTRUN -> [SKIP][181] +63 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-snb5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][182] ([i915#10307] / [i915#6095]) +34 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][183] ([i915#12313])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#6095]) +49 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#6095]) +39 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#12805])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#6095]) +12 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][188] ([i915#6095]) +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#6095]) +54 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#6095]) +85 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#10307] / [i915#6095]) +153 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#3742])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#11151] / [i915#7828]) +10 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#11151] / [i915#7828]) +6 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#11151] / [i915#7828]) +12 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-tglu-1:       NOTRUN -> [SKIP][196] ([i915#11151] / [i915#7828]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#11151] / [i915#7828]) +13 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][198] ([i915#11151] / [i915#7828]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#11151] / [i915#7828]) +7 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@deep-color:
    - shard-dg2-9:        NOTRUN -> [SKIP][200] ([i915#3555]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@kms_content_protection@atomic.html
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#7118] / [i915#9424])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#6944] / [i915#9424])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-3/igt@kms_content_protection@content-type-change.html
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#9424])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-6/igt@kms_content_protection@content-type-change.html
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#9424])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#7118] / [i915#9424])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2-9:        NOTRUN -> [SKIP][207] ([i915#9424])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#9424]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#7116] / [i915#9424])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#6944] / [i915#9424]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][212] ([i915#1339] / [i915#7173])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-3.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][213] ([i915#118]) +1 other test dmesg-fail
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#3555]) +7 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#13049]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#13049]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][217] ([i915#13566]) +1 other test fail
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][218] ([i915#13566]) +1 other test fail
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#13049]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-tglu-1:       NOTRUN -> [SKIP][220] ([i915#13049]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#8814]) +4 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#3555]) +7 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         [PASS][223] -> [FAIL][224] ([i915#13566]) +3 other tests fail
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][225] -> [FAIL][226] ([i915#13566]) +3 other tests fail
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#3555]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#3555] / [i915#8814]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-9:        NOTRUN -> [SKIP][229] ([i915#13049]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#13049])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#13049]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-9:        NOTRUN -> [SKIP][232] ([i915#13046] / [i915#5354]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#4103])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#4103] / [i915#4213])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#13046] / [i915#5354]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#9809]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#4103]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][238] ([i915#4103])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_cursor_legacy@torture-move@pipe-a:
    - shard-glk:          NOTRUN -> [DMESG-WARN][239] ([i915#1982]) +1 other test dmesg-warn
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk9/igt@kms_cursor_legacy@torture-move@pipe-a.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#9723])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#9833])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#9833])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#3804])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#12402])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#12402])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#12402])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#12402])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][248] ([i915#12402])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2-9:        NOTRUN -> [SKIP][249] ([i915#8812])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#3840])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][251] ([i915#3555] / [i915#3840])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#3555] / [i915#3840])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2-9:        NOTRUN -> [SKIP][253] ([i915#3555] / [i915#3840])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#3555] / [i915#3840]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][255] ([i915#9878])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#1839])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#658])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#4881])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_fence_pin_leak.html
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#4881])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-1/igt@kms_fence_pin_leak.html
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#4881])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-4/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#3637]) +6 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#3637]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#8381])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#9934]) +5 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-9:        NOTRUN -> [SKIP][265] ([i915#9934]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][266] ([i915#4839])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#3637]) +5 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-3/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#9934]) +5 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#9934]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-glk:          NOTRUN -> [DMESG-WARN][270] ([i915#118]) +1 other test dmesg-warn
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#8381])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][272] ([i915#12745] / [i915#4839]) +2 other tests incomplete
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][273] ([i915#12745]) +1 other test incomplete
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2:          [PASS][274] -> [FAIL][275] ([i915#11989]) +2 other tests fail
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg2-6/igt@kms_flip@plain-flip-fb-recreate.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-2/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-tglu:         [PASS][276] -> [FAIL][277] ([i915#11989]) +3 other tests fail
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-10/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][278] ([i915#11989]) +1 other test fail
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a4:
    - shard-dg1:          [PASS][279] -> [FAIL][280] ([i915#11989]) +3 other tests fail
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg1-18/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a4.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#2672] / [i915#3555]) +3 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#2672] / [i915#3555])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][283] ([i915#2587] / [i915#2672])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#2672] / [i915#3555]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#2672] / [i915#8813]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#2672]) +4 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#2672]) +4 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#2587] / [i915#2672] / [i915#3555])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#2587] / [i915#2672]) +4 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][290] ([i915#2672]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#2672] / [i915#3555]) +4 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#3555] / [i915#8810] / [i915#8813])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#3555] / [i915#8810])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#2672] / [i915#3555]) +4 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#2587] / [i915#2672]) +4 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][297] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#2672] / [i915#3555] / [i915#8813]) +9 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][299] -> [FAIL][300] ([i915#6880])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-9:        NOTRUN -> [SKIP][301] ([i915#8708]) +6 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#5354]) +24 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-9:        NOTRUN -> [SKIP][303] ([i915#5354]) +11 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#1825]) +29 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][305] +57 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-9:        NOTRUN -> [SKIP][306] ([i915#10055])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][307] +52 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#8708]) +7 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg2-9:        NOTRUN -> [SKIP][309] ([i915#3458]) +9 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#3023]) +23 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#8708]) +12 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][312] ([i915#1825]) +31 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#3458]) +17 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#8708]) +14 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#3458]) +21 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][316] +62 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2-9:        NOTRUN -> [SKIP][317] ([i915#3555] / [i915#8228])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#3555] / [i915#8228]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_hdr@bpc-switch-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#3555] / [i915#8228]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_hdr@bpc-switch-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#3555] / [i915#8228]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-8/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#3555] / [i915#8228]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-9:        NOTRUN -> [SKIP][322] ([i915#12713])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#12713])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          [PASS][324] -> [SKIP][325] ([i915#3555] / [i915#8228])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#10656])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#10656])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-3/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#12388])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-9:        NOTRUN -> [SKIP][329] ([i915#10656])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#12394])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#12339])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-9:        NOTRUN -> [SKIP][332] ([i915#13522])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][333] ([i915#6301])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#6301])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][335] -> [INCOMPLETE][336] ([i915#12756])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][337] ([i915#10647] / [i915#12169])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][338] ([i915#10647]) +1 other test fail
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-mtlp:         NOTRUN -> [SKIP][339] ([i915#10226] / [i915#11614] / [i915#3555] / [i915#8821])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][340] ([i915#11614] / [i915#3582]) +3 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#3555] / [i915#8806])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#12247]) +22 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][343] ([i915#12247]) +4 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#12247]) +4 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][345] ([i915#12247]) +14 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#12247] / [i915#6953] / [i915#9423])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#12247] / [i915#6953])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#12247] / [i915#6953])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#12247]) +3 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][350] ([i915#12247]) +3 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#12247] / [i915#6953]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#12247] / [i915#3555] / [i915#6953])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][353] ([i915#12247] / [i915#3555])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#5354]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#9812])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-10/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#5354])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#3828])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-mtlp:         NOTRUN -> [FAIL][358] ([i915#12912])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#9685]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][360] ([i915#3361])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][361] ([i915#4281])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][362] -> [SKIP][363] ([i915#9519])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [PASS][364] -> [SKIP][365] ([i915#12916])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][366] ([i915#9519])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@fences-dpms:
    - shard-dg2-9:        NOTRUN -> [SKIP][367] ([i915#4077]) +4 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_pm_rpm@fences-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#9519])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#9519])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2-9:        NOTRUN -> [SKIP][370] ([i915#9519])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][371] -> [SKIP][372] ([i915#9519]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#9519])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][374] ([i915#6524])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-9/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][375] ([i915#6524]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-mtlp:         NOTRUN -> [SKIP][376] ([i915#6524]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-4/igt@kms_prime@d3hot.html
    - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#6524] / [i915#6805])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#11520]) +8 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][379] ([i915#9808]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][380] ([i915#11520]) +4 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][381] ([i915#11520]) +9 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][382] ([i915#11520]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][383] ([i915#11520]) +7 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][384] ([i915#12316]) +7 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][385] ([i915#11520])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-snb5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][386] ([i915#11520]) +6 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-9:        NOTRUN -> [SKIP][387] ([i915#11520]) +2 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu:         NOTRUN -> [SKIP][388] ([i915#9683])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-9/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-mtlp:         NOTRUN -> [SKIP][389] ([i915#4348]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#9683]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-4/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#9683])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#9683]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-cursor-render:
    - shard-tglu:         NOTRUN -> [SKIP][393] ([i915#9732]) +12 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-3/igt@kms_psr@fbc-psr-cursor-render.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#1072] / [i915#9732]) +20 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][395] ([i915#1072] / [i915#9732]) +10 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][396] +448 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk9/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@pr-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][397] ([i915#9688]) +18 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_psr@pr-primary-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][398] ([i915#9732]) +14 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#1072] / [i915#9732]) +21 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][400] ([i915#1072] / [i915#9732]) +22 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][401] ([i915#9685]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-tglu-1:       NOTRUN -> [SKIP][402] ([i915#9685])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg1:          NOTRUN -> [SKIP][403] ([i915#9685])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][404] ([i915#9685]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][405] ([i915#5289])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][406] ([i915#5190]) +2 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][407] ([i915#5289])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#5289]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][409] ([i915#5289])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][410] ([i915#3555]) +7 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-mtlp:         NOTRUN -> [SKIP][411] ([i915#3555] / [i915#5030] / [i915#9041])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][412] ([i915#5030]) +2 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][413] ([i915#5030] / [i915#9041])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][414] ([i915#13179]) +1 other test abort
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-7/igt@kms_selftest@drm_framebuffer.html
    - shard-mtlp:         NOTRUN -> [ABOR

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/index.html

--===============1053112040922200654==
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
<tr><td><b>Series:</b></td><td>Add XE support for i915_pipe_stress</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144665/">https://patchwork.freedesktop.org/series/144665/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_16107_full -&gt; IGTPW_12574_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12574_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12574_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12574_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_params@larger-than-life-batch:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg1-13/igt@gem_exec_params@larger-than-life-batch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_exec_params@larger-than-life-batch.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk6/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@open-flood:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-8/igt@gem_mmap_offset@open-flood.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@gem_mmap_offset@open-flood.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_stress@stress-xrgb8888-ytiled} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a></li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_16107_full and IGTPW_12574_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@gem_exec_schedule@fifo@vecs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-cursor-legacy@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [6.08, 13.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>Statuses : 4 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 14.36] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12574_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#11078])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#11814] / [i915#11815] / [i915#9413])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@drm_fdinfo@all-busy-check-all.html">SKIP</a> ([i915#8414]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@bcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@drm_fdinfo@busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-2/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> ([i915#8414]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-1/igt@gem_caching@writes.html">SKIP</a> ([i915#4873]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> ([i915#13008])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_ccs@suspend-resume.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> ([i915#13356])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-4/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-2/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-1/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-snb1/igt@gem_ctx_persistence@legacy-engines-hang.html">SKIP</a> ([i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-internal-immediate:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@gem_eio@in-flight-internal-immediate.html">ABORT</a> ([i915#13193]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@gem_eio@kms.html">FAIL</a> ([i915#5784])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_eio@kms.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg1-17/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#12543] / [i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@wait-immediate:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-mtlp-8/igt@gem_eio@wait-immediate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@gem_eio@wait-immediate.html">ABORT</a> ([i915#13193])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-true-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-3/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> ([i915#4525]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk3/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-5/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@concurrent:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_exec_fence@concurrent.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> ([i915#3539])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@gem_exec_reloc@basic-concurrent0.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> ([i915#3281]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html">SKIP</a> ([i915#3281]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_exec_reloc@basic-write-cpu-active.html">SKIP</a> ([i915#3281])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> ([i915#11441] / [i915#13304]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#4860])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-1/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk1/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-2/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#4613]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-4/igt@gem_mmap_gtt@cpuset-medium-copy.html">SKIP</a> ([i915#4077]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@gem_mmap_gtt@fault-concurrent-x.html">SKIP</a> ([i915#4077]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@gem_mmap_wc@bad-size.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@gem_mmap_wc@write.html">SKIP</a> ([i915#4083]) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@gem_mmap_wc@write.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_mmap_wc@write-cpu-read-wc.html">SKIP</a> ([i915#4083]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@gem_partial_pwrite_pread@reads-display.html">SKIP</a> ([i915#3282]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@gem_partial_pwrite_pread@write.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html">TIMEOUT</a> ([i915#12917] / [i915#12964]) +2 other tests timeout</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> ([i915#13398])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> ([i915#13398]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-2.html">TIMEOUT</a> ([i915#12917] / [i915#12964])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#8428]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_render_copy@yf-tiled-ccs-to-linear.html">SKIP</a> ([i915#5190] / [i915#8428])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#4077]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-4/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-4/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk4/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-5/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gen3_render_tiledx_blits.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-2/igt@gen7_exec_parse@bitmasks.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@gen7_exec_parse@chained-batch.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-7/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2527] / [i915#2856]) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2527]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10887] / [i915#12817] / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#7178])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> ([i915#8399]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">WARN</a> ([i915#2681]) +4 other tests warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#11681] / [i915#6621]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@i915_pm_rps@thresholds-idle.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-2/igt@i915_selftest@live.html">DMESG-FAIL</a> ([i915#12964] / [i915#13550])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-3/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> ([i915#13550])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> ([i915#4212]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#12454] / [i915#12712])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-dp-3-4-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#5286]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#6187]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([i915#4538]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html">DMESG-WARN</a> ([i915#12964]) +34 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#6095]) +167 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-snb5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> ([i915#10307] / [i915#6095]) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> ([i915#6095]) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12805])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#6095]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#6095]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#6095]) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#6095]) +85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#6095]) +153 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> ([i915#11151] / [i915#7828]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> ([i915#11151] / [i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> ([i915#11151] / [i915#7828]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> ([i915#11151] / [i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> ([i915#11151] / [i915#7828]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([i915#11151] / [i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> ([i915#11151] / [i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_color@deep-color.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-3/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-6/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#9424])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_content_protection@type1.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7116] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#6944] / [i915#9424]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-3.html">FAIL</a> ([i915#1339] / [i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">DMESG-FAIL</a> ([i915#118]) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#13566]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#13566]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#13049]) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> ([i915#8814]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL</a> ([i915#13566]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#13566]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> ([i915#3555] / [i915#8814]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#13049]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> ([i915#13046] / [i915#5354]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([i915#13046] / [i915#5354]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([i915#9809]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk9/igt@kms_cursor_legacy@torture-move@pipe-a.html">DMESG-WARN</a> ([i915#1982]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9833])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9833])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#12402])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#12402])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#12402])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-8/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#12402])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-4/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> ([i915#12402])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk4/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#9878])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-1/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-4/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> ([i915#3637]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#3637]) +3 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> ([i915#9934]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> ([i915#9934]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> ([i915#4839])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-3/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> ([i915#3637]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> ([i915#9934]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> ([i915#9934]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">DMESG-WARN</a> ([i915#118]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#12745] / [i915#4839]) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> ([i915#12745]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg2-6/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-2/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> ([i915#11989]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-10/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">FAIL</a> ([i915#11989]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html">FAIL</a> ([i915#11989]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg1-18/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a4.html">FAIL</a> ([i915#11989]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#8813]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> ([i915#3555] / [i915#8810] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> ([i915#5354]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> ([i915#1825]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([i915#10055])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([i915#3023]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#1825]) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> ([i915#3458]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">SKIP</a> ([i915#3458]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-8/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> ([i915#12713])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> ([i915#12713])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> ([i915#10656])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-3/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([i915#10656])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> ([i915#12394])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> ([i915#13522])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-glk6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#12756])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max.html">FAIL</a> ([i915#10647] / [i915#12169])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#10647]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@kms_plane_lowres@tiling-4.html">SKIP</a> ([i915#10226] / [i915#11614] / [i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-7/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html">SKIP</a> ([i915#11614] / [i915#3582]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html">SKIP</a> ([i915#12247]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c.html">SKIP</a> ([i915#12247]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> ([i915#12247]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> ([i915#12247]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#9423])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-11/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-10/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> ([i915#9812])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> ([i915#3828])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> ([i915#12912])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3361])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#12916])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_pm_rpm@fences-dpms.html">SKIP</a> ([i915#4077]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16107/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-9/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-4/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#11520]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-2/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> ([i915#12316]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-snb5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-7/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#11520]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-9/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([i915#4348]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([i915#9683]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([i915#9683])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([i915#9683]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-3/igt@kms_psr@fbc-psr-cursor-render.html">SKIP</a> ([i915#9732]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-8/igt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> ([i915#1072] / [i915#9732]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-9/igt@kms_psr@fbc-psr-primary-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-glk9/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html">SKIP</a> +448 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-6/igt@kms_psr@pr-primary-mmap-cpu.html">SKIP</a> ([i915#9688]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> ([i915#9732]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-3/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> ([i915#1072] / [i915#9732]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> ([i915#5190]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> ([i915#3555] / [i915#5030] / [i915#9041])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> ([i915#5030]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-mtlp-8/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html">SKIP</a> ([i915#5030] / [i915#9041])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12574/shard-tglu-7/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#13179]) +1 other test abort</li>
<li>shard-mtlp:         NOTRUN -&gt; [ABOR</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1053112040922200654==--
