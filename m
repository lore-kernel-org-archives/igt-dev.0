Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093A8C43458
	for <igt-dev@archiver.kernel.org>; Sat, 11 Jul 2026 02:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8093310E2A6;
	Sat, 11 Jul 2026 02:52:57 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F7910E1DF;
 Sat, 11 Jul 2026 02:52:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2557561520605876119=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/xe=5Fexec=5F?=
 =?utf-8?q?multi=5Fqueue=3A_Check_PXP_is_rejected_on_multi-queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 11 Jul 2026 02:52:27 -0000
Message-ID: <178373834773.177358.5293534356523095870@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <4f88d137e4d769797789dae939455b918302793c.1783626314.git.jagmeet.randhawa@intel.com>
In-Reply-To: <4f88d137e4d769797789dae939455b918302793c.1783626314.git.jagmeet.randhawa@intel.com>
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

--===============2557561520605876119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_multi_queue: Check PXP is rejected on multi-queue
URL   : https://patchwork.freedesktop.org/series/170148/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18798_full -> IGTPW_15504_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15504_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15504_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15504_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@wide:
    - shard-dg1:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg1-17/igt@gem_exec_schedule@wide.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-14/igt@gem_exec_schedule@wide.html

  
New tests
---------

  New tests have been introduced between CI_DRM_18798_full and IGTPW_15504_full:

### New IGT tests (1) ###

  * igt@kms_rmfb@rmfb-ioctl@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  

Known issues
------------

  Here are the changes found in IGTPW_15504_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#11078] / [i915#14544])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-1:       NOTRUN -> [SKIP][4] ([i915#9323])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#13008] / [i915#14544])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][6] ([i915#13008])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-2/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][7] -> [INCOMPLETE][8] ([i915#13356] / [i915#16348])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#7697])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@gem_close_race@multigpu-basic-threads.html
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#7697])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#7697])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@gem_close_race@multigpu-basic-threads.html
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#7697])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@gem_close_race@multigpu-basic-threads.html
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#7697])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-3/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#8562])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@gem_create@create-ext-set-pat.html
    - shard-tglu-1:       NOTRUN -> [SKIP][15] ([i915#8562])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8555]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8555]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#8555]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@legacy-engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][19] ([i915#1099]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb4/igt@gem_ctx_persistence@legacy-engines-cleanup.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#280]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@kms:
    - shard-rkl:          [PASS][22] -> [DMESG-WARN][23] ([i915#13363])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-2/igt@gem_eio@kms.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@gem_eio@kms.html
    - shard-tglu:         [PASS][24] -> [DMESG-WARN][25] ([i915#13363])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-tglu-4/igt@gem_eio@kms.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@gem_eio@kms.html

  * igt@gem_eio@suspend:
    - shard-dg2:          [PASS][26] -> [ABORT][27] ([i915#15131])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-6/igt@gem_eio@suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@gem_eio@suspend.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#4771])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@gem_exec_balancer@bonded-dual.html
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4771])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@gem_exec_balancer@bonded-dual.html
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#4771])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4812]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@gem_exec_balancer@bonded-false-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4812]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@gem_exec_balancer@bonded-false-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4812]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#4525])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@gem_exec_balancer@parallel-balancer.html
    - shard-tglu-1:       NOTRUN -> [SKIP][35] ([i915#4525])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [PASS][36] -> [FAIL][37] ([i915#15816])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-tglu-7/igt@gem_exec_big@single.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu-1:       NOTRUN -> [SKIP][38] ([i915#6334]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3539])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@gem_exec_flush@basic-uc-set-default.html
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3539])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3281]) +8 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3281]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-wc-read-active:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#3281]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@gem_exec_reloc@basic-wc-read-active.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3281]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4537] / [i915#4812])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-7/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4860]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#4860]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#4860]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#4613] / [i915#7582])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#4613]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-glk:          NOTRUN -> [SKIP][51] ([i915#4613]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk1/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][52] ([i915#4613])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#14544] / [i915#4613])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4613])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#4613]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#284])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-7/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledx:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4077]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@gem_mmap_gtt@basic-small-bo-tiledx.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#4077]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@gem_mmap_gtt@basic-small-bo-tiledx.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4077]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-4/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4083])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@gem_mmap_wc@set-cache-level.html
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4083])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-16/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4083]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#3282])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@gem_partial_pwrite_pread@reads-display.html
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3282])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@gem_partial_pwrite_pread@reads-display.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3282])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-14/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#3282]) +10 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-glk11:        NOTRUN -> [WARN][67] ([i915#2658])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk11/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][68] ([i915#14702] / [i915#2658])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk8/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][69] ([i915#2658])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#4270])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4270])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-17/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#13398]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-2/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#13717])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#8428]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#5190] / [i915#8428]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4885])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#4885])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-4/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4885])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#3297] / [i915#3323])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][80] ([i915#3323])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3297]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap.html
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#3297])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [PASS][83] -> [INCOMPLETE][84] ([i915#13356] / [i915#14586])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-glk1/igt@gem_workarounds@suspend-resume-fd.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#2527]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-14/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#2527]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglu-1:       NOTRUN -> [SKIP][87] ([i915#2527] / [i915#2856]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#14544] / [i915#2527])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#2527] / [i915#2856]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@gen9_exec_parse@unaligned-jump.html
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#2856]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-7/igt@gen9_exec_parse@unaligned-jump.html
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#2856])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#11527]) +6 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-2/igt@i915_drm_fdinfo@busy-idle-check-all@rcs0.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@vcs0:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#11527]) +7 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@i915_drm_fdinfo@busy-idle-check-all@vcs0.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#11527]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@i915_drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@i915_drm_fdinfo@isolation@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#14073]) +7 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-7/igt@i915_drm_fdinfo@isolation@rcs0.html
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#14073]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@i915_drm_fdinfo@isolation@rcs0.html
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#14073]) +6 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-3/igt@i915_drm_fdinfo@isolation@rcs0.html

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#14118])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#14118])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-3/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-glk:          NOTRUN -> [ABORT][100] ([i915#15342]) +1 other test abort
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk2/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu-1:       NOTRUN -> [DMESG-WARN][101] ([i915#13029] / [i915#14545])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][102] ([i915#14545])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@i915_module_load@resize-bar.html
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#6412])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#7178])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@i915_module_load@resize-bar.html
    - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#6412])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@i915_module_load@resize-bar.html
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#6412])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#14544] / [i915#8399])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#6590]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-5/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][109] ([i915#13356])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk11/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [PASS][110] -> [INCOMPLETE][111] ([i915#13356] / [i915#15172])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk9/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#11681])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-6/igt@i915_pm_rps@thresholds-park.html
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#11681])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@i915_pm_rps@thresholds-park.html
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#11681])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-1/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#4387])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][116] -> [SKIP][117] ([i915#7984])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-mtlp-1/igt@i915_power@sanity.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][118] ([i915#6245])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@i915_query@hwconfig_table.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [PASS][119] -> [INCOMPLETE][120] ([i915#4817]) +1 other test incomplete
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][121] ([i915#14888]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglu:         [PASS][122] -> [FAIL][123] ([i915#15662]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-mtlp:         [PASS][124] -> [FAIL][125] ([i915#5956]) +1 other test fail
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#5286]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#4538] / [i915#5286])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#5286])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#5286]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#5286]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-mtlp:         [PASS][131] -> [FAIL][132] ([i915#15733] / [i915#5138])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#3638]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][134] +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#3638]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#5190])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#4538] / [i915#5190]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#6095]) +219 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#14098] / [i915#14544] / [i915#6095]) +5 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#14544] / [i915#6095]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#6095]) +14 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#6095]) +64 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][144] ([i915#6095]) +29 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#12313])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#12313]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#12313])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#12313])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#12313])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][150] +43 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][151] -> [INCOMPLETE][152] ([i915#15582])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][153] ([i915#15582]) +1 other test incomplete
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#6095]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#14098] / [i915#6095]) +45 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][156] -> [INCOMPLETE][157] ([i915#14694] / [i915#15582])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#12313]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#10307] / [i915#6095]) +149 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#6095]) +69 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#3742])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#13781]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#11151])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_chamelium_audio@dp-audio-after-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#11151])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu-1:       NOTRUN -> [SKIP][165] ([i915#11151] / [i915#7828]) +4 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#11151] / [i915#7828]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][167] +8 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#16471])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#16471]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#11151] / [i915#7828]) +7 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#11151] / [i915#7828]) +8 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#11151] / [i915#14544] / [i915#7828])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#11151] / [i915#7828]) +5 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#11151] / [i915#7828]) +8 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#15865]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-10/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][176] ([i915#7173])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-3.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#14544] / [i915#15330] / [i915#3116])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#15330] / [i915#3116] / [i915#3299])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#15330])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#15330]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#15865]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#15865])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#13049]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#13049])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#13049])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [PASS][186] -> [FAIL][187] ([i915#13566]) +1 other test fail
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-tglu-1:       NOTRUN -> [FAIL][188] ([i915#13566]) +3 other tests fail
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#8814])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][190] ([i915#13566]) +1 other test fail
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#13049]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#13049])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#13049])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#3555]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-max-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#3555] / [i915#8814])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#13046] / [i915#5354]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#9809])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][198] ([i915#4103])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#4103])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#4103]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#4103]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#16119] / [i915#4213]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#9067])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#9067])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu-1:       NOTRUN -> [SKIP][205] ([i915#9067])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#9067])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#9067])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#4103]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#14544] / [i915#4103])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#3804])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev@basic:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#1257])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#13749])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#13748]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#13748])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@kms_dp_link_training@uhbr-sst.html
    - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#13748])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-8/igt@kms_dp_link_training@uhbr-sst.html
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#13749])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_dp_link_training@uhbr-sst.html
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#13748])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#13707])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#13707])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#13707])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#13707])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#13707])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#13707])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#16361]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#16361]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-formats-ultrajoiner:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#16361]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_dsc@dsc-with-formats-ultrajoiner.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#16361]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@kms_dsc@dsc-with-formats-ultrajoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#16361]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-7/igt@kms_dsc@dsc-with-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#16361])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#3469])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#16081]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_feature_discovery@display-2x.html
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#16081]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-14/igt@kms_feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#16081]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_feature_discovery@display-2x.html
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#16081]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu-1:       NOTRUN -> [SKIP][235] ([i915#16081])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#16081])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#3637] / [i915#9934]) +6 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#9934])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#9934])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][240] ([i915#12314] / [i915#12745] / [i915#4839] / [i915#6113])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][241] ([i915#12314] / [i915#12745])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk5/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#14544] / [i915#9934])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#3637] / [i915#9934]) +7 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#9934]) +8 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#9934]) +4 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#3637] / [i915#9934]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#9934]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][248] -> [FAIL][249] ([i915#13027]) +1 other test fail
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][250] ([i915#16276] / [i915#6113]) +1 other test incomplete
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html
    - shard-glk10:        NOTRUN -> [INCOMPLETE][251] ([i915#12745] / [i915#4839])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk10/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][252] ([i915#12745])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk10/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#15643]) +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][254] ([i915#15643]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#15643])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#15643])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#15643]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#15643] / [i915#5190])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#15643]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#15104] / [i915#15990])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#15990] / [i915#8708]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#15990] / [i915#8708]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#15991] / [i915#5354]) +19 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#1825]) +5 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][265] ([i915#10056])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-dg2:          [PASS][266] -> [SKIP][267] ([i915#15989]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-glk:          [PASS][268] -> [SKIP][269] +7 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#15989]) +23 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][271] ([i915#15989]) +15 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#14544]) +9 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#15989]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          [PASS][274] -> [SKIP][275] ([i915#15989]) +8 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#15990] / [i915#8708]) +4 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#14544] / [i915#1825]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][278] +75 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][279] ([i915#15102]) +26 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#15102]) +50 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-render.html
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#15989]) +11 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#15102]) +22 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#15991]) +16 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#15990]) +15 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#5439])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#15990]) +10 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#15989]) +19 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#15989]) +7 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#15990] / [i915#4423])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][290] ([i915#16056])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk10/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#14544] / [i915#15102] / [i915#3023])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#15102] / [i915#3023]) +14 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][293] +102 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#15991] / [i915#1825]) +13 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#15102]) +19 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#15990]) +9 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#14544] / [i915#15102]) +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-glk11:        NOTRUN -> [SKIP][298] +68 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk11/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][299] +34 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][300] +102 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#15991]) +20 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#15102]) +14 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-mtlp:         [PASS][303] -> [SKIP][304] ([i915#15725])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-mtlp-5/igt@kms_hdmi_inject@inject-audio.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#3555] / [i915#8228]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#16518] / [i915#3555] / [i915#8228])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@kms_hdr@bpc-switch-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#3555] / [i915#8228])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [PASS][308] -> [SKIP][309] ([i915#16518] / [i915#3555] / [i915#8228])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#3555] / [i915#8228]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#15459])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][312] ([i915#15458])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#15460])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-9/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#15638] / [i915#15722])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][315] ([i915#12756] / [i915#13409] / [i915#13476]) +1 other test incomplete
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#15709]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#15709]) +3 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#14544] / [i915#15709])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#15709])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][320] ([i915#15709])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#15709]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][322] ([i915#16386]) +3 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#16386]) +3 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][324] ([i915#16386]) +5 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#15709]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#16386]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#16112])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
    - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#16112])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk11:        NOTRUN -> [FAIL][329] ([i915#12178])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [FAIL][330] ([i915#7862]) +1 other test fail
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#3555] / [i915#8821])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#3555]) +4 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_plane_lowres@tiling-yf.html
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#3555]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@kms_plane_lowres@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#3555]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@kms_plane_lowres@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#3555] / [i915#8821])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#13958])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-5/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#13958])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#15887] / [i915#9809])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#13046] / [i915#5354] / [i915#9423])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#6953] / [i915#9423])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#15329]) +9 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#15329] / [i915#6953])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#15329]) +3 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#12343] / [i915#5354])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#12343])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#12343] / [i915#9812])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#13441])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu-1:       NOTRUN -> [SKIP][348] ([i915#3828]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu-1:       NOTRUN -> [FAIL][349] ([i915#16479])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#15739])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#15739])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][352] -> [SKIP][353] ([i915#15073]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg1:          [PASS][354] -> [SKIP][355] ([i915#15073])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg1-13/igt@kms_pm_rpm@dpms-non-lpsp.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-14/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][356] -> [SKIP][357] ([i915#15073]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#15073])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu-1:       NOTRUN -> [SKIP][359] ([i915#15073])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#15073])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@package-g7:
    - shard-tglu-1:       NOTRUN -> [SKIP][361] ([i915#15403])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          NOTRUN -> [INCOMPLETE][362] ([i915#10553])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#6524])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][364] ([i915#6524] / [i915#6805])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#6524])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#11520]) +5 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][367] ([i915#11520]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-snb:          NOTRUN -> [SKIP][368] ([i915#11520]) +5 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][369] ([i915#11520]) +10 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][370] ([i915#11520]) +5 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-17/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#12316]) +7 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][372] ([i915#11520]) +9 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][373] ([i915#9808]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#11520] / [i915#14544]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-glk11:        NOTRUN -> [SKIP][375] ([i915#11520]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk11/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][376] ([i915#11520]) +7 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#9683])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#14544] / [i915#9683])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][379] ([i915#9683])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][380] ([i915#9683]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-dg2:          NOTRUN -> [SKIP][381] ([i915#1072] / [i915#9732]) +12 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_psr@fbc-psr-basic.html
    - shard-rkl:          NOTRUN -> [SKIP][382] ([i915#1072] / [i915#14544] / [i915#9732]) +5 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][383] +551 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk8/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@pr-sprite-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][384] ([i915#9732]) +20 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@kms_psr@pr-sprite-mmap-cpu.html
    - shard-mtlp:         NOTRUN -> [SKIP][385] ([i915#9688]) +6 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-2/igt@kms_psr@pr-sprite-mmap-cpu.html

  * igt@kms_psr@psr-cursor-render:
    - shard-rkl:          NOTRUN -> [SKIP][386] ([i915#1072] / [i915#9732]) +13 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][387] ([i915#9732]) +13 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][388] ([i915#1072] / [i915#9732]) +6 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-16/igt@kms_psr@psr2-sprite-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][389] ([i915#4077] / [i915#9688]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][390] ([i915#15949])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk:          NOTRUN -> [INCOMPLETE][391] ([i915#15492] / [i915#16184])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk9/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][392] ([i915#5289])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-dg1:          NOTRUN -> [SKIP][393] ([i915#5289])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][394] ([i915#5289]) +2 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][395] ([i915#12755] / [i915#15867] / [i915#5190])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-mtlp:         NOTRUN -> [SKIP][396] ([i915#12755] / [i915#15867])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][397] ([i915#5289])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][398] ([i915#13179]) +1 other test abort
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-tglu-1:       NOTRUN -> [SKIP][399] ([i915#3555]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu-1:       NOTRUN -> [SKIP][400] ([i915#8623])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk:          NOTRUN -> [FAIL][401] ([i915#10959])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [PASS][402] -> [ABORT][403] ([i915#15132])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][404] ([i915#12276]) +3 other tests incomplete
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [ABORT][405] ([i915#15132])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-2.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][406] ([i915#15243] / [i915#3555])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@max-min:
    - shard-tglu-1:       NOTRUN -> [SKIP][407] ([i915#9906])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_vrr@max-min.html

  * igt@perf_pmu@module-unload:
    - shard-glk:          NOTRUN -> [ABORT][408] ([i915#15778])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk1/igt@perf_pmu@module-unload.html
    - shard-rkl:          NOTRUN -> [ABORT][409] ([i915#15778])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-mtlp:         [PASS][410] -> [FAIL][411] ([i915#15997]) +1 other test fail
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          NOTRUN -> [SKIP][412] ([i915#8516])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@perf_pmu@rc6-all-gts.html
    - shard-tglu-1:       NOTRUN -> [SKIP][413] ([i915#8516])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [PASS][414] -> [INCOMPLETE][415] ([i915#13520])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-4/igt@perf_pmu@rc6-suspend.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][416] ([i915#8516])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_udl@share-import:
    - shard-tglu:         NOTRUN -> [SKIP][417] ([i915#16420]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@prime_udl@share-import.html

  * igt@prime_udl@share-import-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][418] ([i915#16420])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@prime_udl@share-import-addfb.html
    - shard-dg2:          NOTRUN -> [SKIP][419] ([i915#16420])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@prime_udl@share-import-addfb.html
    - shard-rkl:          NOTRUN -> [SKIP][420] ([i915#16420])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@prime_udl@share-import-addfb.html
    - shard-dg1:          NOTRUN -> [SKIP][421] ([i915#16420])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          NOTRUN -> [SKIP][422] ([i915#3708] / [i915#4077])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][423] ([i915#3291] / [i915#3708])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][424] ([i915#3291] / [i915#3708])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@prime_vgem@basic-write.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          NOTRUN -> [SKIP][425] ([i915#9917]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-1/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][426] ([i915#16066]) +19 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random.html

  * igt@sysfs_heartbeat_interval@precise:
    - shard-snb:          NOTRUN -> [SKIP][427] +216 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb1/igt@sysfs_heartbeat_interval@precise.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][428] ([i915#4818])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-snb:          [DMESG-WARN][429] ([i915#13390] / [i915#16358]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb6/igt@gem_eio@in-flight-suspend.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_big@single:
    - shard-mtlp:         [FAIL][431] ([i915#15871]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-mtlp-7/igt@gem_exec_big@single.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@gem_exec_big@single.html

  * igt@i915_module_load@load:
    - shard-snb:          ([PASS][433], [PASS][434], [PASS][435], [SKIP][436], [PASS][437], [PASS][438], [PASS][439], [PASS][440], [PASS][441], [PASS][442], [PASS][443], [PASS][444], [PASS][445], [PASS][446], [PASS][447], [PASS][448], [PASS][449], [PASS][450], [PASS][451], [PASS][452], [PASS][453], [PASS][454], [PASS][455], [PASS][456]) -> ([PASS][457], [PASS][458], [PASS][459], [PASS][460], [PASS][461], [PASS][462], [PASS][463], [PASS][464], [PASS][465], [PASS][466], [PASS][467], [PASS][468], [PASS][469], [PASS][470], [PASS][471], [PASS][472], [PASS][473], [PASS][474], [PASS][475], [PASS][476], [PASS][477], [PASS][478], [PASS][479], [PASS][480])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb6/igt@i915_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb1/igt@i915_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb6/igt@i915_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb4/igt@i915_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb6/igt@i915_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb1/igt@i915_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb5/igt@i915_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb1/igt@i915_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb5/igt@i915_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb6/igt@i915_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb1/igt@i915_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb6/igt@i915_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb6/igt@i915_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb5/igt@i915_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb4/igt@i915_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb7/igt@i915_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb7/igt@i915_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb4/igt@i915_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb5/igt@i915_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb7/igt@i915_module_load@load.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb4/igt@i915_module_load@load.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb5/igt@i915_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb7/igt@i915_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb7/igt@i915_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb5/igt@i915_module_load@load.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb7/igt@i915_module_load@load.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb5/igt@i915_module_load@load.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb4/igt@i915_module_load@load.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb4/igt@i915_module_load@load.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb7/igt@i915_module_load@load.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb5/igt@i915_module_load@load.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb1/igt@i915_module_load@load.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb6/igt@i915_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb4/igt@i915_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb5/igt@i915_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb7/igt@i915_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb6/igt@i915_module_load@load.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb1/igt@i915_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb5/igt@i915_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb1/igt@i915_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb6/igt@i915_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb1/igt@i915_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb6/igt@i915_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb4/igt@i915_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb1/igt@i915_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb5/igt@i915_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb1/igt@i915_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb6/igt@i915_module_load@load.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
    - shard-dg2:          [FAIL][481] ([i915#5956]) -> [PASS][482] +1 other test pass
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_color@degamma:
    - shard-dg1:          [DMESG-WARN][483] ([i915#4423]) -> [PASS][484]
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg1-16/igt@kms_color@degamma.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@kms_color@degamma.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-rkl:          [FAIL][485] ([i915#13566]) -> [PASS][486] +3 other tests pass
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_dp_aux_dev@basic:
    - shard-dg2:          [SKIP][487] ([i915#1257]) -> [PASS][488]
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-4/igt@kms_dp_aux_dev@basic.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_dp_aux_dev@basic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-snb:          [ABORT][489] ([i915#15840]) -> [PASS][490]
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb6/igt@kms_fbcon_fbt@fbc-suspend.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb7/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-tglu:         [ABORT][491] ([i915#15840]) -> [PASS][492]
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-tglu-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-rkl:          [INCOMPLETE][493] ([i915#9878]) -> [PASS][494]
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][495] ([i915#13027]) -> [PASS][496] +1 other test pass
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg1:          [FAIL][497] ([i915#13027]) -> [PASS][498]
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg1-12/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-mtlp:         [FAIL][499] ([i915#13027]) -> [PASS][500] +1 other test pass
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-mtlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][501] ([i915#15989]) -> [PASS][502] +6 other tests pass
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-blt.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][503] ([i915#15989]) -> [PASS][504] +9 other tests pass
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [SKIP][505] -> [PASS][506] +14 other tests pass
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-mtlp:         [SKIP][507] ([i915#15725]) -> [PASS][508]
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          [SKIP][509] ([i915#3555] / [i915#8228]) -> [PASS][510]
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-5/igt@kms_hdr@bpc-switch-dpms.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][511] ([i915#16518] / [i915#3555] / [i915#8228]) -> [PASS][512] +1 other test pass
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          [SKIP][513] ([i915#15073]) -> [PASS][514] +1 other test pass
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][515] ([i915#15073]) -> [PASS][516]
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [INCOMPLETE][517] ([i915#13356] / [i915#14242] / [i915#16236]) -> [PASS][518]
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-glk1/igt@perf_pmu@rc6-suspend.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk9/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          [SKIP][519] ([i915#14544] / [i915#8411]) -> [SKIP][520] ([i915#8411])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          [SKIP][521] ([i915#8411]) -> [SKIP][522] ([i915#14544] / [i915#8411])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-3/igt@api_intel_bb@blit-reloc-purge-cache.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-rkl:          [SKIP][523] ([i915#11078] / [i915#14544]) -> [SKIP][524] ([i915#11078])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@device_reset@cold-reset-bound.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@device_reset@cold-reset-bound.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][525] ([i915#9323]) -> [SKIP][526] ([i915#14544] / [i915#9323])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          [SKIP][527] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][528] ([i915#3555] / [i915#9323])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][529] ([i915#3555] / [i915#9323]) -> [SKIP][530] ([i915#14544] / [i915#3555] / [i915#9323])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          [SKIP][531] ([i915#4525]) -> [SKIP][532] ([i915#14544] / [i915#4525])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-4/igt@gem_exec_balancer@parallel-ordering.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-rkl:          [SKIP][533] ([i915#14544] / [i915#3281]) -> [SKIP][534] ([i915#3281]) +4 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [SKIP][535] ([i915#3281]) -> [SKIP][536] ([i915#14544] / [i915#3281]) +3 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          [SKIP][537] ([i915#4613]) -> [SKIP][538] ([i915#14544] / [i915#4613])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-2/igt@gem_lmem_swapping@heavy-multi.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-rkl:          [SKIP][539] ([i915#14544] / [i915#4613]) -> [SKIP][540] ([i915#4613])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_pwrite@basic-random:
    - shard-rkl:          [SKIP][541] ([i915#14544] / [i915#3282]) -> [SKIP][542] ([i915#3282])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@gem_pwrite@basic-random.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@gem_pwrite@basic-random.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          [SKIP][543] ([i915#3282]) -> [SKIP][544] ([i915#14544] / [i915#3282])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-2/igt@gem_pwrite@basic-self.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gem_pwrite@basic-self.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          [SKIP][545] ([i915#3297]) -> [SKIP][546] ([i915#14544] / [i915#3297])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-7/igt@gem_userptr_blits@coherency-sync.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          [SKIP][547] ([i915#14544] / [i915#3297]) -> [SKIP][548] ([i915#3297])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          [SKIP][549] ([i915#14544] / [i915#2527]) -> [SKIP][550] ([i915#2527]) +1 other test skip
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          [SKIP][551] ([i915#2527]) -> [SKIP][552] ([i915#14544] / [i915#2527])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][553] ([i915#13356] / [i915#13820]) -> [ABORT][554] ([i915#15131]) +1 other test abort
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          [SKIP][555] ([i915#14498] / [i915#14544]) -> [SKIP][556] ([i915#14498])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          [SKIP][557] ([i915#14544] / [i915#6245]) -> [SKIP][558] ([i915#6245])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@i915_query@hwconfig_table.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-unsupported:
    - shard-rkl:          [SKIP][559] ([i915#16079]) -> [SKIP][560] ([i915#14544] / [i915#16079])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-5/igt@i915_query@query-topology-unsupported.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@i915_query@query-topology-unsupported.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-rkl:          [SKIP][561] ([i915#14544] / [i915#5286]) -> [SKIP][562] ([i915#5286]) +1 other test skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [SKIP][563] ([i915#5286]) -> [SKIP][564] ([i915#14544] / [i915#5286]) +1 other test skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][565] ([i915#3828]) -> [SKIP][566] ([i915#14544] / [i915#3828])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][567] ([i915#14544] / [i915#3638]) -> [SKIP][568] ([i915#3638])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][569] ([i915#14098] / [i915#6095]) -> [SKIP][570] ([i915#14098] / [i915#14544] / [i915#6095]) +9 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-rkl:          [SKIP][571] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][572] ([i915#14098] / [i915#6095]) +5 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][573] ([i915#14544] / [i915#6095]) -> [SKIP][574] ([i915#6095]) +3 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][575] ([i915#6095]) -> [SKIP][576] ([i915#14544] / [i915#6095]) +7 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-glk:          [INCOMPLETE][577] ([i915#14694] / [i915#15582]) -> [INCOMPLETE][578] ([i915#15582])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          [INCOMPLETE][579] ([i915#15582]) -> [INCOMPLETE][580] ([i915#14694] / [i915#15582])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][581] ([i915#12313] / [i915#14544]) -> [SKIP][582] ([i915#12313])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          [SKIP][583] ([i915#3742]) -> [SKIP][584] ([i915#14544] / [i915#3742])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-rkl:          [SKIP][585] ([i915#11151]) -> [SKIP][586] ([i915#11151] / [i915#14544])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-rkl:          [SKIP][587] ([i915#14544] / [i915#16471]) -> [SKIP][588] ([i915#16471])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-rkl:          [SKIP][589] ([i915#16471]) -> [SKIP][590] ([i915#14544] / [i915#16471]) +1 other test skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-rkl:          [SKIP][591] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][592] ([i915#11151] / [i915#7828]) +3 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          [SKIP][593] ([i915#11151] / [i915#7828]) -> [SKIP][594] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-dg2:          [SKIP][595] ([i915#15865]) -> [FAIL][596] ([i915#7173])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-1/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-rkl:          [SKIP][597] ([i915#14544] / [i915#15865]) -> [SKIP][598] ([i915#15865]) +1 other test skip
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][599] ([i915#15865]) -> [SKIP][600] ([i915#14544] / [i915#15865])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-7/igt@kms_content_protection@mei-interface.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          [SKIP][601] ([i915#13049] / [i915#3359]) -> [SKIP][602] ([i915#13049])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          [SKIP][603] ([i915#14544] / [i915#3555]) -> [SKIP][604] ([i915#3555]) +1 other test skip
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          [SKIP][605] ([i915#13049]) -> [SKIP][606] ([i915#13049] / [i915#14544]) +1 other test skip
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x170.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][607] -> [SKIP][608] ([i915#14544]) +35 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          [SKIP][609] ([i915#16361]) -> [SKIP][610] ([i915#14544] / [i915#16361])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-7/igt@kms_dsc@dsc-with-bpc-formats.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-rkl:          [SKIP][611] ([i915#14544] / [i915#16361]) -> [SKIP][612] ([i915#16361]) +1 other test skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg1:          [SKIP][613] ([i915#4423] / [i915#9934]) -> [SKIP][614] ([i915#9934])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg1-16/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-16/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-rkl:          [SKIP][615] ([i915#9934]) -> [SKIP][616] ([i915#14544] / [i915#9934]) +2 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-5/igt@kms_flip@2x-flip-vs-modeset.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-rkl:          [SKIP][617] ([i915#14544] / [i915#9934]) -> [SKIP][618] ([i915#9934]) +1 other test skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          [SKIP][619] ([i915#5439]) -> [SKIP][620] ([i915#14544] / [i915#5439])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg1:          [SKIP][621] ([i915#15989] / [i915#4423]) -> [SKIP][622] ([i915#15989])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg1-13/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg1:          [SKIP][623] ([i915#15102]) -> [SKIP][624] ([i915#15102] / [i915#4423])
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][625] ([i915#1825]) -> [SKIP][626] ([i915#14544] / [i915#1825]) +2 other tests skip
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][627] ([i915#14544] / [i915#1825]) -> [SKIP][628] ([i915#1825])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
    - shard-rkl:          [SKIP][629] ([i915#15102] / [i915#3023]) -> [SKIP][630] ([i915#14544] / [i915#15102] / [i915#3023]) +5 other tests skip
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-rkl:          [SKIP][631] ([i915#15102]) -> [SKIP][632] ([i915#14544] / [i915#15102]) +8 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-pwrite:
    - shard-rkl:          [SKIP][633] ([i915#14544] / [i915#15102]) -> [SKIP][634] ([i915#15102]) +5 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-pwrite.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg1:          [SKIP][635] ([i915#4423]) -> [SKIP][636] +3 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg1-13/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-cpu.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][637] ([i915#15102]) -> [SKIP][638] ([i915#10433] / [i915#15102]) +3 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][639] ([i915#10433] / [i915#15102]) -> [SKIP][640] ([i915#15102]) +4 other tests skip
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg1:          [SKIP][641] -> [SKIP][642] ([i915#4423])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-rkl:          [SKIP][643] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][644] ([i915#15102] / [i915#3023]) +5 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][645] ([i915#14544]) -> [SKIP][646] +28 other tests skip
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          [INCOMPLETE][647] ([i915#15436]) -> [SKIP][648] ([i915#3555] / [i915#8228])
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-rkl:          [SKIP][649] ([i915#16451]) -> [SKIP][650] ([i915#14544] / [i915#16451])
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-8/igt@kms_mst@mst-suspend-read-crc.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-rkl:          [SKIP][651] ([i915#14712]) -> [SKIP][652] ([i915#14544] / [i915#14712])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][653] ([i915#14544] / [i915#15709]) -> [SKIP][654] ([i915#15709]) +1 other test skip
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-rkl:          [SKIP][655] ([i915#15709]) -> [SKIP][656] ([i915#14544] / [i915#15709]) +1 other test skip
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-rkl:          [SKIP][657] ([i915#3555]) -> [SKIP][658] ([i915#14544] / [i915#3555])
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-7/igt@kms_plane_lowres@tiling-4.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          [SKIP][659] ([i915#14259] / [i915#14544]) -> [SKIP][660] ([i915#14259])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][661] ([i915#15329]) -> [SKIP][662] ([i915#14544] / [i915#15329]) +3 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][663] ([i915#9340]) -> [SKIP][664] ([i915#3828])
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][665] ([i915#11520] / [i915#14544]) -> [SKIP][666] ([i915#11520]) +1 other test skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-rkl:          [SKIP][667] ([i915#11520]) -> [SKIP][668] ([i915#11520] / [i915#14544]) +1 other test skip
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          [SKIP][669] ([i915#14544] / [i915#9683]) -> [SKIP][670] ([i915#9683])
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-cursor-mmap-cpu:
    - shard-rkl:          [SKIP][671] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][672] ([i915#1072] / [i915#9732]) +3 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-mmap-cpu.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_psr@fbc-psr-cursor-mmap-cpu.html

  * igt@kms_psr@pr-cursor-render:
    - shard-rkl:          [SKIP][673] ([i915#1072] / [i915#9732]) -> [SKIP][674] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-2/igt@kms_psr@pr-cursor-render.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-rkl:          [SKIP][675] ([i915#15949]) -> [SKIP][676] ([i915#14544] / [i915#15949])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          [SKIP][677] ([i915#12755] / [i915#15867]) -> [SKIP][678] ([i915#15867]) +2 other tests skip
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          [SKIP][679] ([i915#15867]) -> [SKIP][680] ([i915#12755] / [i915#15867])
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-90.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          [SKIP][681] ([i915#12755] / [i915#15867] / [i915#5190]) -> [SKIP][682] ([i915#15867] / [i915#5190])
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          [SKIP][683] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][684] ([i915#15243] / [i915#3555])
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_vrr@flip-dpms.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          [SKIP][685] ([i915#9906]) -> [SKIP][686] ([i915#4423] / [i915#9906])
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg1-14/igt@kms_vrr@max-min.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          [SKIP][687] ([i915#14544] / [i915#9906]) -> [SKIP][688] ([i915#9906])
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][689] ([i915#14544] / [i915#2436]) -> [SKIP][690] ([i915#2436])
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          [ABORT][691] ([i915#13029] / [i915#15778]) -> [ABORT][692] ([i915#15778])
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg2-6/igt@perf_pmu@module-unload.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@perf_pmu@module-unload.html
    - shard-dg1:          [ABORT][693] ([i915#13029] / [i915#15778]) -> [ABORT][694] ([i915#15778])
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-dg1-15/igt@perf_pmu@module-unload.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@perf_pmu@module-unload.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871
  [i915#15887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15887
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#15997]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15997
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16066]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16358
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8997 -> IGTPW_15504
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_18798: e6db87755f42426899dd6ca45f97eb1b98e2f9fc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15504: 535da2d9ed8be27b85bf18463e6cb8f4482c953b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8997: 8997
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/index.html

--===============2557561520605876119==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_multi_queue: Check PXP i=
s rejected on multi-queue</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/170148/">https://patchwork.freedesktop.org/series/170148/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15504/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15504/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18798_full -&gt; IGTPW_15504_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15504_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_15504_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/index=
.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1550=
4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_schedule@wide:<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg1-17/igt@gem_exec_schedule@wide.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-1=
4/igt@gem_exec_schedule@wide.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_18798_full and IGTPW_15504=
_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_rmfb@rmfb-ioctl@pipe-b-hdmi-a-2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15504_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@device_reset@unbind-cold-reset-re=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13008">i915#13008</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-2/igt@gem_ccs@large-ctrl-surf-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-comp=
fmt0-smem-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-com=
pressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#163=
48</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-3/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@gem_create@create-ext-set-pat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8562">i915#8562</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@gem_create@create-ext-set-pat.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8555">i915#8555</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-snb4/igt@gem_ctx_persistence@legacy-engines=
-cleanup.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@gem_ctx_sseu@engines.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280"=
>i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@gem_ctx_sseu@invalid-sseu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-2/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@gem_eio=
@kms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13363">i915#13363</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-tglu-4/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@gem_e=
io@kms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-6/igt@gem_eio@suspend.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@g=
em_eio@suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@gem_exec_balancer@bonded-dual.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@gem_exec_balancer@bonded-dual.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@gem_exec_balancer@bonded-dual.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@gem_exec_balancer@bonded-false-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@gem_exec_balancer@bonded-false-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@gem_exec_balancer@bonded-false-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@gem_exec_balancer@parallel-balanc=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4525">i915#4525</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@gem_exec_balancer@parallel-balan=
cer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-tglu-7/igt@gem_exec_big@single.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-tglu-7/i=
gt@gem_exec_big@single.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@gem_exec_capture@capture-invisib=
le@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@gem_exec_flush@basic-uc-set-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@gem_exec_flush@basic-uc-set-defa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@gem_exec_reloc@basic-wc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@gem_exec_reloc@basic-wc-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@gem_exec_reloc@basic-wc-read-act=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@gem_exec_reloc@basic-write-cpu-a=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-7/igt@gem_exec_schedule@reorder-wide.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@gem_fenced_exec_thrash@no-spare-f=
ences-busy-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</l=
i>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@gem_fenced_exec_thrash@no-spare-=
fences-busy-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@gem_fenced_exec_thrash@too-many-=
fences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-ra=
ndom-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk1/igt@gem_lmem_swapping@massive-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4613">i915#4613</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@gem_lmem_swapping@parallel-rando=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gem_lmem_swapping@parallel-random=
-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-2/igt@gem_lmem_swapping@parallel-rando=
m-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-7/igt@gem_media_vme.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#2=
84</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo-tiledx:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@gem_mmap_gtt@basic-small-bo-tiled=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4077">i915#4077</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@gem_mmap_gtt@basic-small-bo-tile=
dx.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-4/igt@gem_mmap_gtt@cpuset-medium-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@gem_mmap_wc@set-cache-level.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4083">i915#4083</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-16/igt@gem_mmap_wc@set-cache-level.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@gem_mmap_wc@write-wc-read-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@gem_partial_pwrite_pread@reads-d=
isplay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@gem_partial_pwrite_pread@reads-d=
isplay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-14/igt@gem_partial_pwrite_pread@reads-d=
isplay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3282">i915#3282</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk11/igt@gem_pread@exhaustion.html">WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658=
">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk8/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14702">i915#14702</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2658">i915#2658</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@gem_pwrite@basic-exhaustion.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@gem_pxp@dmabuf-shared-protected-d=
st-is-context-refcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-17/igt@gem_pxp@dmabuf-shared-protected-=
dst-is-context-refcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-2/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13398">i915#13398</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-3/igt@gem_render_copy@y-tiled-mc-ccs-t=
o-vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@gem_render_copy@y-tiled-to-vebox=
-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-4/igt@gem_softpin@evict-snoop.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4885">i915#4885</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@gem_softpin@evict-snoop.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-glk1/igt@gem_workarounds@suspend-resume-fd.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/sh=
ard-glk4/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13=
356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-14/igt@gen9_exec_parse@batch-invalid-le=
ngth.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@gen9_exec_parse@bb-secure.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@gen9_exec_parse@bb-start-param.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@gen9_exec_parse@unaligned-jump.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-7/igt@gen9_exec_parse@unaligned-jump.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2856">i915#2856</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@gen9_exec_parse@unaligned-jump.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-2/igt@i915_drm_fdinfo@busy-idle-check-=
all@rcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11527">i915#11527</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@i915_drm_fdinfo@busy-idle-check-a=
ll@vcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@i915_drm_fdinfo@busy-idle-check-=
all@vcs1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11527">i915#11527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-7/igt@i915_drm_fdinfo@isolation@rcs0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14073">i915#14073</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@i915_drm_fdinfo@isolation@rcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-3/igt@i915_drm_fdinfo@isolation@rcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@i915_drm_fdinfo@virtual-busy-han=
g-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14118">i915#14118</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-3/igt@i915_drm_fdinfo@virtual-busy-han=
g-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk2/igt@i915_module_load@fault-injection@i=
ntel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort=
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@i915_module_load@reload-no-displ=
ay.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13029">i915#13029</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@i915_module_load@resize-bar.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14545">i915#14545</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@i915_module_load@resize-bar.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6412">i915#6412</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7178">i915#7178</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6412">i915#6412</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-5/igt@i915_pm_freq_mult@media-freq@gt0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk11/igt@i915_pm_rpm@system-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/s=
hard-glk9/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15172">i915#15172</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-6/igt@i915_pm_rps@thresholds-park.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11681">i915#11681</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@i915_pm_rps@thresholds-park.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-1/igt@i915_pm_rps@thresholds-park.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@i915_pm_sseu@full-enable.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-mtlp-1/igt@i915_power@sanity.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt=
@i915_power@sanity.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@i915_query@hwconfig_table.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/=
shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915=
#4817</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk10/igt@kms_async_flips@alternate-sync-as=
ync-flip-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +1 other tes=
t fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-tglu-6/igt@kms_atomic_transition@plane-all-modeset-tran=
sition-fencing.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15504/shard-tglu-2/igt@kms_atomic_transition@plane-all-m=
odeset-transition-fencing.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15662">i915#15662</a>) +1 other test fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-tran=
sition-fencing-internal-panels.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_atomic_transi=
tion@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i91=
5#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@kms_big_fb@4-tiled-32bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@kms_big_fb@4-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-strid=
e-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_15504/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64b=
pp-rotate-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_big_fb@linear-16bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_big_fb@x-tiled-32bpp-rotate-=
90.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@kms_big_fb@x-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-off=
set-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +219 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mt=
l-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915=
#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-=
mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-=
dg2-mc-ccs@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-d=
g2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +64 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-dg2-rc-ccs.html">SKIP</a> +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a=
-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_15504/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@=
pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incom=
plete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +45 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-=
a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15504/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-cc=
s@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-=
mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-8/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b=
-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_chamelium_audio@dp-audio-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_chamelium_audio@dp-audio-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio-e=
did.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@kms_chamelium_color@degamma.html"=
>SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_chamelium_color_pipeline@pla=
ne-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_chamelium_edid@vga-edid-read.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_chamelium_frames@hdmi-cmp-pla=
nar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd-enabl=
e-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-2/igt@kms_chamelium_hpd@hdmi-hpd-with-=
enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-10/igt@kms_content_protection@atomic-d=
pms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_content_protection@atomic-dp=
ms-hdcp14@pipe-a-dp-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_content_protection@dp-mst-lic=
-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_content_protection@dp-mst-li=
c-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_content_protection@dp-mst-typ=
e-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_content_protection@dp-mst-ty=
pe-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15330">i915#15330</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@kms_content_protection@uevent-hdc=
p14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@kms_cursor_crc@cursor-offscreen-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_155=
04/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i91=
5#13566</a>) +1 other test fail</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-1=
28x42.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-2=
56x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-25=
6x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-max=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@kms_cursor_legacy@2x-cursor-vs-fl=
ip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</=
li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_cursor_legacy@2x-cursor-vs-f=
lip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test ski=
p</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test ski=
p</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-4/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_dp_aux_dev@basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/125=
7">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_dp_link_training@uhbr-sst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-8/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13749">i915#13749</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@kms_dp_link_training@uhbr-sst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_dp_linktrain_fallback@dsc-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_dp_linktrain_fallback@dsc-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-7/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_dsc@dsc-basic-ultrajoiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_dsc@dsc-with-formats-ultrajoi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16361">i915#16361</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@kms_dsc@dsc-with-formats-ultrajo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-7/igt@kms_dsc@dsc-with-formats-ultrajo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-=
ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_feature_discovery@display-2x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16081">i915#16081</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-14/igt@kms_feature_discovery@display-2x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_feature_discovery@display-2x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_feature_discovery@display-2x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_feature_discovery@display-4x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk5/igt@kms_flip@2x-flip-vs-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk5/igt@kms_flip@2x-flip-vs-suspend@ac-hdm=
i-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_flip@2x-flip-vs-wf_vblank-int=
erruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_flip@2x-plain-flip-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-7/igt@kms_flip@2x-single-buffer-flip-vs=
-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_15504/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16276">i915#16276</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6113">i915#6113</a>) +1 other test incomplete</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk10/igt@kms_flip@flip-vs-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk10/igt@kms_flip@flip-vs-suspend@a-hdmi-a=
1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_flip_scaled_crc@flip-p010-4ti=
le-to-p016-4tile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-o=
ffscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +19=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen=
-pri-shrfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_frontbuffer_tracking@f=
bchdr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cu=
r-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_15504/shard-glk2/igt@kms_frontbuffer_tracking@fbc=
hdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +23 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-=
1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2=
p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-=
stridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15989">i915#15989</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_15504/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +75 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-rende=
r:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +50 ot=
her tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +22 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +16 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +15 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-1p-=
offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +19 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-2p-=
scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk10/igt@kms_frontbuffer_tracking@hdr-susp=
end.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16056">i915#16056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023"=
>i915#3023</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +14 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +102 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)=
 +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indf=
b-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-=
1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +9 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-pwrite:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1=
p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk11/igt@kms_frontbuffer_tracking@psrhdr-1=
p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-=
2p-primscrn-spr-indfb-onoff.html">SKIP</a> +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-2=
p-scndscrn-cur-indfb-move.html">SKIP</a> +102 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-=
2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +20 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@kms_frontbuffer_tracking@psrhdr-=
rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-mtlp-5/igt@kms_hdmi_inject@inject-audio.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard=
-mtlp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@kms_hdr@bpc-switch-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16518">i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/sha=
rd-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-1/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-9/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-cr=
c@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915=
#13476</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@kms_plane@pixel-format-4-tiled-d=
g2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mt=
l-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#157=
09</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-12/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-g=
en12-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_plane@pixel-format-y-tiled-ge=
n12-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:=
</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other=
 tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_plane@pixel-format-y-tiled-ge=
n12-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_plane@pixel-format-y-tiled-m=
odifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-7/igt@kms_plane@pixel-format-y-tiled-m=
odifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_plane@planar-pixel-format-set=
tings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_plane@planar-pixel-format-se=
ttings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic=
@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8821">i915#8821</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_plane_lowres@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_plane_lowres@tiling-yf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-5/igt@kms_plane_multiple@2x-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_plane_scaling@2x-scaler-mult=
i-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15887">i915#15887</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@kms_plane_scaling@2x-scaler-multi=
-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5354">i915#5354</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-2/igt@kms_plane_scaling@plane-upscale-=
20x20-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-3/igt@kms_pm_backlight@basic-brightness=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-5/igt@kms_pm_backlight@fade-with-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@kms_pm_dc@dc5-dpms-negative.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13441">i915#13441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479=
">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739"=
>i915#15739</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739=
">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-6/ig=
t@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg1-13/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1=
-14/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shar=
d-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15073">i915#15073</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_pm_rpm@package-g7.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk6/igt@kms_pm_rpm@system-suspend-modeset.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10553">i915#10553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_prime@basic-crc-vgem.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6524">i915#6524</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other test=
s skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tes=
ts skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-snb4/igt@kms_psr2_sf@fbc-pr-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk4/igt@kms_psr2_sf@fbc-pr-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-17/igt@kms_psr2_sf@fbc-pr-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a=
>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-prim=
ary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk11/igt@kms_psr2_sf@pr-cursor-plane-updat=
e-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@kms_psr2_sf@pr-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_psr2_su@page_flip-nv12.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-8/igt@kms_psr2_su@page_flip-p010.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_psr@fbc-psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/107=
2">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_psr@fbc-psr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/107=
2">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk8/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.h=
tml">SKIP</a> +551 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-3/igt@kms_psr@pr-sprite-mmap-cpu.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9732">i915#9732</a>) +20 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-2/igt@kms_psr@pr-sprite-mmap-cpu.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9688">i915#9688</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_psr@psr-cursor-render.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) +13 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-16/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-5/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4077">i915#4077</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk9/igt@kms_rotation_crc@multiplane-rotati=
on.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15492">i915#15492</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-19/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-5/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</=
li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-2/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-6/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk8/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10959">i915#10959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
5504/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132=
">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk5/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +3 other tests i=
ncomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-s=
uspend@pipe-c-hdmi-a-2.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_vrr@flip-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1524=
3">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i9=
15#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-glk1/igt@perf_pmu@module-unload.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
778">i915#15778</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@perf_pmu@module-unload.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5778">i915#15778</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/=
shard-mtlp-1/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15997">i915#159=
97</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@perf_pmu@rc6-all-gts.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516=
">i915#8516</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/851=
6">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-4/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/ig=
t@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-1/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-4/igt@prime_udl@share-import.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
6420">i915#16420</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-mtlp-8/igt@prime_udl@share-import-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16420">i915#16420</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@prime_udl@share-import-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16420">i915#16420</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@prime_udl@share-import-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16420">i915#16420</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg1-13/igt@prime_udl@share-import-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@prime_vgem@basic-fence-mmap.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-5/igt@prime_vgem@basic-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/329=
1">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@prime_vgem@basic-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
91">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-1/igt@sriov_basic@bind-unbind-vf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9917">i915#9917</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe=
-off@numvfs-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16066">i915#16066</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-snb1/igt@sysfs_heartbeat_interval@precise.h=
tml">SKIP</a> +216 other tests skip</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-snb6/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390"=
>i915#13390</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16358">i915#16358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_15504/shard-snb1/igt@gem_eio@in-flight-suspend.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-mtlp-7/igt@gem_exec_big@single.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871">i915#158=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_155=
04/shard-mtlp-6/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-snb:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18798/shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb1/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18798/shard-snb6/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-=
snb4/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb6/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
8798/shard-snb1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb5/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_18798/shard-snb1/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb5/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18798/shard-snb6/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard=
-snb1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb6/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
18798/shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb5/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18798/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb7/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18798/shard-snb7/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shar=
d-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb5/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_18798/shard-snb7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb4/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_18798/shard-snb5/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18798/shard-snb7/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_18798/shard-snb7/igt@i915_module_load@load.html">PAS=
S</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_155=
04/shard-snb5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb7/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_15504/shard-snb5/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb4/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15504/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb7/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_15504/shard-snb5/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/sha=
rd-snb1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb6/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
15504/shard-snb4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb5/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15504/shard-snb7/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb6/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_15504/shard-snb1/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb=
5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_15504/shard-snb1/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/=
shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb1/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_15504/shard-snb6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb4/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_15504/shard-snb1/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-snb5/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_15504/shard-snb1/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-=
snb6/igt@i915_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-trans=
ition@pipe-a-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-6/igt@kms_atomic_tr=
ansition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html">PASS</a> +1 oth=
er test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg1-16/igt@kms_color@degamma.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4=
423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15=
504/shard-dg1-12/igt@kms_color@degamma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_15504/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42.html=
">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-4/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504=
/shard-dg2-10/igt@kms_dp_aux_dev@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-snb6/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915=
#15840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_15504/shard-snb7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-tglu-5/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i9=
15#15840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_15504/shard-tglu-3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878"=
>i915#9878</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_15504/shard-rkl-2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027"=
>i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_15504/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg1-12/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-mtlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_15504/shard-mtlp-4/igt@kms_flip@flip-vs-expire=
d-vblank-interruptible@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-=
shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_frontbuffer_t=
racking@hdr-1p-primscrn-pri-shrfb-draw-blt.html">PASS</a> +6 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffe=
r_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> +9 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-i=
ndfb-draw-mmap-cpu.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_15504/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p=
-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i91=
5#15725</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_15504/shard-mtlp-6/igt@kms_hdmi_inject@inject-4k.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-5/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15504/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">=
i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_hdr@static-togg=
le-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#=
15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
15504/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i9=
15#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_15504/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-glk1/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915=
#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14242">i915#14242</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16236">i915#16236</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk9/igt@perf_pmu@rc6-suspend.=
html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-=
cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-3/igt@api_intel_bb@blit-reloc-purge-cache.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15504/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@device_reset@cold-reset-bound.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">=
i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@device_reset@cold-reset-bound.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/93=
23">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_15504/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@gem_ccs@block-mult=
icopy-inplace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_15504/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-4/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15504/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_15504/shard-rkl-7/igt@gem_exec_reloc@basic-softpin.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"=
>i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_15504/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-2/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i=
915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_15504/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@gem_lmem_swapping@heavy-random.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@gem_pwrite@basic-random.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_15504/shard-rkl-8/igt@gem_pwrite@basic-random.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i9=
15#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-2/igt@gem_pwrite@basic-self.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504=
/shard-rkl-6/igt@gem_pwrite@basic-self.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3=
282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-7/igt@gem_userptr_blits@coherency-sync.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297=
">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_15504/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@gem_userptr_blits@unsync-u=
nmap-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@gen9_exec_parse@bb-start-param.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527"=
>i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_15504/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13820">i915#13820</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@i915_pm_freq_api@freq=
-suspend@gt0.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15131">i915#15131</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498"=
>i915#14498</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6245">i915#6245</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15504/shard-rkl-4/igt@i915_query@hwconfig_table.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245=
">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-5/igt@i915_query@query-topology-unsupported.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16079">i915#16079</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_15504/shard-rkl-6/igt@i915_query@query-topology-unsupported.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_big_fb@4-ti=
led-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_big_fb@linear-max-hw-=
stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-c=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_ccs@bad-pixel=
-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_c=
cs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pi=
pe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_c=
cs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_ccs@ccs-on-anot=
her-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i91=
5#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14694">i915#14694</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-glk2/igt@kms_ccs@crc-primar=
y-suspend-y-tiled-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_15504/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14694">i915#14694</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_ccs@random-ccs-dat=
a-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3742">i915#3742</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15504/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut=
1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-7/igt@kms_chamelium_=
color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-=
ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16471">i915#16471</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_chamelium_color_pipeli=
ne@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@=
kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/782=
8">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_chamelium_hpd@vga-hp=
d-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>=
) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-1/igt@kms_content_protection@atomic-dpms-hdcp14.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_content_protection@atomic-dpms-=
hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_content_protection@le=
gacy-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-7/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_15504/shard-rkl-6/igt@kms_content_protection@mei-interface.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3359">i915#3359</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-8/igt@kms_cursor_crc@cursor-on=
screen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_cursor_crc@cursor-on=
screen-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x170.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_15504/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.htm=
l">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_15504/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i=
915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_15504/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@kms_dsc@dsc=
-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg1-16/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-16/igt@kms_flip@2x=
-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-5/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i91=
5#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_15504/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_flip@2x-flip-vs-wf_vblank.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg1-13/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen=
-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15989">i915#15989</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-12/ig=
t@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-blt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:<=
/p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen=
-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@kms_front=
buffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i9=
15#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbuff=
er_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-5/i=
gt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-=
mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontb=
uffer_tracking@fbcpsr-farfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">=
i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3023">i915#3023</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscre=
en-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_frontbu=
ffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15102">i915#15102</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-dra=
w-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-rgb565-draw-pwrite.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg1-13/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur=
-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg1-16/igt@kms_frontbuff=
er_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-=
indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-4/igt@kms_frontbuff=
er_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#104=
33</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15102">i915#15102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_f=
rontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri=
-indfb-draw-render.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_15504/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/i=
gt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#1=
5102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3023">i915#3023</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_frontbu=
ffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +28 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5436">i915#15436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_15504/shard-rkl-3/igt@kms_hdr@static-toggle-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-8/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451">i=
915#16451</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_15504/shard-rkl-6/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14712">i915#14712</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifi=
er-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-2/ig=
t@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-mod=
ifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_plane@pixel-format-4-ti=
led-mtl-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-7/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#=
3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
5504/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i9=
15#14259</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15504/shard-rkl-5/igt@kms_plane_multiple@tiling-4.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-ro=
tation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_plane_scaling@p=
lane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915=
#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504=
/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-contin=
uous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_psr2_=
sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9683">i915#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_15504/shard-rkl-4/igt@kms_psr2_su@frontbuffer-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-mmap-cpu.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"=
>i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-8/igt@kms_psr@fbc-psr-cu=
rsor-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-2/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1=
072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_15504/shard-rkl-6/igt@kms_psr@pr-cursor-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-8/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15949">i915#15949</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-6/igt@kms_psr_stress_test@invali=
date-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@kms_rotation_crc@primar=
y-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15867">i915#15867</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-90.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15867">i915#15867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_15504/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-90.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-dg2-10/igt@=
kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190=
">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/152=
43">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_vrr@flip-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1524=
3">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg1-14/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15504/shar=
d-dg1-18/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9906">i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15504/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-vrr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2436">i915#2436</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_15504/shard-rkl-3/igt@perf@gen8-unprivilege=
d-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg2-6/igt@perf_pmu@module-unload.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#1=
3029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15778">i915#15778</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15504/shard-dg2-1/igt@perf_pmu@module-unload.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778"=
>i915#15778</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18798/shard-dg1-15/igt@perf_pmu@module-unload.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#=
13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15778">i915#15778</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_15504/shard-dg1-19/igt@perf_pmu@module-unload.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1577=
8">i915#15778</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8997 -&gt; IGTPW_15504</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18798: e6db87755f42426899dd6ca45f97eb1b98e2f9fc @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_15504: 535da2d9ed8be27b85bf18463e6cb8f4482c953b @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8997: 8997<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2557561520605876119==--
